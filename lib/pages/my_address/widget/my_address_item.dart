import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/extensions/context_extensions.dart';
import 'package:grocery_app/pages/my_address/widget/my_address_item_text_field.dart';

class MyAddressItem extends StatelessWidget {
  const MyAddressItem({
    super.key,
    this.isOpenMore = false,
    this.isDefault = true,
    required this.onChangedSwitch,
    required this.onTabMore,
  });

  final bool isOpenMore;
  final bool isDefault;
  final ValueChanged<bool> onChangedSwitch;
  final VoidCallback onTabMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9.5),
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(color: Colors.grey.withValues(alpha: 0.17), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDefault)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFFEBFFD7),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                "DEFAULT",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xFF6CC51D),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: 19,
              right: 19,
              top: isOpenMore ? 20 : 17,
              bottom: isOpenMore ? 20 : 23,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFEBFFD7),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/icons/location_address.svg"),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Russell Austin",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "2811 Crescent Day. LA Port California, United States 77571",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF868889),
                        ),
                      ),
                      Text(
                        "+1  202  555  0142 ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.all(2),
                    side: BorderSide(color: Color(0xFF6CC51D), width: 1),
                    minimumSize: Size.zero,
                  ),
                  onPressed: onTabMore,
                  icon: Icon(
                    isOpenMore
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    color: Color(0xFF6CC51D),
                  ),
                ),
              ],
            ),
          ),

          ClipRect(
            child: AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ConstrainedBox(
                constraints: isOpenMore
                    ? BoxConstraints()
                    : BoxConstraints(maxHeight: 0),
                child: Column(
                  children: [
                    Divider(color: Color(0xFFEBEBEB)),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 30,
                        bottom: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyAddressItemTextField(
                            hintText: 'Name',
                            icon: CupertinoIcons.profile_circled,
                          ),
                          MyAddressItemTextField(
                            hintText: 'Address',
                            icon: Icons.location_on_rounded,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyAddressItemTextField(
                                  hintText: 'City',
                                  icon: Icons.map,
                                ),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: MyAddressItemTextField(
                                  hintText: 'Zip code',
                                  icon: CupertinoIcons.archivebox,
                                ),
                              ),
                            ],
                          ),
                          MyAddressItemTextField(
                            hintText: 'Country',
                            icon: CupertinoIcons.globe,
                          ),
                          MyAddressItemTextField(
                            textInputType: TextInputType.phone,
                            hintText: 'Phone',
                            icon: CupertinoIcons.phone,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                alignment: Alignment.centerLeft,
                                child: CupertinoSwitch(
                                  activeTrackColor: Color(0xFF6CC51D),
                                  value: isDefault,
                                  onChanged: onChangedSwitch,
                                ),
                              ),
                              SizedBox(width: 8),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
