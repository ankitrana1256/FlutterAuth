import 'package:chat_app/Methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

final TextEditingController _name = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
// final TextEditingController _otpController = TextEditingController();
bool isLoading = false;

// void sendOTP() async {
//   EmailAuth.sessionName = "Sample";
//   var res = await EmailAuth.sendOtp(receiverMail: _email.text);
//   if (res) {
//     print("OTP Sent");
//   } else {
//     print("We could not sent the OTP");
//   }
// }

// void verifyOTP() async {
//   var res = EmailAuth.validate(
//       receiverMail: _email.text, userOTP: _otpController.text);
//   if (res) {
//     print("OTP verified");
//   } else {
//     print("Invalid OTP");
//   }
// }

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 1.2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height / 20,
                  // ),
                  Container(
                    width: size.width / 1.3,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.3,
                    child: Text(
                      "Create Account to Continue!",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Name",
                          CupertinoIcons.person_alt_circle_fill, _name),
                    ),
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(
                        size,
                        "Password",
                        Icons.lock,
                        _password,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: size.width,
                  //   alignment: Alignment.center,
                  //   child: field(size, "OTP", Icons.security, _otpController),
                  // ),
                  SizedBox(
                    height: size.height / 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_name.text.isNotEmpty &&
                          _email.text.isNotEmpty &&
                          _password.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        createAccount(_name.text, _email.text, _password.text)
                            .then(
                          (user) {
                            if (user != null) {
                              setState(() {
                                isLoading = false;
                              });
                              print("Account Creation Successfully");
                            } else {
                              print("Account Creation Failed");
                            }
                          },
                        );
                      } else {
                        print("Please Enter Fields");
                      }
                    },
                    child: Container(
                      height: size.height / 10,
                      width: size.width / 1.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

Widget field(
    Size size, String hintText, IconData icon, TextEditingController cont) {
  return Container(
    height: size.height / 13,
    width: size.width / 1.3,
    child: TextField(
      controller: cont,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

// Widget fieldwithbutton(
//     Size size, String hintText, IconData icon, TextEditingController cont) {
//   return Container(
//     height: size.height / 13,
//     width: size.width / 1.3,
//     child: TextField(
//       controller: cont,
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         suffixIcon: TextButton(
//           onPressed: () {
//             if (_email.text.isNotEmpty) {
//               sendOTP();
//             } else {
//               print("Email Required");
//             }
//           },
//           child: Text(
//             "SEND OTP",
//             style: TextStyle(fontSize: 12),
//           ),
//         ),
//         prefixIcon: Icon(icon),
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ),
//   );
// }
