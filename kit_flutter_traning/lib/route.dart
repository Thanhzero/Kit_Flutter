
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kit_flutter_traning/Base/BaseWidgets.dart';
import 'package:kit_flutter_traning/Common/router_list.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/UI/Contacts_Detail_Screen.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/UI/Contacts_Screen.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/View_Model/contacts_view_model.dart';
RouteFactory router() {
  return (RouteSettings settings) {
    Widget screen;
    final args = settings.arguments as Map<String, dynamic> ?? {};

    switch (settings.name) {
      case RouteList.contacts:
        screen = BaseWidget<ContactsViewModel>(
          createViewModel: ContactsViewModel(),
          builder: (context,viewModel,child){
            return ContactsScreen(viewModel : viewModel);
          },
        );
        break;
      case RouteList.contactsDetail :
        screen = ContactsDetailScreen(contact: args['contact'],viewModel: ContactsViewModel(),);
        break;
    }
    return CupertinoPageRoute(
      builder: (context){
        ScreenUtil.init(context);
        return screen;
      }
    );
  };
}
