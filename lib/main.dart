import 'package:flutter/material.dart';

void main() => runApp(MesajApp());

class MesajApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffed(),
      title: "Chat App V2 (Basic Example)",
    );
  }
}

class Scaffed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App V 1.2"),
      ),
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<MessagePop> messageList = [];

  TextEditingController t1 = TextEditingController();

  addToList(String incomingmessage) {
    setState(() {
      MessagePop messageObj = MessagePop(message: incomingmessage);
      messageList.insert(0, messageObj);
      t1.clear();
    });
  }

  Widget textArea() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              onPressed: () => addToList(t1.text), icon: Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: messageList.length,
                itemBuilder: (context, indexNo) => messageList[indexNo]),
          ),
          Divider(
            thickness: 1,
          ),
          textArea()
        ],
      ),
    );
  }
}

String name = "User1";

class MessagePop extends StatelessWidget {
  String message;

  MessagePop({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(name[0]),
          ),
          Column(
            children: [
              Text(name),
              Text(message),
            ],
          )
        ],
      ),
    );
  }
}
