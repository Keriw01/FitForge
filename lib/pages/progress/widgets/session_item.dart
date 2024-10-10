import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:fit_forge/generated/l10n.dart';

class SessionItem extends StatelessWidget {
  final Session session;

  const SessionItem({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = formatHour(session.startTime!);
    final endTime = formatHour(session.endTime!);

    final duration = session.endTime?.difference(session.startTime!);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Text(
        DateFormat('yyyy-MM-dd').format(session.startTime!),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              '${S.of(context).start}: $startTime - ${S.of(context).end}: $endTime'),
          Text(
              '${S.of(context).duration}: ${duration.toString().split('.').first}'),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () =>
          context.read<ProgressCubit>().navigateToActivityDetailPage(session),
    );
  }
}
