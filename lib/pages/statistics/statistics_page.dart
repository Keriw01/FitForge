import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("StatisticsPage"));
  }
}
