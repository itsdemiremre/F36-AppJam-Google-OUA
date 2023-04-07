import 'package:flutter/material.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color(0xFFF8F8F8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
  ),
  shadowColor: Colors.black.withOpacity(0.25),
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(4),
    child: Container(
      height: 4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
    ),
  ),

  title: Align(
    alignment: Alignment.centerRight,
    child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "Murat AVCI",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          Text(
            "555 Puan",
            style: TextStyle(color: Colors.blueGrey, fontSize: 14.0),
          )
        ],
      ),

  ),
  actions: [
    Padding(padding:
    const EdgeInsets.only(left: 0, right: 18.0),
      child: new CircleAvatar(
        backgroundImage: new NetworkImage("https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
      ),
    )
  ],
  leading: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.menu, color: Colors.black,),
  ),
),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('A'),
                  ),
                  title: Text('Münire'),
                  subtitle: Text('Hello!'),
                  trailing: Text('12:00 PM'),
                );
              },
              itemCount: 10,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}