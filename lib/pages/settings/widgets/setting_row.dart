import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onTap;

  const SettingRow({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  value ?? S.of(context).noData,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: lightGreyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
