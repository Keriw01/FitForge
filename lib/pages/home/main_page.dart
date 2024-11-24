import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<SettingsCubit>().getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        WorkoutsRoute(),
        BodyPartsRoute(),
        ProgressRoute(),
        QrCodeRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.sports_gymnastics),
                label: S.of(context).workoutsLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: S.of(context).exercisesLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month),
                label: S.of(context).statisticsLabel,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.photo_camera_outlined),
                label: S.of(context).scanQrLabel,
              ),
            ],
          ),
        );
      },
    );
  }
}
