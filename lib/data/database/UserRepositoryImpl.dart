import 'package:assessment_project/data/database/UserTable.dart';
import 'package:assessment_project/data/network/model/UserModel.dart';

import '../../domain/UserRepository.dart';

class UserRepositoryImpl extends UserRepository {

  UserRepositoryImpl({required UserTable userTable}) : _userTable = userTable;

  UserTable _userTable;

  @override
  Stream<List<UserModel>> getAllUsers() {
    return _userTable.getUsers().map((users) {
      return users.map((user) => UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        website: user.website,
        favorite: user.favorite
      )).toList();
    });
  }

  @override
  void insertUsers(List<UserModel> users) {
    _userTable.insertUsers(users);
  }

  @override
  void updateUser(UserModel user) {
    _userTable.updateUser(user);
  }
}
