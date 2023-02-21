import 'package:shared_preferences/shared_preferences.dart'; 

class SettingsManager {
  late String userId;
  late bool isDisplayImage;

  static final SettingsManager _instance = SettingsManager._internal();

  late SharedPreferences _prefs;

  factory SettingsManager() {
    return _instance;
  }

  SettingsManager._internal() {
    userId = '';
    isDisplayImage = true;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    load();
  }

  void load() {
    userId = _prefs.getString('userId')  ?? '';
    isDisplayImage = _prefs.getBool('isDisplayImage') ?? true;
  }

  void save() {
    _prefs.setString('userId', userId);
    _prefs.setBool('isDisplayImage', isDisplayImage);
  }
}
