import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:adaptive_dialog/src/action_callback.dart';
import 'package:adaptive_dialog/src/text_input_dialog/ios_text_input_dialog.dart';
import 'package:flutter/material.dart';

import 'macos_text_input_dialog.dart';
import 'material_text_input_dialog.dart';

Widget buildTextInputDialog({
  required BuildContext context,
  required List<DialogTextField> textFields,
  String? title,
  String? message,
  String? okLabel,
  String? cancelLabel,
  bool isDestructiveAction = false,
  AdaptiveStyle? style,
  VerticalDirection actionsOverflowDirection = VerticalDirection.up,
  bool fullyCapitalizedForMaterial = true,
  bool canPop = true,
  PopInvokedWithResultCallback<List<String>?>? onPopInvokedWithResult,
  bool autoSubmit = false,
  AdaptiveDialogBuilder? builder,
  OnTextInputSubmit? onSubmit,
  VoidCallback? onCancel,
}) {
  final theme = Theme.of(context);
  final adaptiveStyle = style ?? AdaptiveDialog.instance.defaultStyle;
  final effectiveStyle = adaptiveStyle.effectiveStyle(theme);
  switch (effectiveStyle) {
    // ignore: deprecated_member_use_from_same_package
    case AdaptiveStyle.cupertino:
    case AdaptiveStyle.iOS:
      return IOSTextInputDialog(
        textFields: textFields,
        title: title,
        message: message,
        okLabel: okLabel,
        cancelLabel: cancelLabel,
        isDestructiveAction: isDestructiveAction,
        style: adaptiveStyle,
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        autoSubmit: autoSubmit,
        onSubmit: onSubmit,
        onCancel: onCancel,
      );
    case AdaptiveStyle.macOS:
      return MacOSTextInputDialog(
        textFields: textFields,
        title: title,
        message: message,
        okLabel: okLabel,
        cancelLabel: cancelLabel,
        isDestructiveAction: isDestructiveAction,
        style: adaptiveStyle,
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        autoSubmit: autoSubmit,
        onSubmit: onSubmit,
        onCancel: onCancel,
      );
    case AdaptiveStyle.material:
    case AdaptiveStyle.adaptive:
      return MaterialTextInputDialog(
        textFields: textFields,
        title: title,
        message: message,
        okLabel: okLabel,
        cancelLabel: cancelLabel,
        isDestructiveAction: isDestructiveAction,
        style: adaptiveStyle,
        actionsOverflowDirection: actionsOverflowDirection,
        fullyCapitalized: fullyCapitalizedForMaterial,
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        autoSubmit: autoSubmit,
        onSubmit: onSubmit,
        onCancel: onCancel,
      );
  }
}
