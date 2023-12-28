import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres/product/router/routes.dart';
import 'core/init/dependency_injection.dart' as dependency_injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injector.init();
  runApp(const ProviderScope(child: ReqresApp()));
}

class ReqresApp extends StatelessWidget {
  const ReqresApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      builder: (final context, final widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'ReqresApp',
      routes: RouteHelper.routeReceiver(),
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: Routes.baseRoute.path,
      theme: BaseTheme().theme(context),
    );
  }
}
