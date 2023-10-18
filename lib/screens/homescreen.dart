import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String username = "";
  String email = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
      email = (snap.data() as Map<String, dynamic>)['email'];
      name = (snap.data() as Map<String, dynamic>)['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SizedBox(
          width: 5,
        ),
        NavigationColumn(),
        VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          width: 820,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Storybar(),
              SizedBox(height: 7),
              Text(
                '   Add a story',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
                //body
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),
        Moreforyou(),
      ],
    ));
  }
}

class NavigationColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Instagramlogo.png',
            width: 200.0,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                print('Home button tapped');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                print('Search');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.explore),
              title: Text('Explore'),
              onTap: () {
                print('Explore');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Reels'),
              onTap: () {
                print('Reels');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              onTap: () {
                print('Message');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                print('Notifications');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.create),
              title: Text('Create'),
              onTap: () {
                print('Create');
              },
            ),
          ),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                print('Profile');
              },
            ),
          ),
          Spacer(),
          InkWell(
            hoverColor: Colors.grey[300],
            child: ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('More'),
              onTap: () {
                print('More');
              },
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class Moreforyou extends StatelessWidget {
  const Moreforyou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Saptarshi Maity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

class Storybar extends StatelessWidget {
  const Storybar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey, // Adjust the color as needed
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white, // Adjust the icon color as needed
          ),
        ),
      ),
    );
  }
}
