import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/SingleRestaurant.dart';
import 'package:yumnotes/widgets/customAppbar.dart';
import 'package:yumnotes/widgets/textWidget.dart';

class MyRestaurantsScreen extends StatefulWidget {
  const MyRestaurantsScreen({super.key});

  @override
  State<MyRestaurantsScreen> createState() => _MyRestaurantsScreenState();
}

class _MyRestaurantsScreenState extends State<MyRestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My Restaurents", icon: true),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "My Restaurents",
                  size: 20.sp,
                  color: primaryText,
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage("assets/Res1.png"),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Ambrosia Restaurant",
                                size: 13.sp,
                                color: primaryText,
                                weight: FontWeight.w600,
                                align: TextAlign.left,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                horizontalTitleGap: 0,
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 20.sp,
                                ),
                                title: TextWidget(
                                  text: "kazi Deiry, Taiger Pass Chittagong",
                                  size: 9.sp,
                                  weight: FontWeight.w400,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SingleRestaurantScreen(),
                                ),
                              );
                            },
                            child: Image(
                              image: AssetImage("assets/viewicon.png"),
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage("assets/Res2.png"),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Haatkhola",
                                size: 13.sp,
                                color: primaryText,
                                weight: FontWeight.w600,
                                align: TextAlign.left,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                horizontalTitleGap: 0,
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 20.sp,
                                ),
                                title: TextWidget(
                                  text: "6 Surson Road, Chittagong",
                                  size: 9.sp,
                                  weight: FontWeight.w400,
                                  color: Color(0xff6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage("assets/viewicon.png"),
                              width: 35,
                              height: 35,
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
      ),
    );
  }
}
