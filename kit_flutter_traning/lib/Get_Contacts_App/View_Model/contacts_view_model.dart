import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:kit_flutter_traning/Base/BaseViewModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactsViewModel extends BaseViewModel{
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  getAllContacts() async{
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    contacts = _contacts;
    notifyListeners();
  }
  askPermission () async{
    if (await Permission.contacts.status.isUndetermined){
      Permission.contacts.request();
      getAllContacts();
    }
    if (await Permission.contacts.request().isGranted)
      getAllContacts();
  }
  phoneCall(String phone) async{
    if (await canLaunch(phone))
      await launch('tel:$phone');
    else {
      throw ' Could not launch $phone';
    }
  }
  sendSms(String phone) async{
    if (await canLaunch(phone))
      await launch('sms:$phone');
    else {
      throw ' Could not launch $phone';
    }
  }
  searchContact(TextEditingController searchController){
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty){
      _contacts.retainWhere((contac){
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contac.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches)
          return true;
        var phone = contac.phones.firstWhere((phn){
          return phn.value.contains(searchTerm);
        }, orElse:() => null);
        return phone != null;
      });
      contactsFiltered = _contacts;
      notifyListeners();
    }
  }
}