import 'package:flutter_test_application_1/data/users_Database.dart';

class UserDetails {
  final currentUser = UserDatabase().savedUsers[UserDatabase().currentUser];

  get user_photo => currentUser?["Photo"] ?? "";
  get user_name => currentUser?["Name"] ?? "Student";
  get user_gender => currentUser?["Gender"] ?? "";
  get user_blood => currentUser?["Blood"] ?? "";
  get user_roll => currentUser?["Roll"] ?? "";
  get user_program => currentUser?["Program"] ?? "";
  get user_batch => currentUser?["Batch"] ?? "";
  get user_city => currentUser?["City"] ?? "";
  get user_phone => currentUser?["Phone"] ?? "";
  get user_email => currentUser?["Email"] ?? "";

  static const Map blankData = {
    "Photo": '',
    "Name": "",
    "Gender": "",
    "Blood": "",
    "Roll": "",
    "Program": "",
    "Batch": "",
    "City": "",
    "Phone": "",
    "Email": "",
  };

  static const Map dummyData = {
    "Photo": '',
    "Name": "Mirza AbdulMoeed",
    "Gender": "Male",
    "Blood": "A+",
    "Roll": "19659",
    "Program": "BS. Computer Science",
    "Batch": "2020-2024",
    "City": "Faisalabad",
    "Phone": "0307-7707100",
    "Email": "mirzaabdulmoed@gmail.com",
  };
}
