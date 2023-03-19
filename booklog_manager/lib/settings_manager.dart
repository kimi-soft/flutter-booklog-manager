import 'package:shared_preferences/shared_preferences.dart'; 

class SettingsManager {
  static const int kDefaultReceiveBookCount = 10000;
  static const int kMinReceiveBookCount = 1;
  static const int kMaxReceiveBookCount = 100000;

  late String userId;
  late bool isDisplayImage;
  late int receiveBookCount;

  static final SettingsManager _instance = SettingsManager._internal();

  late SharedPreferences _prefs;

  factory SettingsManager() {
    return _instance;
  }

  SettingsManager._internal() {
    userId = '';
    isDisplayImage = true;
    receiveBookCount = kDefaultReceiveBookCount;
  }

  Future<void> initAsync() async {
    _prefs = await SharedPreferences.getInstance();
    load();
  }

  void load() {
    userId = _prefs.getString('userId') ?? '';
    isDisplayImage = _prefs.getBool('isDisplayImage') ?? true;
    receiveBookCount = checkRangeReceiveBookCount(_prefs.getInt('receiveBookCount') ?? kDefaultReceiveBookCount);
  }

  void save() {
    _prefs.setString('userId', userId);
    _prefs.setBool('isDisplayImage', isDisplayImage);
    _prefs.setInt('receiveBookCount', receiveBookCount);
  }

  int checkRangeReceiveBookCount(int receiveBookCount) {
    if (receiveBookCount < kMinReceiveBookCount) return kMinReceiveBookCount;
    if (receiveBookCount > kMaxReceiveBookCount) return kMaxReceiveBookCount;

    return receiveBookCount;
  }
}
