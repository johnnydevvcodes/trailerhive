import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

import '../../core/db/app_db_interface.dart';
import '../../core/di/service_locator.dart';

@lazySingleton
class MovieDao {
  var _dbStore = StoreRef("movieRef");

  Future<Database> get _database async =>
      await locator<AppDatabaseApi>().database;

  Stream<List<RecordSnapshot>> dbListener() {
    var controller = StreamController<List<RecordSnapshot>>();
    _database.then((db) {
      _dbStore.query().onSnapshots(db).listen((snapshots) {
        // snapshots always contains the list of all the records in the store
        controller.add(snapshots);
      });
    });
    return controller.stream;
  }

  Future save(Map<String, dynamic> data) async {
    var db = await _database;
    await _dbStore.record(data['uid']).put(db, data, merge: true);
    return;
  }

  Future remove(Map<String, dynamic> data) async {
    var db = await _database;
    var filter = Filter.equals('uid', data['uid']);
    var finder = Finder(filter: filter);
    await _dbStore.delete(db, finder: finder);
    return;
  }

  Future clearDb() async {
    var db = await _database;
    return _dbStore.delete(db);
  }
}
