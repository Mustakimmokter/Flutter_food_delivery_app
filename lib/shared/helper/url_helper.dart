import 'dart:core';

class UrlHelper {
  static String getUrlPathKey(String url, Map<String, dynamic>? pathKeys) {
    if (pathKeys != null && pathKeys.isNotEmpty) {
      pathKeys.forEach((key, dynamic val) {
        // ignore: parameter_assignments
        url = url.replaceAll(key, val.toString());
      });
    }

    return url;
  }
}
