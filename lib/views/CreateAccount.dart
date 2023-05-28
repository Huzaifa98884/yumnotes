import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/widgets/authTextField.dart';
import 'package:yumnotes/widgets/buttonWidget.dart';
import 'package:yumnotes/widgets/textWidget.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _namecontroller = TextEditingController();
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                text: "Enter your full name",
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
                text: "Eg namaemail@emailkamu.com",
                controller: _emailcontroller,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextWidget(
                text: "Password",
                size: 13.sp,
                weight: FontWeight.w600,
                color: Color(0xff374151),
                align: TextAlign.left,
              ),
              SizedBox(
                height: 1.h,
              ),
              AuthTextField(
                obsecureText: true,
                text: "Enter your password",
                controller: _passwordcontroller,
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {},
                child: ButtonWidget(text: "Registration"),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {},
                child: SecondaryButtonWidget(text: "Login with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
