import 'package:hive/hive.dart';

import '../../features/data/model/auth_user.dart';

void registerAdapters(){
  Hive.registerAdapter(AuthUserAdapter());
}