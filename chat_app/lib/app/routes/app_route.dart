import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/routes/app_route.gr.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: PathConstant.init, page: SpashRoute.page, initial: true),
    AutoRoute(path: PathConstant.login, page: LoginRoute.page),
    AutoRoute(path: PathConstant.home, page: HomeRoute.page),
    AutoRoute(path: PathConstant.signup, page: SignUpRoute.page),
    AutoRoute(path: PathConstant.userInfo, page: UserInfoRoute.page),
    AutoRoute(path: PathConstant.searchPage, page: SearchRoute.page),
  ];
}
