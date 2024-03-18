import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q2/screens/detail.dart';
import 'package:q2/screens/home.dart';
import 'package:q2/screens/home/people_list.dart';
import 'package:q2/screens/home/people_map.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/list',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/list',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PeopleList(),
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => DetailScreen(
                    id: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/map',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PeopleMap(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
