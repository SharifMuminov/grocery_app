import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/extensions/context_extensions.dart';
import 'package:grocery_app/pages/my_address/widget/my_address_item_text_field.dart';

class MyCardItem extends StatelessWidget {
  const MyCardItem({
    super.key,
    this.isOpenMore = false,
    this.isDefault = true,
    required this.onChangedSwitch,
    required this.onTabMore,
  });

  final bool isOpenMore;
  final bool isDefault;
  final ValueChanged<bool> onChangedSwitch;
  final VoidCallback onTabMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabMore,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: context.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.17),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDefault)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFEBFFD7),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  "DEFAULT",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xFF6CC51D),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                left: 19,
                right: 19,
                top: isOpenMore ? 20 : 17,
                bottom: isOpenMore ? 20 : 23,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(12),
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/master_card.svg"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Master Card",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "XXXX  XXXX  XXXX  5678",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF868889),
                          ),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Expiry: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                children: [
                                  TextSpan(
                                    text: "01/22",
                                    style: TextStyle(fontWeight: .w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            RichText(
                              text: TextSpan(
                                text: "CVV: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                children: [
                                  TextSpan(
                                    text: "908",
                                    style: TextStyle(fontWeight: .w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(2),
                      side: BorderSide(color: Color(0xFF6CC51D), width: 1),
                      minimumSize: Size.zero,
                    ),
                    onPressed: onTabMore,
                    icon: Icon(
                      isOpenMore
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      color: Color(0xFF6CC51D),
                    ),
                  ),
                ],
              ),
            ),

            ClipRect(
              child: AnimatedSize(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: ConstrainedBox(
                  constraints: isOpenMore
                      ? BoxConstraints()
                      : BoxConstraints(maxHeight: 0),
                  child: Column(
                    children: [
                      Divider(color: Color(0xFFEBEBEB)),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 30,
                          bottom: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyAddressItemTextField(
                              hintText: 'Name on the card',
                              icon: CupertinoIcons.profile_circled,
                            ),
                            MyAddressItemTextField(
                              hintText: 'Card number',
                              icon: CupertinoIcons.creditcard,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyAddressItemTextField(
                                    hintText: 'Month / Year',
                                    icon: CupertinoIcons.calendar,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: MyAddressItemTextField(
                                    hintText: 'CVV',
                                    icon: CupertinoIcons.lock,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  alignment: Alignment.centerLeft,
                                  child: CupertinoSwitch(
                                    activeTrackColor: Color(0xFF6CC51D),
                                    value: isDefault,
                                    onChanged: onChangedSwitch,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Make default",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
