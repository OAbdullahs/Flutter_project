
import 'package:drift/drift.dart';

class UserEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable().unique()();
  TextColumn get name => text().nullable()();
  TextColumn get userName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get company => text().nullable()();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();

}