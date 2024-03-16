import 'package:flutter/material.dart';
import 'package:shared_preference/Screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController usercontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isRemember = false;

  Future<bool?> setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRemember', isRemember);
    bool? isChecked = prefs.getBool("isRemember");
    // print(isChecked);
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Form  ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (usercontroller.text.isEmpty) {
                        return "Please Enter UserName";
                      }
                      return null;
                    },
                    controller: usercontroller,
                    style: const TextStyle(height: 1, color: Colors.deepPurpleAccent),
                    decoration: InputDecoration(
                        hintText: "Enter UserName",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (passwordcontroller.text.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    style: const TextStyle(height: 1, color: Colors.deepPurpleAccent),
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isRemember,
                    onChanged: (value) {
                      setState(() {
                        isRemember = !isRemember;
                        setData();
                      });
                    },
                  ),
                  const Text("isRemember",style: TextStyle(
                    color: Colors.black
                  ),),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const Screen1();
                        },
                      ));
                    }
                  },
                  child: const Text("Login",),)
            ],
          ),
        ),
      ),
    );
  }
}
