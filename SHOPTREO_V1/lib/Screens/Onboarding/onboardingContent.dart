import "package:flutter/material.dart";

class OnboardingContent extends StatelessWidget {
  final String heading;
  final String subHeading;
  const OnboardingContent({super.key,
    required this.heading,
    required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Filson.Pro",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
        ),
        SizedBox(height: 8,),
        Text(
            subHeading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Filson.Pro",
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
        )
      ],
    );
  }
}

