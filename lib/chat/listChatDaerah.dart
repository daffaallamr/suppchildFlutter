import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chatpage.dart';

class ListChatDaerah extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ListChatDaerah> {
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
    // TODO: implement build
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
    ));
  }

  buildItem(doc) {
    return (doc['id'] == 1)
        ? GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatPage(docs: doc)));
            },
            child: Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text(doc['username']),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
