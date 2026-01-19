import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isActive,
    this.onTab,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onTab;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 19),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: .circular(2)),
        ),
        onPressed: onTab,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: .w700,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: TextStyle(
                      fontWeight: .w500,
                      fontSize: 10,
                      color: Color(0xFF868889),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 28,
              child: Transform.scale(
                scale: 0.8,
                alignment: Alignment.centerLeft,
                child: CupertinoSwitch(
                  activeTrackColor: Color(0xFF6CC51D),
                  value: isActive,
                  onChanged: (v) {
                    onTab?.call();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
