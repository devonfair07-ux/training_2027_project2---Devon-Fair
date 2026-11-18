import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'go_router_navigation_bar.dart';

void main() => runApp(
  ProviderScope(
    child: const RouterWidget(),
  ),
);
