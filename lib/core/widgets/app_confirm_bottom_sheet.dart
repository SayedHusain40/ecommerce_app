import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';

Future<void> showAppConfirmBottomSheet({
  required BuildContext context,
  required String message,
  required VoidCallback onConfirm,
  String? confirmLabel,
  String? cancelLabel,
}) {
  final l10n = context.l10n;

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
    ),
    constraints: const BoxConstraints(),
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                onConfirm();
                Navigator.of(sheetContext).pop();
              },
              child: Text(confirmLabel ?? l10n.deleteAProduct),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.of(sheetContext).pop(),
              child: Text(cancelLabel ?? l10n.cancel),
            ),
          ],
        ),
      );
    },
  );
}