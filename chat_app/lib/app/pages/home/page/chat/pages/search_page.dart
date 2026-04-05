import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/bloc/search_bloc.dart';
import 'package:chat_app/app/pages/home/page/chat/pages/widgets/body_search_widget.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchPage extends StatelessWidget implements AutoRouteWrapper {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BodySearchWidget()));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return BlocProvider(create: (context) => getIt<SearchBloc>(), child: this);
  }
}
