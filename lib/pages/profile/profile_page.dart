import 'package:flutter/material.dart';
import 'package:grocery_app/pages/profile/widget/profile_item.dart';
import 'package:grocery_app/pages/profile/widget/user_data_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserDataView(),
            SizedBox(height: 20),
            ProfileItem(
              title: "About me",
              iconsPath: "assets/icons/profile.svg",
              onTab: () {},
            ),
            ProfileItem(
              title: "My Orders",
              iconsPath: "assets/icons/my_order.svg",
              onTab: () {},
            ),
            ProfileItem(
              title: "My Favorites",
              iconsPath: "assets/icons/favorite.svg",
              onTab: () {},
              iconWidth: 17,
              iconHeight: 16,
            ),
            ProfileItem(
              title: "My Address",
              iconsPath: "assets/icons/location.svg",
              onTab: () {},
            ),
            ProfileItem(
              title: "Credit Cards",
              iconsPath: "assets/icons/credit_cards.svg",
              onTab: () {},
              iconHeight: 14,
              iconWidth: 14,
            ),
            ProfileItem(
              title: "Transactions",
              iconsPath: "assets/icons/transactions.svg",
              onTab: () {},
            ),
            ProfileItem(
              title: "Notifications",
              iconsPath: "assets/icons/notifications.svg",
              onTab: () {},
            ),
            ProfileItem(
              title: "Sign out",
              iconsPath: "assets/icons/sign_out.svg",
              onTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}
