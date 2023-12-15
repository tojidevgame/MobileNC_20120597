// class widget show profile of user
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

// create State of ProfileScreen
class _ProfileScreenState extends State<ProfileScreen> {
  var mailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var userProfileProvider = Provider.of<ProfileProvider>(context);
    // mailController.text = userProfileProvider.userModel.email;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Profile'),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/common/img_user.png'),
              ),
              Container(
                // child: Text(userProfileProvider.userModel.name),
              ),
              // Text(userProfileProvider.userModel.id),
              Container(
                  padding: const EdgeInsets.all(0),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith((states) {
                        return const EdgeInsets.all(0);
                      }),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Đổi mật khẩu",
                      style: TextStyle(color: primaryColor),
                    ),
                  )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: const Text("Tài khoản", style: TextStyle(fontWeight: FontWeight.bold),),),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Email"),
                              TextField(
                                controller: mailController,
                              )
                            ],
                          ),
                        ),
                    ]),
                  ),
            ])),));
  }
}
