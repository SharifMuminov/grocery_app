import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/pages/widget/gradient_button.dart';
import 'package:grocery_app/pages/widget/main_text_field.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final TextEditingController _controllerName = TextEditingController(
    text: "Elon Mask",
  );
  final TextEditingController _controllerEmail = TextEditingController(
    text: "elonMusk@gmail.com",
  );
  final TextEditingController _controllerPhone = TextEditingController(
    text: "+1  202  555  0142",
  );

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    _controllerPhone.dispose();
    _controllerEmail.dispose();
    _controllerName.dispose();
    super.dispose();
  }

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
            "About me",
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
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 34),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Personal Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: .w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    MainTextField(
                      controller: _controllerName,
                      hintText: 'Name',
                      icon: CupertinoIcons.profile_circled,
                    ),
                    MainTextField(
                      controller: _controllerEmail,
                      hintText: 'Email',
                      icon: CupertinoIcons.mail,
                    ),
                    MainTextField(
                      controller: _controllerPhone,
                      hintText: 'Phone',
                      icon: CupertinoIcons.phone,
                      textInputType: .phone,
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: .w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    MainTextField(
                      hintText: 'Current password',
                      icon: CupertinoIcons.lock,
                    ),
                    MainTextField(
                      obscureText: _obscureTextPassword,
                      hintText: 'Password',
                      icon: CupertinoIcons.lock,
                      onTabSuffixIcon: () {
                        setState(() {
                          _obscureTextPassword = !_obscureTextPassword;
                        });
                      },
                    ),
                    MainTextField(
                      hintText: 'Confirm password',
                      icon: CupertinoIcons.lock,
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
