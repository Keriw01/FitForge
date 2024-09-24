import 'package:fit_forge/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmailRow extends StatelessWidget {
  final String label;
  final String? value;

  const EmailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            children: [
              Text(
                value ?? S.of(context).noData,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(width: 34),
            ],
          ),
        ],
      ),
    );
  }
}
