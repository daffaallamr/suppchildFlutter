import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/main.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';
import 'chatpage.dart';

Widget titleList(title) {
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
  int userIdList;

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userIdList = sharedPreferences.getInt('id');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarTitle('Pesan'),
          body: Center(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListView.builder(
                        itemBuilder: (listContext, index) =>
                            buildItem(snapshot.data.docs[index]),
                        itemCount: snapshot.data.docs.length,
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          )),
    );
  }

  buildItem(doc) {
    return (doc['id'] != idUser)
        ? Container(
            width: SizeConfig.safeBlockHorizontal * 80,
            height: SizeConfig.safeBlockVertical * 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(docs: doc)));
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
