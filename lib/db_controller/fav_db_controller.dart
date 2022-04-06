
import 'package:abu_julia/models/favourit.dart';
import 'package:sqflite/sqflite.dart';

import 'db_controller.dart';
import 'db_operations.dart';

class ContactDbController implements DbOperations<Favourie> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Favourie object) async {
       // INSERT INTO contact (name, phone) VALUES ('Name','1234');
      return await _database.insert('favourites', object.toMap());
  }

  @override
  Future<bool> delete(String id) async {
      int numberOfDeletedRows = await _database.delete(
        'favourites',
        where: 'id = ?',
        whereArgs: [id],
      );
      return numberOfDeletedRows > 0;

  }

  @override
  Future<List<Favourie>> read() async{
      List<Map<String, dynamic>> rowsMap = await _database.query('favourites');
      return rowsMap.map((Map<String, dynamic> rowMap) => Favourie.fromMap(rowMap)).toList();
  }

  @override
  Future<Favourie?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Favourie object) {
    // TODO: implement update
    throw UnimplementedError();
  }

  // @override
  // Future<int> create(Contact object) async {
  //   // INSERT INTO contact (name, phone) VALUES ('Name','1234');
  //   return await _database.insert('contacts', object.toMap());
  // }
  //
  // @override
  // Future<bool> delete(int id) async {
  //   //DELETE FROM contacts;
  //   //DELETE FROM contacts WHERE id = 1;
  //   int numberOfDeletedRows = await _database.delete(
  //     'contacts',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  //   return numberOfDeletedRows > 0;
  // }
  //
  // @override
  // Future<List<Contact>> read() async {
  //   // TODO: implement read
  //   // SELECT * FROM contacts;
  //   List<Map<String, dynamic>> rowsMap = await _database.query('contacts');
  //   return rowsMap.map((Map<String, dynamic> rowMap) => Contact.fromMap(rowMap)).toList();
  // }
  //
  // @override
  // Future<Contact?> show(int id) async {
  //   // SELECT * FROM contacts WHERE id = ?;
  //   List<Map<String, dynamic>> rows =
  //       await _database.query('contacts', where: 'id = ?', whereArgs: [id]);
  //   return rows.isNotEmpty ? Contact.fromMap(rows.first) : null;
  // }
  //
  // @override
  // Future<bool> update(Contact object) async {
  //   //UPDATE contacts SET name = 'NAME', phone = '1234';
  //   //UPDATE contacts SET name = 'NAME', phone = '1234' WHERE id = ?;
  //   int numberOfUpdatedRows = await _database.update(
  //     'contacts',
  //     object.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [object.id],
  //   );
  //   return numberOfUpdatedRows > 0;
  // }
}
