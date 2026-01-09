import 'package:flutter/material.dart';
import 'package:grocery_app/pages/on_boarding/widget/on_boarding_item.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _activeOnboardingIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (v) {
              setState(() {
                _activeOnboardingIndex = v;
              });
            },
            children: [
              OnBoardingItem(
                isShowIcon: true,
                imagePath: "assets/images/onboarding_1.png",
                title: 'Welcome to',
                subTitle:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              ),
              OnBoardingItem(
                imagePath: "assets/images/onboarding_2.png",
                title: 'Buy Quality Dairy Products',
                subTitle:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              ),
              OnBoardingItem(
                imagePath: "assets/images/onboarding_3.png",
                title: 'Buy Premium Quality Fruits',
                subTitle:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              ),
              OnBoardingItem(
                imagePath: "assets/images/onboarding_4.png",
                title: 'Get Discounts On All Products',
                subTitle:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              ),
            ],
          ),
          Align(
            alignment: .bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: .min,
                children: [
                  Row(
                    mainAxisSize: .min,
                    children: List.generate((4), (index) {
                      return AnimatedContainer(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 2.5),
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: _activeOnboardingIndex == index
                              ? Color(0xFF6CC51D)
                              : Color(0xFFDCDCDC),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 30),
                  GradientButton(
                    text: 'Get started',
                    onPressed: () {
                      if (_activeOnboardingIndex == 3) {
                        //TODO: push to auth
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    margin: EdgeInsets.symmetric(horizontal: 17),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
