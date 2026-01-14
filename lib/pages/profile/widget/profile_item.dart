import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.iconsPath,
    required this.onTab,
    this.iconWidth = 20,
    this.iconHeight = 20,
  });

  final String title;
  final String iconsPath;
  final VoidCallback onTab;
  final num iconWidth;
  final num iconHeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: .zero),
      ),
      onPressed: onTab,
      child: Row(
        children: [
          SvgPicture.asset(
            iconsPath,
            width: iconWidth.toDouble(),
            height: iconWidth.toDouble(),
            colorFilter: ColorFilter.mode(Color(0xFF28B446), BlendMode.srcIn),
          ),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: .w700,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF868889)),
        ],
      ),
    );
  }
}
