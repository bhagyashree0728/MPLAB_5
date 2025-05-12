import 'package:flutter/material.dart';
import 'faculty.dart';
import 'vision_mission.dart';
import 'notifications.dart';
import 'webview_page.dart';
import 'feedback.dart';
import 'event_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _pages = [
    FacultyPage(),
    VisionMissionPage(),
    NotificationPage(),
    EventPage(),
    FeedbackPage(),
  ];

  final _titles = [
    'Faculty Info',
    'Vision & Mission',
    'Notifications',
    'Events',
    'Feedback',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0D1B2A),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF0D1B2A),
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'MCA Department',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.white),
              title: Text(
                'Faculty Info',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text(
                'Vision & Mission',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.white),
              title: Text(
                'Notifications',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event, color: Colors.white),
              title: Text('Events', style: TextStyle(color: Colors.white)),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.white),
              title: Text('Feedback', style: TextStyle(color: Colors.white)),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0D1B2A),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Faculty'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Vision'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notices',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}
