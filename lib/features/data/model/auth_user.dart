import 'package:hive/hive.dart';

part 'auth_user.g.dart';



@HiveType(typeId: 0)
class AuthUser extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;

  AuthUser({
    required this.id,
    required this.firstName,
    required this.lastName
  });

  @override
  String toString() {
    return 'AuthUser{id: $id, firstName: $firstName, lastName: $lastName}';
  }
}