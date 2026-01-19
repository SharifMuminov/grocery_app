import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/pages/my_order/widget/order_status_item.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({
    super.key,
    this.onTabMore,
    this.isOpenMore = false,
    this.isFinalStatus = false,
  });

  final bool isOpenMore;
  final bool isFinalStatus;
  final VoidCallback? onTabMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabMore,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(2),
        ),
        child: Column(
          children: [
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
                    width: 66,
                    height: 66,
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBFFD7),
                      shape: .circle,
                    ),
                    child: SvgPicture.asset("assets/icons/order_icon.svg"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Order #90897",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: .w700,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Placed on Octobar 19 2021",
                          style: TextStyle(
                            color: Color(0xFF868889),
                            fontWeight: .w500,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Items: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                children: [
                                  TextSpan(
                                    text: "10",
                                    style: TextStyle(fontWeight: .w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 14),
                            RichText(
                              text: TextSpan(
                                text: "Items: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                children: [
                                  TextSpan(
                                    text: "\$16.90",
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderStatusItem(
                              title: "Order placed",
                              rightTitle: 'Oct 19 2021',
                              isActive: true,
                              isFirst: true,
                            ),
                            OrderStatusItem(
                              title: "Order confirmed",
                              rightTitle: 'Oct 20 2021',
                              isActive: true,
                            ),
                            OrderStatusItem(
                              title: "Order shipped",
                              rightTitle: 'Oct 20 2021',
                              isActive: true,
                            ),
                            OrderStatusItem(
                              title: "Out for delivery",
                              rightTitle: 'pending',
                              isActive: false,
                            ),
                            OrderStatusItem(
                              title: "Order delivered",
                              rightTitle: 'pending',
                              isActive: false,
                            ),
                            // SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isFinalStatus && !isOpenMore)
              Column(
                children: [
                  Divider(color: Color(0xFFEBEBEB)),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 6,
                      bottom: 14,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                        SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            "Order Delivered",
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: .w700,
                              color: Color(0xFF868889),
                              height: .9,
                            ),
                          ),
                        ),
                        Text(
                          "Aug 29 2021",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: .w400,
                            color: Color(0xFF868889),
                            height: .9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
