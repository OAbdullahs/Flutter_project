
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'UserEntity.dart';

part 'AppDatabase.g.dart';

@DriftDatabase(
  tables: [UserEntity]
)
class AppDatabase extends _$AppDatabase {

  AppDatabase(): super(_openDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openDatabase() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'my_database',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ));
  });
}