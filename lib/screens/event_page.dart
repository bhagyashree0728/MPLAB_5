import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      "title": "Tech Symposium 2025",
      "date": "April 12, 2025",
      "location": "SPIT Auditorium",
      "image": "assets/events/event1.png",
      "description":
          "Join us for a day of inspiring tech talks, coding battles, and networking opportunities with industry leaders.",
    },
    {
      "title": "AI & ML Workshop",
      "date": "April 25, 2025",
      "location": "Lab 3, SPIT Campus",
      "image": "assets/events/event2.png",
      "description":
          "A hands-on workshop introducing real-world AI applications and machine learning model building.",
    },
    {
      "title": "Hackathon: CodeSprint",
      "date": "May 5-6, 2025",
      "location": "Online + Onsite",
      "image": "assets/events/event3.png",
      "description":
          "48 hours of problem-solving, team building, and innovation. Prizes worth ₹1,00,000!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 237, 240),
        title: Text("Upcoming Events"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    event["image"]!,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event["title"]!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey[700],
                          ),
                          SizedBox(width: 6),
                          Text(
                            event["date"]!,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey[700],
                          ),
                          SizedBox(width: 6),
                          Text(
                            event["location"]!,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        event["description"]!,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
