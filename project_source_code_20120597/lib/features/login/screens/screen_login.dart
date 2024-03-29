import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/screens/screen_list_teacher.dart';

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
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/login/img_login.png')),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Say hello to your English tutors",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColor,
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
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              color: primaryColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gapPadding: 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 25),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TutorScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 25),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(fontSize: 16),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ImageIconWidthRoundBorder(
                      imageIcon: Image.asset('assets/login/img_facebook.png'),
                      onAction: () {},
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ImageIconWidthRoundBorder(
                          imageIcon: Image.asset('assets/login/img_search.png'),
                          iconSize: 20,
                          onAction: () {},
                        )),
                    ImageIconWidthRoundBorder(
                      imageIcon: Image.asset('assets/login/img_smartphone.png'),
                      iconSize: 20,
                      onAction: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('No account? '),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
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
            color: primaryColor,
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gapPadding: 1),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
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

/* #region Icon */
// ignore: must_be_immutable
class ImageIconWidthRoundBorder extends StatelessWidget {
  Image imageIcon;
  final double iconSize;
  final Color colorBorder;
  final double widthOfBoder;
  final double buttonSize;
  final VoidCallback onAction;

  ImageIconWidthRoundBorder(
      {super.key,
      required this.imageIcon,
      this.iconSize = 25,
      this.colorBorder = primaryColor,
      this.widthOfBoder = 1,
      this.buttonSize = 40,
      required this.onAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAction,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: colorBorder,
            width: widthOfBoder,
          ),
        ),
        child: Center(
            child:
                SizedBox(height: iconSize, width: iconSize, child: imageIcon)),
      ),
    );
  }
} /* #endregion */
