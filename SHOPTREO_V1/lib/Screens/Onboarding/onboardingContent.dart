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
        Text(heading, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8,),
        Text(subHeading, style: TextStyle(color: Colors.white))
      ],
    );
  }
}

