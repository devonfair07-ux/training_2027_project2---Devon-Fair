import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'GoRouter.dart';

void main() => runApp(
  ProviderScope(
    child: const RouterWidget(),
  ),
);
