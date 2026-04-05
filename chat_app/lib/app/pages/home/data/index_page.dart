import 'package:chat_app/app/pages/home/page/chat/chat_page.dart';
import 'package:chat_app/app/pages/home/page/user/user_page.dart';
import 'package:flutter/material.dart';

class IndexPage {
  final int index;
  final Widget page;
  final IconData icon;
  final String? label;
  IndexPage({
    required this.index,
    required this.page,
    required this.icon,
    this.label,
  });
}

List<IndexPage> listIndexPage = [
  IndexPage(index: 0, page: const ChatPage(), icon: Icons.chat, label: 'Chat'),
  IndexPage(
    index: 1,
    page: const Placeholder(),
    icon: Icons.notifications,
    label: 'Notifications',
  ),
  IndexPage(index: 2, page: UserPage(), icon: Icons.person, label: 'User'),
];
