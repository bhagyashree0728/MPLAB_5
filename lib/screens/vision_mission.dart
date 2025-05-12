import 'package:flutter/material.dart';
import '../widgets/expandable_card.dart';

class VisionMissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ExpandableCard(
          title: 'Department Vision (Effective from 2024-25)',
          content:
              'To develop globally competent and ethical professionals in Computer Science and Engineering and enable them to contribute to society.\n\n'
              'To create a center of excellence which will produce cutting edge technologies to cater needs of Business and Society.',
        ),
        ExpandableCard(
          title: 'Department Mission (Effective from 2024-25)',
          content:
              'M1: To provide rigorous, high-standard, multidisciplinary curriculum and innovative T-L-E-A processes and ensure a stimulating academic environment.\n\n'
              'M2: To promote research and innovations through collaborations.\n\n'
              'M3: To develop requisite attitudes and skills, besides providing a strong knowledge foundation.\n\n'
              'M4: To foster ethics and social responsibility among stakeholders and imbibe a sense of contribution.\n\n'
              'To provide high quality education.\n'
              'To train the students to excel in cutting edge technologies that makes them industry ready.\n'
              'To inculcate ethical and professional values in students for betterment of society.\n'
              'To inculcate Entrepreneurial mindset in students to make them job creators.',
        ),
        ExpandableCard(
          title: 'PEOs of the Department (Effective from 2024-25)',
          content:
              '• Design, analyze, develop, test, deploy, and maintain software products, services, and systems.\n\n'
              '• Engage in applying the advancement of ICT and stay familiar with the latest technology trends and skills while serving industry, public and private institutions, academia, or any other chosen field.\n\n'
              '• Demonstrate excellent computational, communication, teamwork, finance, and project management skills to analyze and solve real-life computational problems, enhance the efficacy and effectiveness of an existing application, or develop a new application.\n\n'
              '• Assume leadership in the chosen vertical and demonstrate sensitivity to GSC (Global Social Responsibility).\n\n'
              '• To recognize and adopt social and ethical issues in computing.\n'
              '• To become an effective presenter to work as a responsible team leader.\n'
              '• To apply knowledge in order to solve real world problems.',
        ),
        ExpandableCard(
          title: 'Program Outcomes (Effective from 2024-25)',
          content:
              '1. Foundation Knowledge: Apply knowledge of mathematics, programming logic, and coding fundamentals for problem-solving techniques.\n\n'
              '2. Problem Analysis: Analyze problems and identify computing requirements.\n\n'
              '3. Design / Development of Solutions: Design systems to meet specifications.\n\n'
              '4. Investigations: Use data analysis and modeling to draw valid conclusions.\n\n'
              '5. Modern Tool Usage: Evaluate and control systems using modern software tools.\n\n'
              '6. Professional Ethics: Adhere to professional and ethical standards.\n\n'
              '7. Life-long Learning: Recognize and pursue lifelong learning.\n\n'
              '8. Project Management and Finance: Apply management principles in IT projects.\n\n'
              '9. Communication Efficacy: Communicate effectively with teams and society.\n\n'
              '10. Societal and Environmental Concern: Understand societal impacts and sustainability.\n\n'
              '11. Individual and Team Work: Work efficiently both individually and in teams.\n\n'
              '12. Innovation and Entrepreneurship: Cultivate entrepreneurial mindset.',
        ),
        ExpandableCard(
          title: 'Program Specific Outcomes (Effective from 2024-25)',
          content:
              '• Apply the principles of ICT and emerging technologies like AI-ML, Data Science, UI/UX, Blockchain, RPA, Cloud, IoT, Security, and Mobile Computing to solve real-world problems.\n\n'
              '• Develop and deploy software products and services.\n\n'
              '• Demonstrate leadership, teamwork, and effective communication.\n\n'
              '• Apply standard practices and strategies as required by industry.',
        ),
      ],
    );
  }
}
