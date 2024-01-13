import 'package:flutter/material.dart';
import 'package:new_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRouts.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_Image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Passward cannot be empty";
                      } else if (value.length < 6) {
                        return "Passward lengh should be atleast 6";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.deepPurpleAccent,
                    borderRadius:
                        BorderRadius.circular(changeButton ? 50.0 : 8.0),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(),
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text("Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //     style:
                  //         TextButton.styleFrom(minimumSize: const Size(150, 40)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRouts.homeRoute);
                  //     },
                  //     child: const Text("Login")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
