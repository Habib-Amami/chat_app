import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  static String routeName = "ieee_app/pages/login.dart";
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>();
  // late String? _password;
  // late String? _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/waves_blue.png",
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/images/sb_logo_arc_blue.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "IBMPlexSans",
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              "Login to continue using the app",
                              style: TextStyle(
                                fontFamily: "IBMPlexSansCondensed",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: "IBMPlexSans",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                fontFamily: "IBMPlexSansCondensed",
                                fontSize: 12,
                              ),
                              hintText: "Enter your email",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return const Color(0xff00679a);
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return const Color(0xffc23636);
                                  }
                                  return Colors.grey;
                                },
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid Email';
                              } else {
                                return null;
                              }
                            },
                            // onSaved: (newValue) => _email = newValue,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //password form field -----------------------
                        const Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontFamily: "IBMPlexSans",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          // height: 60,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                fontFamily: "IBMPlexSansCondensed",
                                fontSize: 12,
                              ),
                              hintText: "Enter your password",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return const Color(0xff00679a);
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return const Color(0xffc23636);
                                  }
                                  return Colors.grey;
                                },
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      _obscureText = !_obscureText;
                                    },
                                  );
                                },
                              ),
                            ),
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required.';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long.';
                              }
                              if (!value.contains(
                                RegExp(r'[0-9]'),
                              )) {
                                return 'Password must contain at least one number.';
                              }
                              if (!value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return 'Password must contain at least one special character.';
                              }
                              return null; // Password is valid
                            },
                            onFieldSubmitted: (_) {
                              _formkey.currentState!.save();
                              _formkey.currentState!.validate();
                            },
                            // onSaved: (newValue) => _password = newValue,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //password confirmation
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget password ?",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: FilledButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(5),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Don't have an account ?",
                              style: TextStyle(
                                fontFamily: "IBMPlexSansCondensed",
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(
                                  5,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontFamily: "IBMPlexSansCondensed",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
