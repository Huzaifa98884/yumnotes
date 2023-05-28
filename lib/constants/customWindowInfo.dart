import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yumnotes/constants/constants.dart';

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;
  final String distance;

  CustomInfoWindow(
      {required this.title,
      required this.imageUrl,
      required this.onButton1Pressed,
      required this.onButton2Pressed,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width *
          0.8, // Adjust the width according to your needs
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                  minFontSize: 8,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  distance,
                  style: const TextStyle(color: Colors.lightGreenAccent),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Visit the Restarunt",
                      style: TextStyle(color: kButtonBac)),
                ),
                Row(
                  children: [
                    IconButton(
                      color: kButtonBac,
                      onPressed: onButton1Pressed,
                      icon: const ImageIcon(AssetImage("assets/Love.png")),
                    ),
                    IconButton(
                      color: kButtonBac,
                      onPressed: onButton2Pressed,
                      icon: const ImageIcon(AssetImage("assets/add-icon.png")),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
