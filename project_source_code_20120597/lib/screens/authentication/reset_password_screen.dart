// screen reset password

import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/providers/authprovider.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final _inputEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Please enter your email to search for your account.'),
                ),
                Container(
                  child: TextField(
                    controller: _inputEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor
                    ),
                    onPressed: () {
                      if (authProvider.resetPassword(_inputEmailController.text)) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email not found'),
                        ));
                      }
                    },
                    child: const Text('Confirm', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
