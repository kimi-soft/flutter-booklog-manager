import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoManager {
  late PackageInfo packageInfo;

  static final PackageInfoManager _instance = PackageInfoManager._internal();

  factory PackageInfoManager() {
    return _instance;
  }

  PackageInfoManager._internal() {
  }

  Future<void> initAsync() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
