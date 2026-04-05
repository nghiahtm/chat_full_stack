import 'package:chat_app/utils/enums/type_user_enum.dart';
import 'package:flutter/material.dart';

class DataUser {
  final String label;
  final IconData leading;
  final TypeUserEnum type;
  DataUser({required this.label, required this.leading, required this.type});
}

final dataUserWidget = [
  DataUser(
    label: "Thông tin cá nhân",
    leading: Icons.person,
    type: TypeUserEnum.userInfo,
  ),
  DataUser(
    label: "Đăng xuất",
    leading: Icons.logout,
    type: TypeUserEnum.logout,
  ),
];
