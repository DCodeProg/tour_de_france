import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_de_france/core/shared/pages/not_found_page.dart';
import 'package:tour_de_france/core/shared/widgets/main_layout.dart';
import 'package:tour_de_france/features/coureurs/presentation/pages/coureurs_page.dart';
import 'package:tour_de_france/features/dossier_technique/pages/dossier_technique.dart';
import 'package:tour_de_france/features/etapes/presentation/pages/etapes_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/parcours'),
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/parcours',
              builder: (context, state) => EtapesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/equipes',
              builder: (context, state) => Placeholder(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/coureurs',
              builder: (context, state) => CoureursPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/classements',
              builder: (context, state) => Placeholder(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dossier-technique',
              builder: (context, state) => DossierTechnique(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(child: NotFoundPage()),
);
