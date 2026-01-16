import 'package:flutter/material.dart';

class MyAddressItemTextField extends StatefulWidget {
  const MyAddressItemTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.icon,
    this.textInputType = .text,
    this.textInputAction = .done,
    this.onTabSuffixIcon,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final VoidCallback? onTabSuffixIcon;

  @override
  State<MyAddressItemTextField> createState() => _AboutMeTextFieldState();
}

class _AboutMeTextFieldState extends State<MyAddressItemTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: TextField(
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        controller: widget.controller,
        focusNode: _focusNode,
        cursorColor: Colors.black,
        style: TextStyle(
          color: _focusNode.hasFocus ? Colors.black : const Color(0xFF868889),
          fontSize: 12,
          fontWeight: .w500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          filled: true,
          fillColor: Color(0xFFF4F5F9),
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon),
          prefixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return Color(0xFF6CC51D);
            }
            return Color(0xFF868889);
          }),
          suffixIcon: widget.onTabSuffixIcon != null
              ? IconButton(
                  onPressed: widget.onTabSuffixIcon,
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                  ),
                )
              : null,
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return Color(0xFF6CC51D);
            }
            return Color(0xFF868889);
          }),
          hintStyle: TextStyle(
            color: Color(0xFF868889),
            fontSize: 12,
            fontWeight: .w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: .circular(6),
            borderSide: BorderSide(color: Color(0xFF6CC51D)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: .circular(6),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
