import 'package:get_it/get_it.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/View_Model/call_and_message_view_model.dart';

GetIt locator = GetIt();
void setupLocator(){
  locator.registerSingleton(CallAndMessageViewModel);
}