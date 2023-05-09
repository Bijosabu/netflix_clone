import 'package:flutter/material.dart';
import 'package:netflixapp/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflixapp/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
// import 'package:netflixapp/presentation/main_page/widgets/screen_main_page.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/presentation/splash_screen/splashScreen.dart';
import 'application/downloads/downloads_bloc.dart';
import 'domain/core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FastLaughBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HotAndNewBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.grey,
          fontFamily: GoogleFonts.roboto().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.white)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
