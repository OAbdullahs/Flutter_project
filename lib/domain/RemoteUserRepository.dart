
import 'package:assessment_project/data/network/model/UserModel.dart';

abstract class RemoteUserRepository {
  Future<List<UserModel>> getUsers();
}