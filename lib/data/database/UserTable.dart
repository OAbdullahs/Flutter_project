import 'package:assessment_project/data/database/AppDatabase.dart';
import 'package:assessment_project/data/network/model/UserModel.dart';
import 'package:drift/drift.dart';

class UserTable {
  UserTable({required AppDatabase appDatabase}) : db = appDatabase;

  AppDatabase db;

  insertUsers(List<UserModel> users) async {
    for (final user in users) {
      db.into(db.userEntity)
          .insert(
            UserEntityCompanion(
              remoteId: Value(user.id),
              name: Value(user.name),
              userName: Value(user.username),
              email: Value(user.email),
              phone: Value(user.phone),
              address: Value(user.address?.toJson().toString()),
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }

  Stream<List<UserEntityData>> getUsers() => db.select(db.userEntity).watch();

  void updateUser(UserModel user) async {
     final userEntity = db.update(db.userEntity)
         ..where((t) => t.remoteId.equals(user.id!));

     await userEntity.write(UserEntityCompanion(favorite: Value(user.favorite)));
  }
}
