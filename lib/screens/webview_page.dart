import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool isMobile = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      isMobile = true;
      _controller =
          WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(
              NavigationDelegate(
                onPageStarted: (url) => setState(() => isLoading = true),
                onPageFinished: (url) => setState(() => isLoading = false),
              ),
            )
            ..loadRequest(Uri.parse('https://mca.spit.ac.in/'));
    }
  }

  Future<void> _refreshPage() async {
    if (isMobile) {
      _controller.reload();
    }
  }

  Widget _buildEventCard({
    required String title,
    required String date,
    required String description,
    required String imageUrl,
    required String link,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(date, style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 8),
                Text(description),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      _controller.loadRequest(Uri.parse(link));
                    },
                    child: Text("Know More"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MCA Department"),
        backgroundColor: Color(0xFF0D1B2A),
        actions: [
          if (isMobile)
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => _controller.reload(),
            ),
        ],
      ),
      body:
          isMobile
              ? RefreshIndicator(
                onRefresh: _refreshPage,
                child: ListView(
                  padding: EdgeInsets.all(12),
                  children: [
                    // --- Event Cards ---
                    Text(
                      "Upcoming Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildEventCard(
                      title: "MCA TechFest 2025",
                      date: "April 20, 2025",
                      description:
                          "An inter-collegiate technical event showcasing student innovations in AI, ML, and more.",
                      imageUrl:
                          "https://source.unsplash.com/800x400/?technology,students",
                      link: "https://mca.spit.ac.in",
                    ),
                    _buildEventCard(
                      title: "Guest Lecture on Cybersecurity",
                      date: "April 12, 2025",
                      description:
                          "Industry expert will speak on modern cybersecurity challenges and career opportunities.",
                      imageUrl:
                          "https://source.unsplash.com/800x400/?cybersecurity,tech",
                      link: "https://mca.spit.ac.in",
                    ),
                    _buildEventCard(
                      title: "Hackathon - CodeSprint",
                      date: "May 5-6, 2025",
                      description:
                          "24-hour coding marathon for building real-world applications. Open for all SPIT students.",
                      imageUrl:
                          "https://source.unsplash.com/800x400/?hackathon,coding",
                      link: "https://mca.spit.ac.in",
                    ),

                    SizedBox(height: 20),

                    // --- WebView Section ---
                    Text(
                      "Explore Website",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          WebViewWidget(controller: _controller),
                          if (isLoading)
                            Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF0D1B2A),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 60,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "WebView is not supported on Web.\nPlease open this feature on an Android or iOS device.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
