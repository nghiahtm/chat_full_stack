import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/bloc/home_bloc.dart';
import 'package:chat_app/app/pages/home/bloc/home_event.dart';
import 'package:chat_app/app/pages/home/bloc/home_state.dart';
import 'package:chat_app/app/pages/home/data/index_page.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/configs/enc_shared_pref.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/constant/pref_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: BlocSelector<HomeBloc, HomeState, int>(
          selector: (state) => state.selectedIndex,
          builder: (context, curIndex) {
            return PageView.builder(
              itemBuilder: (context, index) {
                return listIndexPage[curIndex].page;
              },
              onPageChanged: (index) {
                context.read<HomeBloc>().add(OnChangeTabEvent(index: index));
              },
              itemCount: listIndexPage.length,
            );
          },
        ),
      ),
      bottonNavBar: BlocSelector<HomeBloc, HomeState, int>(
        selector: (state) => state.selectedIndex,
        builder: (context, curIndex) {
          return BottomNavigationBar(
            onTap: (index) {
              context.read<HomeBloc>().add(OnChangeTabEvent(index: index));
            },
            currentIndex: curIndex,
            items: listIndexPage
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label ?? '',
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<HomeBloc>(), child: this);
  }
}
