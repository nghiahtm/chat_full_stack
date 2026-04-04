import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/user/data/data_user.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/enums/type_user_enum.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class UserBodyWidget extends StatelessWidget {
  const UserBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
            switch (dataUserWidget[index].type) {
              case TypeUserEnum.userInfo:
                context.router.pushPath(PathConstant.userInfo);
                break;
              case TypeUserEnum.logout:
                context.router.replacePath(PathConstant.login);
                break;
            }
          },
          leading: Icon(dataUserWidget[index].leading, color: AppColor.white),
          title: Text(dataUserWidget[index].label, style: TextStyleThemes.body),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColor.white,
          ),
        );
      },
      separatorBuilder: (_, index) {
        return const Divider(color: AppColor.white);
      },
      itemCount: dataUserWidget.length,
    );
  }
}
