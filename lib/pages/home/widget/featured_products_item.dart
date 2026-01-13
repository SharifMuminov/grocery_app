import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/extensions/context_extensions.dart';

class FeaturedProductsItem extends StatefulWidget {
  const FeaturedProductsItem({
    super.key,
    required this.data,
    required this.onTab,
  });

  final Map<String, dynamic> data;
  final VoidCallback onTab;

  @override
  State<FeaturedProductsItem> createState() => _FeaturedProductsItemState();
}

class _FeaturedProductsItemState extends State<FeaturedProductsItem> {
  int _count = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTab,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: .circular(2),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: .center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: widget.data["color"],
                        shape: .circle,
                      ),
                    ),
                    Align(
                      alignment: .bottomCenter,
                      child: Image.asset(widget.data["image"], width: 95),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.data["price"],
                  style: TextStyle(
                    color: Color(0xFF6CC51D),
                    fontWeight: .w500,
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.data["name"],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: .w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  widget.data["sub_title"],
                  style: TextStyle(
                    color: Color(0xFF868889),
                    fontWeight: .w500,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Container(
                  width: context.width,
                  height: 1,
                  color: Color(0xFFEBEBEB),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: _count == 0
                      ? CupertinoButton(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          onPressed: () {
                            setState(() {
                              _count++;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/basket.svg",
                                width: 15,
                              ),
                              SizedBox(width: 9),
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: .w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  _count--;
                                });
                              },
                              padding: .zero,
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFF6CC51D),
                              ),
                            ),
                            Text(
                              _count.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: .w500,
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  _count++;
                                });
                              },
                              padding: .zero,
                              child: Icon(Icons.add, color: Color(0xFF6CC51D)),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: .topCenter,
          child: Row(
            crossAxisAlignment: .start,
            children: [
              if (widget.data["top_title"] != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: Color(0xFFFDEFD5)),
                  child: Text(
                    widget.data["top_title"],
                    style: TextStyle(
                      fontWeight: .w500,
                      fontSize: 10,
                      color: Color(0xFFE8AD41),
                    ),
                  ),
                )
              else if (widget.data["discount_price"] != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: Color(0xFFFEE4E4)),
                  child: Text(
                    widget.data["discount_price"],
                    style: TextStyle(
                      fontWeight: .w500,
                      fontSize: 10,
                      color: Color(0xFFF56262),
                    ),
                  ),
                ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: Icon(
                  _isFavorite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: _isFavorite ? Color(0xFFFE585A) : Color(0xFF868889),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
