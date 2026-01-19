import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 25),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: .circular(2)),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Container(
              padding: .all(10),
              width: 56,
              height: 56,
              alignment: AlignmentGeometry.center,
              decoration: BoxDecoration(
                shape: .circle,
                color: Color(0xFFF5F5F5),
              ),
              child: SvgPicture.asset("assets/icons/master_card.svg"),
            ),
            SizedBox(width: 22),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Master Card",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Dec 12 2021 at 10:00 pm",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: .w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Text(
              "\$89",
              style: TextStyle(
                fontSize: 15,
                fontWeight: .w700,
                color: Color(0xFF28B446),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
