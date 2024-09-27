import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/workouts/session/cubit/workout_session_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutSessionFloating extends StatefulWidget {
  final double bottomPostion;
  final bool isSmall;
  final bool isLock;

  const WorkoutSessionFloating({
    super.key,
    this.bottomPostion = 10,
    this.isSmall = true,
    this.isLock = false,
  });

  @override
  _WorkoutSessionFloatingState createState() => _WorkoutSessionFloatingState();
}

class _WorkoutSessionFloatingState extends State<WorkoutSessionFloating>
    with SingleTickerProviderStateMixin {
  late bool _isSmall;
  late bool _isLock;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isSmall = widget.isSmall;
    _isLock = widget.isLock;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSize() {
    setState(() {
      _isSmall = !_isSmall;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);

    return BlocSelector<WorkoutSessionCubit, WorkoutSessionState, Session?>(
      selector: (state) {
        return state.session;
      },
      builder: (context, session) {
        return session == null
            ? const SizedBox()
            : Positioned(
                bottom: widget.bottomPostion,
                right: 0,
                child: GestureDetector(
                  onTap: _isLock ? null : _toggleSize,
                  child: _isSmall
                      ? AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              width: 15,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    isLight ? whiteColor : greenButton,
                                    isLight ? greenButton : whiteColor,
                                  ],
                                  stops: [
                                    1 - _animation.value - 0.2,
                                    1 - _animation.value + 0.1,
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: isLight ? blackColor : whiteColor,
                          ),
                          child: Row(
                            children: [
                              BlocSelector<WorkoutSessionCubit,
                                  WorkoutSessionState, Duration>(
                                selector: (state) => state.workoutDuration,
                                builder: (context, workoutDuration) {
                                  return Text(
                                    formatDuration(workoutDuration),
                                    style: TextStyle(
                                        color: isLight
                                            ? whiteColor
                                            : defaultFontsColor),
                                  );
                                },
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<WorkoutSessionCubit>()
                                      .endWorkout();
                                },
                                icon: const Icon(
                                  Icons.stop_circle_outlined,
                                  color: redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              );
      },
    );
  }
}
