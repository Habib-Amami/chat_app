import 'package:chat_app/constants/images.dart';
import 'package:chat_app/services/autentifiction/auth_service.dart';
import 'package:chat_app/widgets/auth/auth_text_button.dart';
import 'package:chat_app/widgets/auth/formfield_title.dart';
import 'package:chat_app/widgets/auth/horizontal_divider.dart';
import 'package:chat_app/widgets/auth/auth_filled_button.dart';
import 'package:chat_app/widgets/auth/social_media_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String routeName = "ieee_app/pages/Register.dart";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            //-- background waves
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                blueWaves,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                //-- Sb 's logo
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    sbLogoHorizental,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                //form
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        //
                        //-- username field title
                        const FormFieldTitle(
                          title: "User Name",
                        ),
                        //
                        //-- username field
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                fontSize: 12,
                              ),
                              hintText: "Enter your user name",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon:
                                  const Icon(Icons.account_circle_outlined),
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
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Please enter a valid user name (8 characters)!';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              _username = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //
                        //-- email field title
                        const FormFieldTitle(
                          title: "Email",
                        ),
                        //
                        //-- email field
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
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
                              if (value!.isEmpty ||
                                  !value.contains(
                                    RegExp(
                                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"),
                                  )) {
                                return 'Please enter a valid Email';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              _email = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //
                        //-- password field title
                        const FormFieldTitle(
                          title: "Password",
                        ),
                        //
                        //-- password field
                        SizedBox(
                          // height: 60,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
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
                              return null; // Password is valid
                            },
                            onSaved: (newValue) {
                              _password = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //
                        //--login button
                        AuthFilledButton(
                          text: "Register",
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //-- horizontal divider
                        const HorizontalDivider(dividerText: "Register"),
                        const SizedBox(
                          height: 10,
                        ),
                        //
                        //--login via google and facebook buttons
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialMediaButton(
                                image: googleLogo,
                                onPressed: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SocialMediaButton(
                                image: facebookLogo,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //-- section for registering
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Already have an account ?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            AuthTextButton(
                              buttonText: "Login",
                              fontSize: 20,
                              onPressed: () {},
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
