import 'package:flutter/material.dart';

class FacultyPage extends StatelessWidget {
  final List<Map<String, String>> facultyList = [
    {
      'name': 'Prof. Dr. Dhananjay Kalbande',
      'role': 'HOD, MCA Department',
      'details':
          'PhD (Computer Science), M.Tech\nExperience: 12+ years\nSpecialization: Software Engineering, Cloud Computing',
      'photo': 'assets/faculty/Dhananjay.jpeg',
    },
    {
      'name': 'Prof. Nikhita Mangaonkar',
      'role': 'Assistant Professor',
      'details':
          'MCA, B.E. in IT\nExperience: 8 years\nSpecialization: Artificial Intelligence, Machine Learning',
      'photo': 'assets/faculty/NM.jpg',
    },
    {
      'name': 'Prof. Sakina Salmani',
      'role': 'Assistant Professor',
      'details':
          'MCA, Pursuing Ph.D. in Computer (SPIT) ,M.E. Computers (DJSCOE) ,B.E. Computers (RCOE)',
      'photo': 'assets/faculty/SS.png',
    },
    {
      'name': 'Prof. Harshil Kanakia',
      'role': 'Assistant Professor',
      'details':
          'MCA, Pursuiing Ph.D. in Computer Engineering(SPIT) , Executive PG in Data Science (IIIT Bangalore) ,M. E. Comps (SPIT) ,B. E. Comps (SPIT))',
      'photo': 'assets/faculty/HK.png',
    },
  ];

  void _showDetails(BuildContext context, Map<String, String> faculty) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      faculty['photo']!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    faculty['name']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D1B2A),
                    ),
                  ),
                  Text(
                    faculty['role']!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Divider(height: 24, thickness: 1.2),
                  Text(
                    faculty['details']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0D1B2A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(Icons.close, color: Colors.white),
                    label: Text("Close", style: TextStyle(color: Colors.white)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: facultyList.length,
      itemBuilder: (context, index) {
        final faculty = facultyList[index];
        return Card(
          elevation: 6,
          margin: EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(faculty['photo']!),
            ),
            title: Text(
              faculty['name']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B2A),
              ),
            ),
            subtitle: Text(faculty['role']!, style: TextStyle(fontSize: 15)),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Color(0xFF0D1B2A)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _showDetails(context, faculty),
              child: Text(
                'View Details',
                style: TextStyle(color: Color(0xFF0D1B2A)),
              ),
            ),
          ),
        );
      },
    );
  }
}
