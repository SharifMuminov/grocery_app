import 'package:flutter/material.dart';
import 'package:grocery_app/extensions/context_extensions.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.isShowIcon = false,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final bool isShowIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 46),
      width: context.width,
      height: context.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: .cover,
          image: AssetImage(imagePath),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              title,
              textAlign: .center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: .w800,
                fontSize: 30,
              ),
            ),
            if (isShowIcon)
              Image.asset(
                "assets/images/onboarding_one_icon.png",
                width: 127,
                height: 50,
                fit: .cover,
              ),

            SizedBox(height: 14),
            Text(
              subTitle,
              textAlign: .center,
              style: TextStyle(
                color: Color(0xFF868889),
                fontWeight: .w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
