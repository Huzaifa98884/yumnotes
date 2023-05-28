import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/widgets/authTextField.dart';
import 'package:yumnotes/widgets/buttonWidget.dart';
import 'package:yumnotes/widgets/customAppbar.dart';
import 'package:yumnotes/widgets/textWidget.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _notecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Add Note", icon: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: Column(
            children: [
              TextWidget(
                text: "Ambrosia Restaurant",
                size: 18.sp,
                color: primaryText,
                weight: FontWeight.w600,
                align: TextAlign.left,
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              TextWidget(
                text: "Add Notes",
                size: 18.sp,
                color: primaryText,
                weight: FontWeight.w600,
                align: TextAlign.left,
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Title",
                    size: 13.sp,
                    weight: FontWeight.w600,
                    color: Color(0xff374151),
                    align: TextAlign.left,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  AuthTextField(
                    obsecureText: false,
                    text: "Enter title",
                    controller: _titlecontroller,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextWidget(
                    text: "Note",
                    size: 13.sp,
                    weight: FontWeight.w600,
                    color: Color(0xff374151),
                    align: TextAlign.left,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  AuthTextField(
                    obsecureText: false,
                    text: "Enter note",
                    controller: _notecontroller,
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(child: ButtonWidget(text: "Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
