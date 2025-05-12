import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();
  int _rating = 3;

  void _submitFeedback() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _feedbackController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
      return;
    }

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Feedback Submitted"),
            content: Text("Thank you for your valuable feedback!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
    );

    _nameController.clear();
    _emailController.clear();
    _feedbackController.clear();
    setState(() => _rating = 3);
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name", style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Enter your name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Email", style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Enter your email",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          Text("Feedback", style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          TextField(
            controller: _feedbackController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Write your feedback here...",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Text("Rate your experience", style: TextStyle(fontSize: 16)),
          _buildStarRating(),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: _submitFeedback,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D1B2A),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text("Submit", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
