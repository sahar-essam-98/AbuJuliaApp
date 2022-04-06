
import 'package:flutter/material.dart';

import '../db_controller/fav_db_controller.dart';
import '../models/favourit.dart';

class FavProvider extends ChangeNotifier {

  List<Favourie> contacts = <Favourie>[];
  final ContactDbController _contactDbController = ContactDbController();

  //CRUD
  Future<void> read() async {
    contacts = await _contactDbController.read();
    notifyListeners();
  }

  Future<bool> create(Favourie contact) async {
    int newRowId = await _contactDbController.create(contact);
    if(newRowId != 0){
      contact.id = newRowId.toString();
      contacts.add(contact);
      notifyListeners();
    }
    return newRowId != 0;
  }

  Future<bool> delete(String id) async {
    bool deleted = await _contactDbController.delete(id);
    if(deleted){
      // contacts.removeWhere((element) => element.id == id);
      int index = contacts.indexWhere((element) => element.id == id);
      if(index != -1){
        contacts.removeAt(index);
        notifyListeners();
      }
    }
    return deleted;
  }
  //
  // Future<bool> update(Contact contact) async{
  //   bool updated = await _contactDbController.update(contact);
  //   if(updated){
  //     // int index = contacts.indexOf(contact);
  //     int index = contacts.indexWhere((element) => element.id == contact.id);
  //     if(index != -1) {
  //       contacts[index] = contact;
  //       notifyListeners();
  //     }
  //   }
  //   return updated;
  // }
}
