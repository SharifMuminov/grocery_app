import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/add_credit_card/add_credit_card_page.dart';
import 'package:grocery_app/pages/my_cards/widget/my_card_item.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  int _activeDefaultIndex = 0;
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
          "My Cards",
          style: TextStyle(
            fontSize: 18,
            fontWeight: .w500,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddCreditCardPage();
                  },
                ),
              );
            },
            icon: Icon(CupertinoIcons.add_circled, color: Colors.black),
          ),
          SizedBox(width: 6),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
              itemCount: 3,
              itemBuilder: (context, index) {
                return MyCardItem(
                  isOpenMore: index == _activeMoreIndex,
                  isDefault: index == _activeDefaultIndex,
                  onChangedSwitch: (bool value) {
                    if (value) {
                      _activeDefaultIndex = index;
                    } else {
                      _activeDefaultIndex = -1;
                    }
                    setState(() {});
                  },
                  onTabMore: () {
                    setState(() {
                      if (_activeMoreIndex == index) {
                        _activeMoreIndex = -1;
                      } else {
                        _activeMoreIndex = index;
                      }
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              right: 17,
              bottom: 30,
              top: 10,
            ),
            child: GradientButton(
              text: "Save settings",
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
