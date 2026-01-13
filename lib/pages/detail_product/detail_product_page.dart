import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/extensions/context_extensions.dart';
import 'package:grocery_app/pages/detail_product/widget/detail_product_add_cart_button.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  bool _isFavorite = false;
  bool _isExpanded = false;
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: context.height / 2.2,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3748)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Positioned(
                    left: -60,
                    right: -60,
                    bottom: -70,
                    child: Container(
                      width: context.width,
                      height: context.height,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2FFE6),
                        shape: .circle,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/organic_lemons.png",
                    width: 324,
                    height: 324,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: .bottomCenter,
                    child: Container(
                      width: context.width,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F5F9),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 40),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "\$2.22",
                        style: TextStyle(
                          color: Color(0xFF28B446),
                          fontSize: 18,
                          fontWeight: .w700,
                        ),
                      ),
                      CupertinoButton(
                        padding: .zero,
                        child: Icon(
                          _isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: _isFavorite
                              ? Color(0xFFFE585A)
                              : Color(0xFF868889),
                          size: 26,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Organic Lemons",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: .w800,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "1.50 lbs",
                    style: TextStyle(
                      color: Color(0xFF868889),
                      fontWeight: .w500,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: .w500,
                          fontSize: 12,
                        ),
                      ),

                      ...List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: Color(0xFFFFC107),
                          weight: 10,
                        );
                      }),
                      Text(
                        "(89 reviews)",
                        style: TextStyle(
                          color: Color(0xFF868889),
                          fontWeight: .w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  _getTruncatedText(
                    text:
                        """Organic Mountain works as a seller for many organic growers of organic lemons.
Organic lemons are easy to spot in your produce aisle.
They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin.
Organic lemons are considered to be the world's finest lemon for juicing.

These lemons are grown without synthetic pesticides or fertilizers.
Their bright yellow color and zesty aroma make them perfect for culinary use.
Organic lemons retain more natural flavor and nutrients compared to conventional lemons.
Chefs and home cooks alike prefer them for beverages, desserts, and dressings.

When stored properly, they last longer and maintain their freshness.
Each lemon is hand-picked and carefully packed to ensure quality.
By choosing organic lemons, you support sustainable farming practices.
Enjoy the natural taste and health benefits of Organic Mountain lemons in every slice.""",
                    style: TextStyle(color: Color(0xFF868889), fontSize: 14),
                    maxWidth: context.width,
                    maxLines: 7,
                    moreStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: .w600,
                      height: 1.18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.only(left: 17),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                            color: Color(0xFF868889),
                            fontWeight: .w500,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            if (_count == 1) return;
                            setState(() {
                              _count--;
                            });
                          },
                          icon: Icon(Icons.remove, color: Color(0xFF6CC51D)),
                        ),

                        Container(
                          width: 1,
                          height: double.infinity,
                          color: Color(0xFFEBEBEB),
                        ),
                        SizedBox(
                          width: 50,
                          child: Align(
                            child: Text(
                              _count.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: .w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: double.infinity,
                          color: Color(0xFFEBEBEB),
                        ),
                        IconButton(
                          onPressed: () {
                            if (_count == 99) return;
                            setState(() {
                              _count++;
                            });
                          },
                          icon: Icon(Icons.add, color: Color(0xFF6CC51D)),
                        ),
                      ],
                    ),
                  ),
                  DetailProductAddCartButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTruncatedText({
    required String text,
    required TextStyle style,
    required TextStyle moreStyle,
    required double maxWidth,
    required int maxLines,
  }) {
    final span = TextSpan(text: text, style: style);
    final tp = TextPainter(
      text: span,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: maxWidth);

    // Agar matn kichik bo'lsa yoki expanded bo'lsa, to'liq ko'rsat
    if (!tp.didExceedMaxLines || _isExpanded) {
      return Text(text, style: style);
    }

    // Calculate how much text can fit, accounting for "... more"
    final moreText = '... more';
    final moreWidth = TextPainter(
      text: TextSpan(text: moreText, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    var end = text.length;
    var truncatedText = text;

    while (end > 0) {
      truncatedText = text.substring(0, end);
      final testSpan = TextSpan(text: '$truncatedText... ', style: style);
      final testTp = TextPainter(
        text: testSpan,
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
      );
      testTp.layout(maxWidth: maxWidth - moreWidth.width);

      if (!testTp.didExceedMaxLines) {
        break;
      }
      end -= 5;
    }

    truncatedText = truncatedText.trimRight();
    if (truncatedText.endsWith(',') ||
        truncatedText.endsWith('.') ||
        truncatedText.endsWith('!') ||
        truncatedText.endsWith('?')) {
      truncatedText = truncatedText.substring(0, truncatedText.length - 1);
    }

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: truncatedText),
          const TextSpan(text: ' '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = true;
                });
              },
              child: Text('more', style: moreStyle),
            ),
          ),
        ],
      ),
    );
  }
}
