import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String imagePath;
  final String hintText;
  final bool isPassword;
  const CustomTextField({super.key, required this.imagePath, required this.hintText, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: SvgPicture.asset(imagePath, height: 24, width: 24, fit: BoxFit.scaleDown,),
          hintStyle: TextStyle(color: AppColors.greyTxt,
            fontFamily: "Filson.Pro",
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.txtFieldBorder)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.txtFieldBorder)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.txtFieldBorder
              )
          ),
        ),
        cursorColor: AppColors.greyTxt,
        obscureText: isPassword,
      ),
    );
  }
}
