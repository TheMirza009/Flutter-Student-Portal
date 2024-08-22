import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/MidTile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Grades extends StatelessWidget {
  List subjectGrades = [
    {
      "Subject": "Psychology",
      "Sessionals": "80",
      "Assignments": "80",
      "MidTerm Exams": "80",
      "FinalTerm Exams": "80",
    },
    {
      "Subject": "Ideology of Pakistan",
      "Sessionals": "78",
      "Assignments": "80",
      "MidTerm Exams": "100",
      "FinalTerm Exams": "89",
    },
  ];

  Grades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades Overview', style: GoogleFonts.montserrat()),
        backgroundColor: Colors.white,
        elevation: 0, // Removes shadow from AppBar
      ),
      backgroundColor: const Color.fromARGB(255, 205, 209, 212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            midTile(
              onTap: () {},
              title: "Total CGPA",
              textSize: 55,
              Gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 228, 138, 183), // Starting color
                  Color.fromARGB(255, 156, 49, 49), // Ending color (example)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  montserratText(text: "Grades by Subject", size: 20),
                  montserratText(text: "Semester 2", size: 15),
                ],
              ),
            ),
            const SubjectCard(
              subject: "Theory of Automata",
              sessionals: "80",
              assignments: "70",
              midTermExams: "85",
              finalTermExams: "90",
              grade: "A",
              gpa: "4.00",
            ),
            const SubjectCard(
              subject: "Fundamentals of Programming",
              sessionals: "75",
              assignments: "65",
              midTermExams: "80",
              finalTermExams: "85",
              grade: "B",
              gpa: "3.50",
            ),
            const SubjectCard(
              subject: "Calculus & Geometry",
              sessionals: "88",
              assignments: "80",
              midTermExams: "90",
              finalTermExams: "95",
              grade: "A",
              gpa: "4.00",
            ),
            const SubjectCard(
              subject: "Digital Logic & Design",
              sessionals: "70",
              assignments: "60",
              midTermExams: "75",
              finalTermExams: "80",
              grade: "B",
              gpa: "3.25",
            ),
            const SubjectCard(
              subject: "Computer Organization and Assembly Language",
              sessionals: "85",
              assignments: "75",
              midTermExams: "80",
              finalTermExams: "85",
              grade: "B",
              gpa: "3.50",
            ),
            const SubjectCard(
              subject: "Python",
              sessionals: "90",
              assignments: "85",
              midTermExams: "92",
              finalTermExams: "95",
              grade: "A",
              gpa: "4.00",
            ),
            const SubjectCard(
              subject: "JavaScript",
              sessionals: "80",
              assignments: "70",
              midTermExams: "85",
              finalTermExams: "90",
              grade: "A",
              gpa: "4.00",
            ),

            // Custom SubjectCard
             ...subjectGrades.map((grade) => SubjectCard(
              subject: grade["Subject"] ?? "",
              sessionals: grade["Sessionals"] ?? "0",
              assignments: grade["Assignments"] ?? "0",
              midTermExams: grade["MidTerm Exams"] ?? "0",
              finalTermExams: grade["FinalTerm Exams"] ?? "0",
              grade: (grade["Subject"] ?? ""),
              gpa: (grade["Subject"] ?? ""),
            )).toList(),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final String sessionals;
  final String assignments;
  final String midTermExams;
  final String finalTermExams;
  final String grade;
  final String gpa;

  const SubjectCard({
    required this.subject,
    required this.sessionals,
    required this.assignments,
    required this.midTermExams,
    required this.finalTermExams,
    required this.grade,
    required this.gpa,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        expansionTileTheme:
            const ExpansionTileThemeData(collapsedIconColor: Colors.black54),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3, // Softer shadow
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ExpansionTile(
          initiallyExpanded: true, // Ensure all cards are expanded by default
          title: Text(
            subject,
            style: GoogleFonts.montserrat().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("Sessionals", sessionals),
                  _buildDetailRow("Assignments", assignments),
                  _buildDetailRow("Mid-Term Exams", midTermExams),
                  _buildDetailRow("Final-Term Exams", finalTermExams),
                  _buildDetailRow("Grade", _calculateGrade()),
                  _buildDetailRow("GPA", _calculateGPA()),
                  Divider(),
                  _buildDetailRow("Total Score", _calculateTotal()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.montserrat().copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String _calculateTotal() {
    // Convert the strings to integers
    final sessionalsValue = int.tryParse(sessionals) ?? 0;
    final assignmentsValue = int.tryParse(assignments) ?? 0;
    final midTermExamsValue = int.tryParse(midTermExams) ?? 0;
    final finalTermExamsValue = int.tryParse(finalTermExams) ?? 0;

    // Calculate the total score
    final totalScore = sessionalsValue +
        assignmentsValue +
        midTermExamsValue +
        finalTermExamsValue;

    return totalScore.toString(); // Return the total score as a string
  }

  String _calculateGrade() {
    // Convert the strings to integers
    final sessionalsValue = int.tryParse(sessionals) ?? 0;
    final assignmentsValue = int.tryParse(assignments) ?? 0;
    final midTermExamsValue = int.tryParse(midTermExams) ?? 0;
    final finalTermExamsValue = int.tryParse(finalTermExams) ?? 0;

    // Calculate the average score
    final averageScore = (sessionalsValue + assignmentsValue + midTermExamsValue + finalTermExamsValue) / 4;

    // Determine the grade based on the average score
    if (averageScore >= 90) return 'A';
    if (averageScore >= 80) return 'B';
    if (averageScore >= 70) return 'C';
    if (averageScore >= 60) return 'D';
    return 'F';
  }

  String _calculateGPA() {
    // Convert the strings to integers
    final sessionalsValue = int.tryParse(sessionals) ?? 0;
    final assignmentsValue = int.tryParse(assignments) ?? 0;
    final midTermExamsValue = int.tryParse(midTermExams) ?? 0;
    final finalTermExamsValue = int.tryParse(finalTermExams) ?? 0;

    // Calculate the average score
    final averageScore = (sessionalsValue + assignmentsValue + midTermExamsValue + finalTermExamsValue) / 4;

    // Determine the GPA based on the average score
    if (averageScore >= 90) return '4.00';
    if (averageScore >= 80) return '3.50';
    if (averageScore >= 70) return '3.00';
    if (averageScore >= 60) return '2.50';
    return '2.00';
  }
}

