import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tour_de_france/core/router/app_router.dart';
import 'package:tour_de_france/core/secrets/app_secrets.dart';
import 'package:tour_de_france/core/shared/cubit/theme_cubit.dart';
import 'package:tour_de_france/features/coureurs/data/datasources/coureurs_remote_datasource.dart';
import 'package:tour_de_france/features/coureurs/data/repositories/coureurs_repository_impl.dart';
import 'package:tour_de_france/features/coureurs/domain/usecases/get_all_coureurs.dart';
import 'package:tour_de_france/features/coureurs/presentation/bloc/coureurs_bloc.dart';
import 'package:tour_de_france/features/etapes/data/datasources/etapes_remote_datasource.dart';
import 'package:tour_de_france/features/etapes/data/repositories/etapes_repository_impl.dart';
import 'package:tour_de_france/features/etapes/domain/usecases/get_all_etapes.dart';
import 'package:tour_de_france/features/etapes/presentation/bloc/etapes_bloc.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  runApp(MainApp());
  FlutterNativeSplash.remove();
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "AR One Sans",
      "ADLaM Display",
    );
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create:
              (context) => EtapesBloc(
                GetAllEtapes(
                  EtapesRepositoryImpl(EtapesRemoteDatasourceImpl(supabase)),
                ),
              )..add(EtapesGetAllEtapesEvent()),
        ),
        BlocProvider(
          create:
              (context) => CoureursBloc(
                GetAllCoureurs(
                  CoureursRepositoryImpl(
                    CoureursRemoteDatasourceImpl(supabase),
                  ),
                ),
              )..add(CoureursGetAllCoureursEvent()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: "Tour De France",
            debugShowCheckedModeBanner: false,
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
