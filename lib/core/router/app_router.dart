import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_de_france/core/shared/pages/not_found_page.dart';
import 'package:tour_de_france/core/shared/widgets/main_layout.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/accueil'),
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              MainLayout(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/accueil',
              builder: (context, state) => Placeholder(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/parcours',
              builder: (context, state) => Placeholder(),
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
              builder: (context, state) => Placeholder(),
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
              builder: (context, state) => Placeholder(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(child: NotFoundPage()),
);
