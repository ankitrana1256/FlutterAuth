import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignInWithSocial extends StatelessWidget {
  const SignInWithSocial({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height / 5.47,
      child: Column(
        children: [
          Text(
            "Sign In Using",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {
                  print("Facebook");
                },
              ),
              SignInButton(
                Buttons.Twitter,
                mini: true,
                onPressed: () {
                  print("Twitter");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
