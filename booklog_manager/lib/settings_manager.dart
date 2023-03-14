import 'package:shared_preferences/shared_preferences.dart'; 

class SettingsManager {
  late String userId;
  late bool isDisplayImage;
  int maxBookCount = 10000;

  static final SettingsManager _instance = SettingsManager._internal();

  late SharedPreferences _prefs;

  factory SettingsManager() {
    return _instance;
  }

  SettingsManager._internal() {
    userId = '';
    isDisplayImage = true;
  }

  Future<void> initAsync() async {
    _prefs = await SharedPreferences.getInstance();
    load();
  }

  void load() {
    userId = _prefs.getString('userId') ?? '';
    isDisplayImage = _prefs.getBool('isDisplayImage') ?? true;
    maxBookCount = _prefs.getInt('maxBookCount') ?? 10000;
  }

  void save() {
    _prefs.setString('userId', userId);
    _prefs.setBool('isDisplayImage', isDisplayImage);
    _prefs.setInt('maxBookCount', maxBookCount);
  }
}
