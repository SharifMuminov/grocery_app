import 'package:flutter/material.dart';
import 'package:grocery_app/pages/detail_product/detail_product_page.dart';
import 'package:grocery_app/pages/home/widget/featured_products_item.dart';

class FeaturedProductsView extends StatefulWidget {
  const FeaturedProductsView({super.key});

  @override
  State<FeaturedProductsView> createState() => _FeaturedProductsViewState();
}

class _FeaturedProductsViewState extends State<FeaturedProductsView> {
  final List<Map<String, dynamic>> _featuredProductsMockData = [
    {
      "name": "Fresh Peach",
      "price": "\$8.00",
      "color": Color(0xFFFFCEC1),
      "image": "assets/images/fresh_peach.png",
      "sub_title": "dozen",
    },
    {
      "name": "Avacoda",
      "price": "\$7.00",
      "color": Color(0xFFFCFFD9),
      "image": "assets/images/avacoda.png",
      "sub_title": "2.0 lbs",
      "top_title": "new",
    },
    {
      "name": "Pineapple",
      "price": "\$9.90",
      "color": Color(0xFFFCFFD9),
      "image": "assets/images/pineapple.png",
      "sub_title": "1.50 lbs",
    },
    {
      "name": "Black Grapes",
      "price": "\$7.05",
      "color": Color(0xFFFEE1ED),
      "image": "assets/images/black_grapes.png",
      "sub_title": "5.0 lbs",
      "discount_price": "-16%",
    },

    {
      "name": "Fresh Peach",
      "price": "\$8.00",
      "color": Color(0xFFFFCEC1),
      "image": "assets/images/fresh_peach.png",
      "sub_title": "dozen",
    },
    {
      "name": "Pomegranate",
      "price": "\$2.09",
      "color": Color(0xFFFEE1ED),
      "image": "assets/images/pomegranate.png",
      "sub_title": "1.50 lbs",
      "top_title": "new",
    },
    {
      "name": "Avacoda",
      "price": "\$7.00",
      "color": Color(0xFFFCFFD9),
      "image": "assets/images/avacoda.png",
      "sub_title": "2.0 lbs",
      "top_title": "new",
    },
    {
      "name": "Pineapple",
      "price": "\$9.90",
      "color": Color(0xFFFCFFD9),
      "image": "assets/images/pineapple.png",
      "sub_title": "1.50 lbs",
    },

    // {
    //   "name": "Fresh Broccoli",
    //   "price": "\$3.00",
    //   "color": Color(0xFFD2FFD0),
    //   "image": "assets/images/fresh_broccoli.png",
    //   "sub_title": "1 kg",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 17, right: 17, bottom: 110),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return FeaturedProductsItem(
            data: _featuredProductsMockData[index],
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailProductPage();
                  },
                ),
              );
            },
          );
        }, childCount: _featuredProductsMockData.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 18,
          mainAxisExtent: 240,
        ),
      ),
    );
  }
}
