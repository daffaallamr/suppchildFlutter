import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'chatpage.dart';

Widget titleList() {
  return Text(
    'Daftar Pesan',
    style: TextStyle(
      fontFamily: 'Rubik',
      fontSize: SizeConfig.safeBlockHorizontal * 6,
      fontWeight: FontWeight.w600,
      color: colorMainPurple,
    ),
  );
}

class ListChat extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ListChat> {
  int idUser;

  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = prefs.getInt('idUser');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarTitle('Pesan'),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  spasiBaris(3.0),
                  titleList(),
                  spasiBaris(3.0),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (listContext, index) =>
                                buildItem(snapshot.data.docs[index]),
                            itemCount: snapshot.data.docs.length,
                          );
                        }

                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  buildItem(doc) {
    return (doc['id'] != idUser && doc['level'] != 'Admin')
        ? Container(
            height: SizeConfig.safeBlockVertical * 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatPage(docs: doc, idUser: idUser)));
              },
              child: Card(
                elevation: 4.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      doc['username'],
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: colorMainPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
