import 'package:flutter/material.dart';
import 'package:grocery_app/pages/notifications/widget/notifications_item.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<int> _activeIndex = [0];

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
          "Notifications",
          style: TextStyle(
            fontSize: 18,
            fontWeight: .w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              children: List.generate(5, (index) {
                return NotificationsItem(
                  title: "Email Notifcations",
                  subTitle:
                      "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym",
                  onTab: () {
                    if (_activeIndex.contains(index)) {
                      _activeIndex.remove(index);
                    } else {
                      _activeIndex.add(index);
                    }
                    setState(() {});
                  },
                  isActive: _activeIndex.contains(index),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
              top: 10,
              left: 17,
              right: 17,
            ),
            child: GradientButton(
              text: "Save settings",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
