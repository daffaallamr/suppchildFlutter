import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suppchild_ver_1/constant.dart';
import 'package:suppchild_ver_1/pusat/sizeConfig.dart';

class ChatPage extends StatefulWidget {
  final docs;

  const ChatPage({Key key, this.docs}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String groupChatId;
  String anotherUsername;
  int idUser;

  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    getGroupChatId();
    _takePrefs();
  }

  _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idUser = prefs.getInt('idUser');
    });
  }

  getGroupChatId() async {
    int anotherUserId = widget.docs['id'];
    String _anotherUsername = widget.docs['username'];

    if (idUser.compareTo(anotherUserId) > 0) {
      groupChatId = '$idUser - $anotherUserId';
    } else {
      groupChatId = '$anotherUserId - $idUser';
    }
    setState(() {
      anotherUsername = _anotherUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    double centerTextField = SizeConfig.safeBlockVertical * 5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarTitle('$anotherUsername'),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .doc(groupChatId)
              .collection(groupChatId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (listContext, index) =>
                        buildItem(snapshot.data.documents[index]),
                    itemCount: snapshot.data.documents.length,
                    reverse: true,
                  )),
                  Container(
                    color: colorSecondPurple,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
                            child: Container(
                              height: SizeConfig.safeBlockVertical * 6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: textEditingController,
                                cursorColor: colorSecondPurple,
                                style: TextStyle(
                                  color: colorSecondPurple,
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: centerTextField /
                                        2, // HERE THE IMPORTANT PART
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Masukan pesan ...',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4,
                                    letterSpacing: 0.3,
                                    fontWeight: FontWeight.w400,
                                    color: colorMainPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: SizeConfig.safeBlockVertical * 4,
                            ),
                            onPressed: () {
                              sendMsg();
                              textEditingController.text = "";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                  child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ));
            }
          },
        ),
      ),
    );
  }

  sendMsg() {
    String msg = textEditingController.text.trim();

    /// Upload images to firebase and returns a URL
    if (msg.isNotEmpty) {
      print('thisiscalled $msg');
      var ref = FirebaseFirestore.instance
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(ref, {
          "senderId": idUser,
          "anotherUserId": widget.docs['id'],
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          'content': msg,
          "type": 'text',
        });
      });

      scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    } else {
      print('Please enter some text to send');
    }
  }

  buildItem(doc) {
    int sendByMe = (doc.data()['senderId']);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Container(
        padding: EdgeInsets.only(
            left: (sendByMe == idUser ? 24 : 0),
            right: (sendByMe == idUser ? 0 : 24)),
        alignment:
            (sendByMe == idUser ? Alignment.centerRight : Alignment.centerLeft),
        child: Container(
          margin: sendByMe == idUser
              ? EdgeInsets.only(left: 30)
              : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: sendByMe == idUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomRight: Radius.circular(23)),
              color: sendByMe == idUser ? Colors.grey[200] : Colors.grey[300]),
          child: (doc.data()['type'] == 'text')
              ? Text('${doc.data()['content']}',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w400,
                  ))
              : Image.network(doc.data()['content']),
        ),
      ),
    );
  }
}
