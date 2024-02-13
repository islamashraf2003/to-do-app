import 'package:go_router/go_router.dart';

import '../../features/home/ui/home_view.dart';

abstract class AppRouts {
  static const homeView = '/';
  static const updateView = '/updateView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeView,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
