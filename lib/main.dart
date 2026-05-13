import 'package:dev_launcher/presentation/screens/main_screen.dart';
import 'package:dev_launcher/utils/theme_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(600, 400),
    minimumSize: Size(600, 400),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setResizable(false);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev Launcher',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(ThemeUi.mainBgColor),
          brightness: Brightness.dark,
        ).copyWith(primary: Color(ThemeUi.fontColor)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(ThemeUi.mainBgColor),
        textTheme: GoogleFonts.getTextTheme(
          ThemeUi.mainFont,
          ThemeData.dark().textTheme,
        ),
      ),
      home: MainScreen(),
    );
  }
}
