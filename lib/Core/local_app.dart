import 'package:shared_preferences/shared_preferences.dart';

class LocalApp {
  static String imagKey = "img_key";
  static String nameKey = "name_key";
  static String isUpload = "isUpload";

  static cachData(String key, String path) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, path);
  }

  static Future<String> getData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? " ";
  }

  static cachload(String isUpload, bool load) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUpload, load);
  }

  static Future<bool> getload(String load) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isUpload) ?? false;
  }
}
