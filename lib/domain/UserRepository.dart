

import 'package:assessment_project/data/network/model/UserModel.dart';


abstract class UserRepository {
  Stream<List<UserModel>> getAllUsers();

  void insertUsers(List<UserModel> users);

  void updateUser(UserModel user);
}