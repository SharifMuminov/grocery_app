import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/my_order/widget/my_order_item.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  int _activeMoreIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        toolbarHeight: 90,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "My Order",
          style: TextStyle(
            fontSize: 18,
            fontWeight: .w500,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.slider_horizontal_3, color: Colors.black),
          ),
          SizedBox(width: 6),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return MyOrderItem(
            onTabMore: () {
              if (_activeMoreIndex == index) {
                _activeMoreIndex = -1;
              } else {
                _activeMoreIndex = index;
              }
              setState(() {});
            },
            isOpenMore: _activeMoreIndex == index,
            isFinalStatus: index == 3,
          );
        },
      ),
    );
  }
}
