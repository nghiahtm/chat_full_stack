import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/configs/enc_shared_pref.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/constant/pref_key.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.router.replacePath(PathConstant.init);
              getIt<EncSharedPref>().remove(PrefKeyConstant.kToken);
            },
          ),
        ],
      ),
    );
  }
}
