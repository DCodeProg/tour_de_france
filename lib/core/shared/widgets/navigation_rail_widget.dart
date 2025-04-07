import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_de_france/core/shared/cubit/theme_cubit.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  var _isExtended = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: NavigationRail(
        selectedIndex: widget.navigationShell.currentIndex,
        extended: _isExtended,
        onDestinationSelected:
            (index) => widget.navigationShell.goBranch(index),
        backgroundColor: ColorScheme.of(context).surfaceContainerLow,
        destinations: _getNavigationRailDestinations,
        trailing: _NavigationRailTrailing(),
      ),
      onEnter: (event) => setState(() => _isExtended = true),
      onExit: (event) => setState(() => _isExtended = false),
    );
  }

  List<NavigationRailDestination> get _getNavigationRailDestinations {
    return <NavigationRailDestination>[
      NavigationRailDestination(
        icon: Icon(Icons.route_outlined),
        selectedIcon: Icon(Icons.route),
        label: Text("Parcours"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.groups_2_outlined),
        selectedIcon: Icon(Icons.groups_2),
        label: Text("Équipes"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.directions_bike_outlined),
        selectedIcon: Icon(Icons.directions_bike),
        label: Text("Coureurs"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.sports_score_outlined),
        selectedIcon: Icon(Icons.sports_score),
        label: Text("Classements"),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.code_outlined),
        selectedIcon: Icon(Icons.code),
        label: Text("Dossier technique"),
      ),
    ];
  }
}

class _NavigationRailTrailing extends StatelessWidget {
  const _NavigationRailTrailing();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                switch (themeMode) {
                  case ThemeMode.light:
                    return Icon(Icons.light_mode_outlined);
                  case ThemeMode.dark:
                    return Icon(Icons.dark_mode_outlined);
                  case ThemeMode.system:
                    return Icon(Icons.brightness_auto_outlined);
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Transform.rotate(
              angle: math.pi / 1,
              child: Icon(Icons.view_sidebar_outlined),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
