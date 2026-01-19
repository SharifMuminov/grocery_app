import 'package:flutter/material.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    super.key,
    required this.title,
    required this.rightTitle,
    required this.isActive,
    this.isFirst = false,
  });

  final String title;
  final String rightTitle;
  final bool isActive;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .end,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  color: isActive ? Color(0xFF6CC51D) : Color(0xFFEBEBEB),
                ),
              ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF6CC51D) : Color(0xFFEBEBEB),
                shape: .circle,
              ),
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: .ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: .w700,
              color: isActive ? Colors.black : Color(0xFF868889),
              height: .9,
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          rightTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: .w400,
            color: Color(0xFF868889),
            height: .9,
          ),
        ),
      ],
    );
  }
}
