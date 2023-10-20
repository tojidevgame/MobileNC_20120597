import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: Image.asset('assets/login/img_login.png')),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Say hello to your English tutors",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 113, 240),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    "Become fluent faster through one on one video chat lessons tailored to your goals.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: TextField(
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 113, 240),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 113, 240)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gapPadding: 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 113, 240)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gapPadding: 1),
                            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                            hintText: 'email@example.com',
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: PasswordTextField())
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 113, 240),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 25),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 113, 240)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), 
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              )
            ]),
      ),
    ));
  }
}



/* #region PasswordTextField */
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<StatefulWidget> createState() {
    return PasswordTextFieldState();
  }
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;
  void togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: isObscure,
        enableSuggestions: false,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 113, 240),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 113, 240)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gapPadding: 1),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 113, 240)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gapPadding: 1),
          contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
          suffixIcon: IconButton(
            icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: togglePasswordVisibility,
          ),
        ));
  }
}
/* #endregion */