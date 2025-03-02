import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Pengguna", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),
      SchemaColumn("email", ManagedPropertyType.string,
          isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
