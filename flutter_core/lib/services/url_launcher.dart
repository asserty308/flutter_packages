import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  /// Launches a url in another app (browser, youtube, etc.).
  /// Does not emit a state as the app state does not change.
  Future<bool> launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
      return true;
    }
    
    print('Unable to launch url $url');
    return false;
  }

  Future<bool> launchPhone(BuildContext context, String number) async {
    final uri = Uri(
      scheme: 'tel',
      path: number
    ).toString();

    return await launchUrl(context, uri);
  }

  Future<bool> launchMail(BuildContext context, String address, {String subject = ''}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: address,
      queryParameters: {
        'subject': subject,
      }
    ).toString();

    return await launchUrl(context, uri);
  }

  /// Opens the [url] in ChromeCustomTabs on Android and in SFSafariViewController on iOS devices.
  /// [tintColor] is an iOS only setting which defines the color of the buttons on the toolbars.
  /// [popover] is an iOS only setting which is true by default. When set to false the view will be launched fullscreen, otherwise as a popover.
  Future<void> launchChromeSafariBrowser(String url, {Color? barColor, Color? tintColor, bool popover = true}) {
    final browser = ChromeSafariBrowser();
    return browser.open(
      url: Uri.parse(url),
      options: ChromeSafariBrowserClassOptions(
        ios: IOSSafariOptions(
          preferredBarTintColor: barColor,
          preferredControlTintColor: tintColor,
        ),
        android: AndroidChromeCustomTabsOptions(
          toolbarBackgroundColor: barColor,
          showTitle: true,
        ),
      ),
    );
  }
}