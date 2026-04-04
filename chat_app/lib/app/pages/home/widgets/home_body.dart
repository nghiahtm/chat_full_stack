import 'package:chat_app/app/pages/home/bloc/home_bloc.dart';
import 'package:chat_app/app/pages/home/bloc/home_event.dart';
import 'package:chat_app/app/pages/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [HeaderWidget()]);
  }
}
