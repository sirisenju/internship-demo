import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:shoptreo_v1/Screens/Onboarding/onboardingContent.dart";
import "package:dots_indicator/dots_indicator.dart";
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isLastPage = false;

  final List<OnboardingContent> content = [
    OnboardingContent(
        heading: "Access Credit",
        subHeading: "Provides SME's easy access to retail financing solutions for scalable business growth"
    ),
    OnboardingContent(
        heading: "Access Loans",
        subHeading: "Provides SME's easy access to retail financing solutions for scalable business growth"
    ),
    OnboardingContent(
        heading: "Access Savings",
        subHeading: "Provides SME's easy access to retail financing solutions for scalable business growth"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage("assets/onboardingBg.png")
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/overlayGradient.png")
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 60,),
              //skip butt for next
              Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          _pageController.jumpToPage(2);
                        },
                          child: Text("Skip", style: TextStyle(color: Colors.white),))
                  )
              ),
              Expanded(
                  flex: 1,
                  child: PageView.builder(
                    itemCount: content.length,
                    controller: _pageController,
                    onPageChanged: (index){
                      setState(() => isLastPage = index == 2);
                    },
                    itemBuilder: (context, index) {
                      return OnboardingContent(
                      heading: content[index].heading,
                      subHeading: content[index].subHeading
                      );
                    },
                  ),
              ),

              //dot and next button
              SizedBox(height: 20,),
              Row(
                children: [
                  //dots
                  SmoothPageIndicator(
                      controller: _pageController,
                      count: content.length,
                    effect: ExpandingDotsEffect(
                        spacing: 8.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: Colors.white,
                        activeDotColor: Colors.yellow
                    ),
                  ),

                  //buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder()
                    ),
                      onPressed: (){
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                      },
                      child: SvgPicture.asset("assets/arror-right.svg")
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
