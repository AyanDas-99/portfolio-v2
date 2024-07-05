import 'dart:developer' as dev;
import 'package:url_launcher_web/url_launcher_web.dart' as ulw;

Future<void> launchLink(String url) async {
  if(!await ulw.UrlLauncherPlugin().launch(url)) {
    dev.log('Error launching url $url');
  }
}


