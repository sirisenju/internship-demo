import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:shoptreo_v1/Screens/Onboarding/onboardingContent.dart";
import "package:shoptreo_v1/components/colors/app_colors.dart";
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

  bool? isLastPage = false;

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
              SizedBox(height: 70,),
              //skip butt for next
              Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          _pageController.jumpToPage(2);
                        },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, top: 20),
                            child: Text("Skip",
                              style:  TextStyle(
                                fontFamily: "Filson.Pro",
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            ),
                          )
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: content.length,
                          controller: _pageController,
                          onPageChanged: (index){
                            setState(() => isLastPage = index == 2);
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25),
                              child: OnboardingContent(
                              heading: content[index].heading,
                              subHeading: content[index].subHeading
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    activeDotColor: AppColors.primaryOrange
                                ),
                              ),

                              //buttons
                              isLastPage! ?
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: AppColors.primaryOrange,
                                    fixedSize: Size(65, 65)
                                  ),
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: SvgPicture.asset("assets/arror-right.svg")
                              ) : SizedBox(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
              ),
              SizedBox(height: 60,),
            ],
          ),
        ],
      ),
    );
  }
}
