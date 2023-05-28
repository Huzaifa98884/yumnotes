import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/Login.dart';
import 'package:yumnotes/widgets/buttonWidget.dart';
import 'package:yumnotes/widgets/textWidget.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool monthlySelected = false;
  bool yearlySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset("assets/mainimg.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 5.h, 4.w, 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Buy Premium Package",
                          size: 15.sp,
                          weight: FontWeight.w600,
                          color: secondaryText,
                          align: TextAlign.left,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Divider(
                            color: secondaryText,
                            thickness: 2,
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    monthlySelected = true;
                                    yearlySelected = false;
                                  });
                                },
                                child: PricingCard(
                                  text1: "Monthly",
                                  text2: "Normal Price",
                                  price: "0,99€",
                                  select: monthlySelected,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    monthlySelected = false;
                                    yearlySelected = true;
                                  });
                                },
                                child: PricingCard(
                                    select: yearlySelected,
                                    text1: "Lifetime access",
                                    text2: "Normal Price",
                                    price: "24€"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextWidget(
                          text: "Premium Features",
                          size: 16.sp,
                          weight: FontWeight.w600,
                          color: secondaryText,
                          align: TextAlign.left,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Divider(
                            color: secondaryText,
                            thickness: 2,
                            height: 20,
                          ),
                        ),
                        Features(
                          text: "No more ads",
                        ),
                        Features(
                          text:
                              "Family access so that they can use the same account on several devices and everyone has access to the notes",
                        ),
                        Features(
                          text:
                              "Saved information because the notes are saved on the account and if the user's device gets broken he can simply log in on the new device and still has all of his data",
                        ),
                        Features(
                          text: "Notes without limitations",
                        ),
                        Features(
                          text:
                              "The restaurants stats of how much people are visiting a restaurant at a specific time and day",
                        ),
                        SizedBox(height: 3.h),
                        SecondaryButtonWidget(text: "Just Remove Ads | \$x"),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child:
                              ButtonWidget(text: "Get Lifetime Premium Access"),
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

class PricingCard extends StatelessWidget {
  PricingCard(
      {required this.text1,
      required this.text2,
      required this.price,
      required this.select});

  final text1;
  final text2;
  final price;
  bool select;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFF8F3),
          borderRadius: BorderRadius.circular(20),
          border: select == true
              ? Border.all(color: Color(0xffC45911), width: 1.5)
              : Border.all(color: Color(0xffFFF8F3), width: 1.5)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.h),
        child: Column(
          children: [
            TextWidget(
              text: text1,
              size: 13.sp,
              weight: FontWeight.w600,
              color: secondaryText,
              align: TextAlign.left,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            TextWidget(
              text: price,
              size: 23.sp,
              weight: FontWeight.w600,
              color: secondaryText,
              align: TextAlign.left,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            TextWidget(
              text: text2,
              size: 11.sp,
              weight: FontWeight.w500,
              color: secondaryText,
              align: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(Icons.check_circle, color: yellowcol),
      title: TextWidget(
        text: text,
        size: 11.sp,
        weight: FontWeight.w600,
        color: secondaryText,
      ),
    );
  }
}
