import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';
import 'package:grocery_app/pages/widget/main_text_field.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool _isSaveAddress = true;

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
            "Add Address",
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
                    MainTextField(
                      hintText: 'Name',
                      icon: CupertinoIcons.profile_circled,
                    ),
                    MainTextField(hintText: 'Email', icon: CupertinoIcons.mail),
                    MainTextField(
                      hintText: 'Phone',
                      icon: CupertinoIcons.phone,
                    ),
                    MainTextField(
                      hintText: 'Address',
                      icon: CupertinoIcons.location_solid,
                    ),
                    MainTextField(
                      hintText: 'Zip code',
                      icon: CupertinoIcons.archivebox,
                    ),
                    MainTextField(hintText: 'City', icon: Icons.map),
                    MainTextField(hintText: 'City', icon: CupertinoIcons.globe),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          alignment: Alignment.centerLeft,
                          child: CupertinoSwitch(
                            activeTrackColor: Color(0xFF6CC51D),
                            value: _isSaveAddress,
                            onChanged: (v) {
                              setState(() {
                                _isSaveAddress = v;
                              });
                            },
                          ),
                        ),
                        Text(
                          "Save this address",
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
                text: "Add address",
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
