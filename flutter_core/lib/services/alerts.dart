import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AlertService {
  /// Returns the text entered in the input field
  /// [withError] only works on Android
  Future<String?> showInputDialog(BuildContext context, {String? title, String? inputHint, String initialText = '', String withError = ''}) async {
    String? inputText;

    return showDialog<String>(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(title!),
          content: PlatformTextField(
            autofocus: true,
            controller: TextEditingController(
              text: initialText,
            ),
            material: (context, platform)  => MaterialTextFieldData(
              decoration: InputDecoration(
                hintText: inputHint,
                errorText: withError.isNotEmpty ? withError : null,
              ),
            ),
            cupertino: (context, platform) => CupertinoTextFieldData(
              placeholder: inputHint,
            ),
            onChanged: (value) {
              inputText = value;
            },
          ),
          actions: <PlatformDialogAction>[
            PlatformDialogAction(
              child: PlatformText('Cancel'),
              onPressed: () => Navigator.of(context).pop()
            ),
            PlatformDialogAction(
              child: PlatformText('OK'),
              onPressed: () { 
                // when 'OK' is pressed never return null - null indicates 'cancel'
                inputText ??= '';
                Navigator.of(context).pop(inputText);
              }
            )
          ],
        );
      }
    );
  }

  void showDismissDialog(BuildContext context, String title, String content) {
    showActionsDialog(context, title, content, <PlatformDialogAction>[
      PlatformDialogAction(
        child: PlatformText('OK'), 
        onPressed: () => Navigator.of(context).pop(),
      )
    ]);
  }

  Future<bool?> showYesNoDialog(BuildContext context, String title, String content) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <PlatformDialogAction>[
            PlatformDialogAction(
              child: PlatformText('Nein'),
              onPressed: () => Navigator.of(context).pop(false)
            ),
            PlatformDialogAction(
              child: PlatformText('Ja'),
              onPressed: () { 
                // when 'OK' is pressed never return null - null indicates 'cancel'
                Navigator.of(context).pop(true);
              }
            )
          ],
        );
      }
    );
  }

  Future<void> showActionsDialog(BuildContext context, String title, String content, List<PlatformDialogAction> actions) async {
    return showDialog(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: Text(content)),
          actions: actions,
        );
      }
    );
  }

  void showTextSnackbar(BuildContext context, {required String message, Color? backgroundColor}) {
    Scaffold.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
  }

  void showTextSnackbarWithKey(GlobalKey<ScaffoldState> key, {required String message, Color? backgroundColor}) {
    key.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      )
    );
  }

  void showActionSnackbar(BuildContext context, {required String message, Color? backgroundColor, required String actionLabel, Color? actionTextColor, required Function onActionPressed}) {
    Scaffold.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          action: SnackBarAction(
            label: actionLabel,
            textColor: actionTextColor ?? Colors.blue,
            onPressed: onActionPressed as void Function(),
          ),
        ),
      );
  }

  Future<TimeOfDay?> showTimePicker24({required BuildContext context, required TimeOfDay initialTime}) async {
    return showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) { 
        // enable use24HourFormat
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
  }
}