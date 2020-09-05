import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kit_flutter_traning/Common/router_list.dart';
import 'package:kit_flutter_traning/Get_Contacts_App/View_Model/contacts_view_model.dart';

class ContactsScreen extends StatefulWidget {
  final ContactsViewModel viewModel;

  const ContactsScreen({Key key, this.viewModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  GlobalKey<FormState> _textFormKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.askPermission();
    searchController.addListener(() {
      widget.viewModel.searchContact(searchController);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Contacts List",
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(23),
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: null)
          ],
        ),
        body: Form(
          key: _textFormKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white),
                    )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setSp(23),
                        right: ScreenUtil().setSp(22)),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: (isSearching) ? widget.viewModel.contactsFiltered.length : widget.viewModel.contacts.length,
                        itemBuilder: (context, int index) {
                          var contact = (isSearching) ? widget.viewModel.contactsFiltered[index] : widget.viewModel.contacts[index];
                          return _contactsItems(contact);
                        }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _contactsItems(Contact contact) {
    InkWell(
      onTap: () => Navigator.of(context).pushNamed(RouteList.contactsDetail,arguments: {'contact' : contact}),
      child: ListTile(
        title: Text(
          "${contact.displayName}",
          style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40)),
        ),
        subtitle: Text("${contact.phones.elementAt(0).value}",
            style:
            TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40))),
        leading: (contact.avatar != null && contact.avatar.length > 0) ?
        CircleAvatar(
          backgroundImage: MemoryImage(contact.avatar),
        ) : CircleAvatar(child:  Text('${contact.initials()}'),),
      ),
    );
  }
}
