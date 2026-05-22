import 'package:dev_launcher/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => MainScreen()),
    GoRoute(path: "/settings", builder: (context, state) => SettingsScreen()),
  ],
);
