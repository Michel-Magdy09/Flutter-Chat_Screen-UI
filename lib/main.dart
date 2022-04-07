import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First_Screen(),
    );
  }
}

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Chat> chat = [
    Chat(
        name: "Kriss Benwat",
        date: "Today",
        message: "Good to know",
        image: 'a.jpg'),
    Chat(
        name: "Rezi Makarov ",
        date: "today",
        message: "its been a while",
        image: 'e.jpg'),
    Chat(
        name: "Gustav Lemelo",
        date: "yesterday",
        message: "Hey,where are you?",
        image: 'b.png'),
    Chat(
        name: "Bob Ryder",
        date: "28 Jan",
        message: "its over!",
        image: 'd.png'),
    Chat(
        name: "Ken Simada ",
        date: "24 Jan",
        message: "Your Welcome! ",
        image: 'f.png'),
    Chat(
        name: "Ema Walkins",
        date: "19 Jan",
        message: "I am going out!",
        image: 'c.png'),
    Chat(
        name: "Gilbert Hamminway ",
        date: "12 Jan",
        message: "Just attach the image and send it.",
        image: 'a.jpg'),
    Chat(
        name: "Bella Hammers ",
        date: "5 Jan",
        message: "The UI is sexy",
        image: 'e.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '+ Add New',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: Colors.pinkAccent[100])),
          ),
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'Conversations',
          style:
              TextStyle(fontSize: 30, color: Colors.black, letterSpacing: 0.5),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(80.0),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search...',
                hintStyle: const TextStyle(fontSize: 17),
                fillColor: Colors.grey[200],
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(chat[index].name),
                      subtitle: Text(chat[index].message),
                      trailing: Text(chat[index].date),
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage:
                            AssetImage('assets/${chat[index].image}'),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_filled), title: Text('Channels')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('Profile')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.redAccent,
      ),
    );
  }
}
