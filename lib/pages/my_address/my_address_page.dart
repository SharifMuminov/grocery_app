import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/add_address/add_address.dart';

import 'package:grocery_app/pages/my_address/widget/my_address_item.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({super.key});

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  int _activeDefaultIndex = 0;
  int _activeMoreIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            "My Address",
            style: TextStyle(
              fontSize: 18,
              fontWeight: .w500,
              color: Colors.black,
            ),
          ),

          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddAddress();
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
                  return MyAddressItem(
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
      ),
    );
  }
}

// keyboard_arrow_down_rounded
