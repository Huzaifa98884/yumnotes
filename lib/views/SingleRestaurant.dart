import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/AddNote.dart';
import 'package:yumnotes/views/DeleteSuccess.dart';
import 'package:yumnotes/views/EditSuccess.dart';
import 'package:yumnotes/widgets/customAppbar.dart';
import 'package:yumnotes/widgets/textWidget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:yumnotes/constants/constants.dart';

class BarChartModel {
  String year;
  int financial;
  final charts.Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

class SingleRestaurantScreen extends StatefulWidget {
  const SingleRestaurantScreen({super.key});

  @override
  State<SingleRestaurantScreen> createState() => _SingleRestaurantScreenState();
}

class _SingleRestaurantScreenState extends State<SingleRestaurantScreen> {
  final List<BarChartModel> data = [
    BarChartModel(
      year: "Monday",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Color(0xffC45911)),
    ),
    BarChartModel(
      year: "Tuesday",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Color(0xffC45911)),
    ),
    BarChartModel(
      year: "Wednesday",
      financial: 950,
      color: charts.ColorUtil.fromDartColor(Color(0xffC45911)),
    ),
    BarChartModel(
      year: "Thursday",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Color(0xffC45911)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return Scaffold(
      appBar: CustomAppbar(title: "", icon: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: TextWidget(
                                text: "Ambrosia Restaurant",
                                size: 18.sp,
                                color: primaryText,
                                weight: FontWeight.w600,
                                align: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNoteScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: yellowcol,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.h),
                                  child: Center(
                                    child: TextWidget(
                                      text: "Add Note",
                                      color: kAppbarText,
                                      size: 10.0.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                              flex: 11,
                              child: TextWidget(
                                text: "kazi Deiry, Taiger Pass Chittagong",
                                size: 12.sp,
                                weight: FontWeight.w400,
                                align: TextAlign.left,
                                color: Color(0xff6B7280),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Image(
                image: AssetImage("assets/SRestaurant.png"),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.timer_rounded,
                                color: yellowcol,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              flex: 11,
                              child: TextWidget(
                                  text: "Open today",
                                  size: 12.sp,
                                  weight: FontWeight.w500,
                                  align: TextAlign.left,
                                  color: primaryText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        TextWidget(
                          text: "10:00 AM - 12:00 PM",
                          size: 12.sp,
                          weight: FontWeight.w600,
                          color: primaryText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.call,
                                color: yellowcol,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              flex: 11,
                              child: TextWidget(
                                  text: "+74278932893",
                                  size: 12.sp,
                                  weight: FontWeight.w600,
                                  align: TextAlign.left,
                                  color: primaryText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.location_on,
                                color: yellowcol,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              flex: 11,
                              child: TextWidget(
                                  text: "Visit the Restaurant",
                                  size: 12.sp,
                                  weight: FontWeight.w600,
                                  align: TextAlign.left,
                                  color: primaryText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.web_rounded,
                                color: yellowcol,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              flex: 11,
                              child: TextWidget(
                                  text: "ambrosia.com",
                                  size: 12.sp,
                                  weight: FontWeight.w600,
                                  align: TextAlign.left,
                                  color: primaryText),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
              TextWidget(
                text: "Notes",
                size: 18.sp,
                color: primaryText,
                weight: FontWeight.w600,
                align: TextAlign.left,
              ),
              SizedBox(
                height: 2.h,
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Set the desired border radius
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage("assets/Res1.png"),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "18/05/2023",
                              size: 10.sp,
                              color: Color(0xff6B7280),
                              weight: FontWeight.w400,
                              align: TextAlign.left,
                            ),
                            TextWidget(
                              text: "It was really good...",
                              size: 15.sp,
                              color: Color(0xff6B7280),
                              weight: FontWeight.w600,
                              align: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleRestaurantScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  elevation: 1,
                                  shadowColor: Color(0xffC45911),
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: yellowcol,
                                      size: 12.sp,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditSuccess(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Material(
                                  elevation: 1,
                                  shadowColor: Color(0xffC45911),
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: yellowcol,
                                      size: 12.sp,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DeleteSuccess(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Set the desired border radius
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: AssetImage("assets/Res1.png"),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "18/05/2023",
                              size: 10.sp,
                              color: Color(0xff6B7280),
                              weight: FontWeight.w400,
                              align: TextAlign.left,
                            ),
                            TextWidget(
                              text: "It was really good...",
                              size: 15.sp,
                              color: Color(0xff6B7280),
                              weight: FontWeight.w600,
                              align: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleRestaurantScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  elevation: 1,
                                  shadowColor: Color(0xffC45911),
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: yellowcol,
                                      size: 12.sp,
                                    ),
                                    onPressed: () {
                                      // Handle button press
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Material(
                                  elevation: 1,
                                  shadowColor: Color(0xffC45911),
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: yellowcol,
                                      size: 12.sp,
                                    ),
                                    onPressed: () {
                                      // Handle button press
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextWidget(
                text: "Give Feedback",
                size: 18.sp,
                color: primaryText,
                weight: FontWeight.w600,
                align: TextAlign.left,
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    size: 10.sp,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextWidget(
                text: "My Rating",
                size: 18.sp,
                color: primaryText,
                weight: FontWeight.w600,
                align: TextAlign.left,
              ),
              Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Set the desired border radius
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 20.sp,
                                color: Colors.amber,
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                elevation: 1,
                                shadowColor: Color(0xffC45911),
                                color: Colors.white,
                                shape: CircleBorder(),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: yellowcol,
                                    size: 12.sp,
                                  ),
                                  onPressed: () {
                                    // Handle button press
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 1,
                                shadowColor: Color(0xffC45911),
                                color: Colors.white,
                                shape: CircleBorder(),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: yellowcol,
                                    size: 12.sp,
                                  ),
                                  onPressed: () {
                                    // Handle button press
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
