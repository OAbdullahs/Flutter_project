
import 'package:assessment_project/data/network/model/UserModel.dart';

import '../../domain/RemoteUserRepository.dart';
import 'UsersApi.dart';

class RemoteUserRepositoryImpl extends RemoteUserRepository {

  RemoteUserRepositoryImpl({
    required UsersApi usersApi,
  }): _usersApi = usersApi;

  final UsersApi _usersApi;


  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _usersApi.fetchUsers();
    final users = response.map((user) => UserModel(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address: Address.fromJson(user.address?.toJson()),
      phone: user.phone,
      website: user.website,
      company: Company.fromJson(user.company?.toJson()),
      favorite: false
    )).toList();
    return users;
  }

}