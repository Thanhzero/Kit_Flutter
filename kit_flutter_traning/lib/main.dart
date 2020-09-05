import 'package:flutter/cupertino.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/Service/locator.dart';
import 'package:kit_flutter_traning/app.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(App());
}