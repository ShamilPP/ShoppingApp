import 'package:hive/hive.dart';

import '../../model/user/user.dart';

class LocalService {
  static const String _userBox = 'userBox';

  static Future<bool> saveUser(User user) async {
    var box = await Hive.openBox<User>(_userBox);
    await box.put('user', user);
    return true;
  }

  static Future<User?> getUser() async {
    var box = await Hive.openBox<User>(_userBox);
    return box.get('user');
  }

  static Future<bool> removeUser() async {
    var box = await Hive.openBox<User>(_userBox);
    await box.delete('user');
    return true;
  }
}
