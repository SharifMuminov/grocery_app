import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';
import 'package:grocery_app/pages/widget/main_text_field.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({super.key});

  @override
  State<AddCreditCardPage> createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  bool _swatchValue = true;

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
          "Add Credit Card",
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
              child: Column(
                children: [
                  Image.asset("assets/images/credit_card.png"),
                  SizedBox(height: 18),
                  MainTextField(
                    hintText: "Name on the card",
                    icon: CupertinoIcons.profile_circled,
                  ),
                  MainTextField(
                    hintText: "Card number",
                    textInputType: TextInputType.number,
                    icon: CupertinoIcons.creditcard,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MainTextField(
                          hintText: "Month / Year",
                          icon: CupertinoIcons.calendar,
                          textInputType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: MainTextField(
                          hintText: "CVV",
                          textInputType: TextInputType.number,
                          icon: CupertinoIcons.lock,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        alignment: Alignment.centerLeft,
                        child: CupertinoSwitch(
                          activeTrackColor: Color(0xFF6CC51D),
                          value: _swatchValue,
                          onChanged: (v) {
                            setState(() {
                              _swatchValue = v;
                            });
                          },
                        ),
                      ),
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
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              right: 17,
              bottom: 30,
              top: 10,
            ),
            child: GradientButton(
              text: "Add credit card",
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
