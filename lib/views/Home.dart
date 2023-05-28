import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image/image.dart' as img;
import 'package:yumnotes/constants/customWindowInfo.dart';

import '../widgets/customAppbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late GoogleMapController _controller;
  loc.Location _locationTracker = loc.Location();
  loc.LocationData? currentLocation;

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.0857495596205),
    zoom: 20,
  );
  List<Marker> _markers = [];

  String _selectedType = 'restaurant';
  String _selectedCuisine = 'any';
  bool _onlyOpenNow = false;

  List<String> _locationTypes = [
    'restaurant',
    'cafe',
    'bar',
    'bakery',
    'meal_delivery',
    'meal_takeaway'
  ];

  List<String> _cuisineTypes = [
    'any',
    'italian',
    'chinese',
    'mexican',
    'indian',
    // Add more cuisines as needed
  ];

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<Uint8List> getResizedImage() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('assets/restarunts-icon.jpg');

    img.Image? originalImage = img.decodeImage(byteData.buffer.asUint8List());

    int newWidth = 100; // Define the width you want here
    int newHeight =
        (originalImage!.height * newWidth / originalImage.width).round();

    img.Image resizedImage =
        img.copyResize(originalImage, width: newWidth, height: newHeight);

    return img.encodePng(resizedImage);
  }

  Future<void> _getLocationPermission() async {
    final hasPermission = await _locationTracker.requestPermission();
    if (hasPermission == loc.PermissionStatus.granted) {
      currentLocation = await _locationTracker.getLocation();
      _updateCameraPosition(currentLocation!);
    }
  }

  void _updateCameraPosition(loc.LocationData locationData) {
    if (_controller != null) {
      final newCameraPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 20,
      );
      _controller.moveCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      _addUserMarker(locationData.latitude!, locationData.longitude!);
    }
  }

  void _addUserMarker(double latitude, double longitude) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('user_marker'),
          position: LatLng(latitude, longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: "You are here"),
        ),
      );
    });
  }

  Future<void> _getFoodMarkers(double latitude, double longitude) async {
    _markers = _markers.sublist(0, 1);
    Uint8List imageData = await getResizedImage();
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=$_selectedType&key=AIzaSyAG7mcfJmUHPc7tBPAEyRPxa3hfslfdQT4';
    if (_onlyOpenNow) {
      url += '&opennow';
    }
    if (_selectedCuisine != 'any') {
      url += '&keyword=$_selectedCuisine';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final results = data['results'] as List<dynamic>;

      // Prepare a list of Futures for the Place Details requests
      List<Future<http.Response>> detailFutures = [];

      for (final result in results) {
        final placeId = result['place_id'];

        // Send a Place Details request for each place
        String detailUrl =
            'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyAG7mcfJmUHPc7tBPAEyRPxa3hfslfdQT4';

        // Add the Future to the list
        detailFutures.add(http.get(Uri.parse(detailUrl)));
      }

      // Execute all the Futures in parallel
      final detailResponses = await Future.wait(detailFutures);

      for (int i = 0; i < results.length; i++) {
        final result = results[i];
        final detailResponse = detailResponses[i];

        if (detailResponse.statusCode == 200) {
          final geometry = result['geometry']['location'];
          final lat = geometry['lat'];
          final lng = geometry['lng'];
          final name = result['name'];

          final detailData = jsonDecode(detailResponse.body);
          final detailResult = detailData['result'];
          final openingHours = detailResult['opening_hours'] != null
              ? detailResult['opening_hours']['weekday_text']
              : "No Opening Hours Detail";
          final phoneNumber = detailResult['formatted_phone_number'] ??
              "Phone number not available";
          final website = detailResult['website'] ?? "Website not available";
          final address =
              detailResult['formatted_address'] ?? "Address not available";
          final photoReference = detailResult['photos'] != null &&
                  detailResult['photos'].length > 0
              ? detailResult['photos'][0]['photo_reference']
              : null;
          final photoUrl = photoReference != null
              ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyAG7mcfJmUHPc7tBPAEyRPxa3hfslfdQT4'
              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhlWdTq9fBCD-1CAap_IgiTPntvnBgi3dHnQ&usqp=CAU';
          final marker = Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: CustomInfoWindow(
                        title: name,
                        imageUrl: photoUrl,
                        onButton1Pressed: () {
                          // Handle button 1 press
                          print("Details are:");
                          print(phoneNumber);
                          print(website);
                          print(address);
                          print(openingHours);
                          Navigator.pop(context); // Close the dialog
                        },
                        onButton2Pressed: () {
                          // Handle button 2 press
                          Navigator.pop(context); // Close the dialog
                        },
                        distance: "10 Mtr Left",
                      ),
                    ),
                  );
                },
              );
            },
            icon: BitmapDescriptor.fromBytes(imageData),
          );

          _markers.add(marker);
        }
      }

      setState(() {});
    } else {
      print('Failed to load restaurant data');
    }
  }

  void _toggleAnimation() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My Restaurents", icon: true),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: initialLocation,
            markers: Set<Marker>.of(_markers),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
          SlideTransition(
            position: _offsetAnimation,
            child: Column(
              children: [
                DropdownButton<String>(
                  value: _selectedType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                      _getFoodMarkers(currentLocation!.latitude!,
                          currentLocation!.longitude!);
                    });
                  },
                  items: _locationTypes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _selectedCuisine,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCuisine = newValue!;
                      _getFoodMarkers(currentLocation!.latitude!,
                          currentLocation!.longitude!);
                    });
                  },
                  items: _cuisineTypes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                CheckboxListTile(
                  title: Text('Show only open locations'),
                  value: _onlyOpenNow,
                  onChanged: (bool? value) {
                    setState(() {
                      _onlyOpenNow = value!;
                      _getFoodMarkers(currentLocation!.latitude!,
                          currentLocation!.longitude!);
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              child: Icon(Icons.location_searching),
              backgroundColor: Colors.blue,
              heroTag: 1,
              onPressed: () async {
                currentLocation = await _locationTracker.getLocation();
                _updateCameraPosition(currentLocation!);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        onPressed: _toggleAnimation,
      ),
    );
  }
}
