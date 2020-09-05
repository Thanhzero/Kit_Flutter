import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/View_Model/contacts_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactsDetailScreen extends StatefulWidget{
  final Contact contact;
  final ContactsViewModel viewModel;

  const ContactsDetailScreen({Key key, this.contact,this.viewModel}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ContactsDetailState();

}
class ContactsDetailState extends State<ContactsDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact deltail",
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top :20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Name :",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              Text(
                "${widget.contact.displayName}",
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(30)),
              ),
              Text(
                "Phone :",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              Text(
                "${widget.contact.phones.elementAt(0).value}",
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(30)),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 134,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () =>launch('tell://${widget.contact.phones.elementAt(0).value}'),
                        child: Text(
                          "SMS",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      width: 134,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () => widget.viewModel.phoneCall('${widget.contact.phones.elementAt(0).value}'),
                        child: Text(
                          "CALL",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
