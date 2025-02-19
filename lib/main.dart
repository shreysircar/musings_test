import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music/core/configs/theme/app_theme.dart';
import 'package:music/domain/repository/auth/song/song.dart';
import 'package:music/firebase_options.dart';
import 'package:music/presentation/choose_mode/pages/bloc/theme_cubit.dart';
import 'package:music/presentation/splash/pages/splash.dart';
import 'package:path_provider/path_provider.dart';

import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  ); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

await initializeDependencies();
  // ✅ Manually check if SongRepositoryImpl is registered
  if (!sl.isRegistered<SongsRepository>()) {
    print("❌ SongRepositoryImpl is NOT registered!");
  } else {
    print("✅ SongRepositoryImpl is registered!");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) =>ThemeCubit())
    
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder:(context,mode)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:mode,
        home:const SplashPage()
        ),
      ),
    );
  }
}
