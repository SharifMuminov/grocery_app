import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/extensions/context_extensions.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: .center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              width: context.width,
              height: 150,
              color: Colors.white,
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/user_image.png",
                        width: 114,
                        height: 114,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                      padding: EdgeInsets.zero,
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF28B446),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.camera_fill,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          "Elon Musk",
          style: TextStyle(
            fontWeight: .w700,
            fontSize: 15,
            color: Colors.black,
            height: 0.8,
          ),
        ),
        Text(
          "elonMusk@gmail.com",
          style: TextStyle(
            fontWeight: .w400,
            fontSize: 12,
            color: Color(0xFF868889),
          ),
        ),
      ],
    );
  }
}
