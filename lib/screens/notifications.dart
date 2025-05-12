import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {'title': 'TechFest 2025', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Hackathon MCA', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'AI & ML Workshop', 'link': 'https://mca.spit.ac.in/'},
    {
      'title': 'Guest Lecture: Cloud Computing',
      'link': 'https://mca.spit.ac.in/',
    },
    {'title': 'MCA Induction Program', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Flutter Bootcamp', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Placement Drive 2025', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Cyber Security Seminar', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Project Showcase', 'link': 'https://mca.spit.ac.in/'},
    {'title': 'Alumni Talk Series', 'link': 'https://mca.spit.ac.in/'},
  ];

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: events.length,
      separatorBuilder: (context, index) => Divider(height: 10),
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Icon(Icons.notifications_active, color: Color(0xFF0D1B2A)),
          title: Text(
            event['title']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(Icons.link, color: Color(0xFF0D1B2A)),
          onTap: () => _launchURL(event['link']!),
        );
      },
    );
  }
}
