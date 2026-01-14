import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/pages/categories/categories_page.dart';

class HomeCategoryView extends StatefulWidget {
  const HomeCategoryView({super.key});

  @override
  State<HomeCategoryView> createState() => _HomeCategoryViewState();
}

class _HomeCategoryViewState extends State<HomeCategoryView> {
  final List<Map<String, dynamic>> _categoryMockData = [
    {
      "title": "Vegetables",
      "icon": "assets/icons/vegetables.svg",
      "color": Color(0xFFE6F2EA),
    },
    {
      "title": "Fruits",
      "icon": "assets/icons/fruits.svg",
      "color": Color(0xFFFFE9E5),
    },
    {
      "title": "Beverages",
      "icon": "assets/icons/beverages.svg",
      "color": Color(0xFFFFF6E3),
    },
    {
      "title": "Grocery",
      "icon": "assets/icons/grocery.svg",
      "color": Color(0xFFF3EFFA),
    },
    {
      "title": "Edible oil",
      "icon": "assets/icons/edible_oil.svg",
      "color": Color(0xFFDCF4F5),
    },
    {
      "title": "Household",
      "icon": "assets/icons/household.svg",
      "color": Color(0xFFFFE8F2),
    },
    {
      "title": "Babycare",
      "icon": "assets/icons/babycare.svg",
      "color": Color(0xFFD2EFFF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 2),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: .bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CategoriesPage();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF868889),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 7),
              scrollDirection: .horizontal,
              child: Row(
                children: List.generate(_categoryMockData.length, (index) {
                  return CupertinoButton(
                    padding: .symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: _categoryMockData[index]["color"],
                          ),
                          child: SvgPicture.asset(
                            _categoryMockData[index]["icon"]!,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Text(
                          _categoryMockData[index]["title"],
                          style: TextStyle(
                            color: Color(0xFF868889),
                            fontSize: 15,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
