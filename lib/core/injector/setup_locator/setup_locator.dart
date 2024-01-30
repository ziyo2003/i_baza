import 'dart:io';
import 'package:hive/hive.dart';
import 'package:i_baza/features/data/model/auth_user.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepository {
  HiveRepository._();

  static Box? _hive;
  static HiveRepository? _storegaHive;

  static Future<HiveRepository> getInstance() async {
    if (_storegaHive == null) {
      final storege = HiveRepository._();
      await storege.init();
      _storegaHive = storege;
    }
    return _storegaHive!;
  }

          Future<void> init() async {
            const boxName = "Alibaba";
            Directory directory = await getApplicationCacheDirectory();
            Hive.init(directory.path);
            _hive = await Hive.openBox<dynamic>(boxName);
  }

  static Future<void> putName() async {
    await _hive?.put("is_hive", AuthUser(id: '123456', firstName: "Muhammadziyo", lastName: "Muminov"));
  }

  static getName() {
    return _hive?.get("is_hive", defaultValue: "error");
  }
}
