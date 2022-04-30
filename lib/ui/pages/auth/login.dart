import 'package:flutter/material.dart';
import 'package:test1/utils/auth_healper.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool signInForm;
  @override
  void initState() {
    super.initState();
    signInForm = true;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (!signInForm) {
          setState(() {
            signInForm = true;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: w,
                  height: h * 0.28,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/loginimg.JPG"),
                          fit: BoxFit.cover))),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Revolution of Shopping",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: w,
              //   margin: const EdgeInsets.only(left: 20, right: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Sign in to continue",
              //         style: TextStyle(
              //           fontFamily: 'Poppins',
              //           fontSize: 20,
              //           color: Colors.grey[500],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              AnimatedSwitcher(
                child: signInForm ? LoginForm(w: w) : SignupForm(w: w),
                duration: Duration(
                  milliseconds: 200,
                ),
              ),
              // ElevatedButton(
              //   child: Text(
              //     'Sign In',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18.0,
              //       fontFamily: 'Poppins',
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              //   onPressed: () {
              //     setState(() {
              //       signInForm = false;
              //     });
              //   },
              // ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: w,
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 20, left: 16, right: 16),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 1.5,
                        )),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500]),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 1.5,
                        )),
                  ),
                ]),
              ),
              GestureDetector(
                child: signInForm
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do not have an account? ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffa8900),
                                shadows: [
                                  Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(1, 1),
                                      blurRadius: 5),
                                ]),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffa8900),
                                shadows: [
                                  Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(1, 1),
                                      blurRadius: 5),
                                ]),
                          ),
                        ],
                      ),
                onTap: () {
                  setState(() {
                    signInForm = !signInForm;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.w,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding:
          const EdgeInsets.only(top: 18.0, bottom: 10, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Sign in to Continue",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "email cannot be empty";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter your Email address',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: isHiddenPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "password cannot be empty";
                } else {
                  return null;
                }
              },
              // obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),

              // enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //   color: Color.fromARGB(255, 189, 189, 189),
              //   width: 1.5,
              // )),
              // focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //   color: Color.fromARGB(255, 189, 189, 189),
              //   width: 1.5,
              // )),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              width: widget.w,
              child: ElevatedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final user = await AuthHealper.signInWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        print("Login Successful");
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Foget your password?",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confirmPasswordController = TextEditingController(text: "");
  }

  Widget build(BuildContext context) {
    return Container(
      width: widget.w,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding:
          const EdgeInsets.only(top: 18.0, bottom: 10, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Sign up to Continue",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (RegExp(emailRegex).hasMatch(value!)) {
                } else if (value == null || value.isEmpty) {
                  return "email cannot be empty";
                } else {
                  return "email invalied";
                }
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Enter your email address',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "password cannot be empty";
                } else if (value.length < 6) {
                  return "password must contain more than 6 charactors";
                } else {
                  return null;
                }
              },
              obscureText: isHiddenConfirmPassword,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: InkWell(
                  onTap: _toggleConfirmPasswordView,
                  child: Icon(
                    isHiddenConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "confirm password cannot be empty";
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return "confirm password does not natch";
                } else {
                  return null;
                }
              },
              obscureText: isHiddenPassword,
              decoration: InputDecoration(
                labelText: 'Confirm your password',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              width: widget.w,
              child: ElevatedButton(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final user = await AuthHealper.signUpWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        print("Account created successfully");
                        Navigator.of(context).maybePop();
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }
}
