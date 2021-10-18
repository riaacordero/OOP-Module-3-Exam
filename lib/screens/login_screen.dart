import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Color(0x0FFFFFFF)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40)),
                      const Text("Welcome to Chika!",
                          style: TextStyle(
                            color: Color(0xFF0056D7),
                            fontWeight: FontWeight.w800,
                            fontSize: 35,
                          )),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      const Text(
                          "The easiest way to stay updated.",
                          style: TextStyle(
                              color: Color(0xFF535353), fontSize: 15),
                              textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.symmetric(vertical:10)),
                      SvgPicture.asset('assets/img/landing-art.svg',width: 250,height:250,alignment: Alignment.center,)
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF0056D7),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: _LoginForm(),
                )
              ],
            ))));
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Username",
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFF9BABC2)),
                        errorStyle: TextStyle(height: 0)),
                    validator: (value) => value == "admin" ? null : ''),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF9BABC2)),
                        errorStyle: TextStyle(height: 0)),
                    validator: (value) => value == "admin" ? null : ''),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => DashboardScreen()
                                //       )
                                //   );
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(
                                //         'Invalid credentials. Please try again!'
                                //       )
                                //     )
                                //   );
                                // }
                              },
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFE39600),
                                  shape: StadiumBorder()),
                            ),
                          ),
                          Text("or", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //         UnderConstructionScreen()
                                //     )
                                // );
                              },
                              child: Text("Create Account",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0056D7),
                                  side: const BorderSide(color: Colors.white),
                                  shape: StadiumBorder()),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
        ));
  }
}