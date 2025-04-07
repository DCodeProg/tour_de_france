import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_de_france/core/shared/widgets/navigation_rail_widget.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        title: Text("Tour de France"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                NavigationRailWidget(navigationShell: navigationShell),
                Expanded(child: navigationShell),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
