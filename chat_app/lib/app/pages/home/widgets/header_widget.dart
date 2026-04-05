import 'package:chat_app/utils/themes/app_color.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("CHAT APP", style: TextStyleThemes.title),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: AppColor.white, size: 30),
        ),
      ],
    );
  }
}
