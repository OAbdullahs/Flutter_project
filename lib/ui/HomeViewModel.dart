import 'package:flutter/cupertino.dart';

import '../data/network/model/UserModel.dart';
import '../domain/RemoteUserRepository.dart';
import '../domain/UserRepository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required RemoteUserRepository remoteUserRepo,
    required UserRepository localUserRepo,
  }) : _remoteUserRepo = remoteUserRepo,
       _localUserRepo = localUserRepo {
    _fetchUsers();
  }

  final RemoteUserRepository _remoteUserRepo;
  final UserRepository _localUserRepo;

  Stream<List<UserModel>> get users => _localUserRepo.getAllUsers();

  _fetchUsers() async {
    _remoteUserRepo.getUsers().then((users) {
      _localUserRepo.insertUsers(users);
    });
  }

  toggleFavorite(UserModel user) async {
    user.favorite = !user.favorite;
    _localUserRepo.updateUser(user);
  }
}
