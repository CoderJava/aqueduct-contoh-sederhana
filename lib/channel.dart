import 'package:contoh_sederhana/my_authorizer.dart';

import 'contoh_sederhana.dart';
import 'example_controller.dart';
import 'pengguna.dart';
import 'pengguna_controller.dart';

class ContohSederhanaChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = Config(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );
    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route('/example').link(() => MyAuthorizer()).link(() => ExampleController());
    router.route('/pengguna/[:id]').link(() => MyAuthorizer()).link(() => PenggunaController(context));
    return router;
  }
}

class Config extends Configuration {
  Config(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
