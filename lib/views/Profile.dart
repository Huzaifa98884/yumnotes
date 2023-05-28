import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/PremiumScreen.dart';
import 'package:yumnotes/widgets/authTextField.dart';
import 'package:yumnotes/widgets/buttonWidget.dart';
import 'package:yumnotes/widgets/premiumBanner.dart';
import 'package:yumnotes/widgets/textWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();

  bool plan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppbarBg,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(
                        "https://freepngimg.com/thumb/man/22654-6-man-thumb.png"),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextWidget(
                    text: "Jhon Abraham",
                    size: 20.sp,
                    color: kAppbarText,
                    weight: FontWeight.w600,
                    align: TextAlign.center,
                  ),
                  TextWidget(
                    text: "@jhonabraham",
                    size: 12.sp,
                    color: kAppbarText,
                    weight: FontWeight.w300,
                    align: TextAlign.center,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: InkWell(
                      child: SecondaryButtonWidget(text: "Edit Profile"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        TextWidget(
                          text: "Personal Information",
                          size: 20.sp,
                          color: primaryText,
                          weight: FontWeight.w600,
                          align: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextWidget(
                          text: "Full Name",
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
                          text: "John Abraham",
                          controller: _emailcontroller,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextWidget(
                          text: "Email address",
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
                          text: "JohnDoe@gmail.com",
                          controller: _emailcontroller,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextWidget(
                          text: "Address",
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
                          text: "33 street west subidbazar,sylhet",
                          controller: _addresscontroller,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: ButtonWidget(text: "Change Password"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextWidget(
                          text: "Subscription Details",
                          size: 20.sp,
                          color: primaryText,
                          weight: FontWeight.w600,
                          align: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PricingCard(
                                text1: "Lifetime access",
                                text2: "Normal Price",
                                price: "24€",
                                select: false,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PremiumScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: yellowcol,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 2.h),
                                  child: Center(
                                    child: TextWidget(
                                      text: "Change Plan",
                                      color: kAppbarText,
                                      size: 10.0.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
