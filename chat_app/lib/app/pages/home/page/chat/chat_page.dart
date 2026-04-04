import 'package:auto_route/auto_route.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.router.pushPath(PathConstant.searchPage);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border(
                bottom: BorderSide(color: AppColor.white, width: 0.5),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Search '), Icon(Icons.search)],
            ),
          ),
        ),
      ],
    );
  }
}
