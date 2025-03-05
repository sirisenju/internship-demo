import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoptreo_v1/components/colors/app_colors.dart';

import '../../components/text-fields/custom-textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/loginBg.png")
              ),
            ),
          ),

          //column
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  SvgPicture.asset("assets/Arrow-Left.svg", width: 12.05, height: 15,),
                  SizedBox(height: 40,),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome Back",
                          style: TextStyle(
                              fontFamily: "Filson.Pro",
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryOrange
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Enter your login details to access your shoptreo account.",
                          style: TextStyle(
                              fontFamily: "Filson.Pro",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(imagePath: 'assets/mail-open-outline.svg', hintText: 'Email', isPassword: false,),
                        SizedBox(height: 30,),
                        CustomTextField(imagePath: 'assets/eye-off-outline.svg', hintText: 'Password', isPassword: true,),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Create Account", style: TextStyle(
                              fontFamily: "Filson.Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryOrange
                            ),
                            ),
                            Text("Forgot Password?", style: TextStyle(
                              fontFamily: "Filson.Pro",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryOrange,
                            fixedSize: Size(screenWidth, 50),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                            onPressed: (){
                              Navigator.pushNamed(context, '/routing');
                            },
                            child: Text(
                          "CONTINUE",
                        )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
