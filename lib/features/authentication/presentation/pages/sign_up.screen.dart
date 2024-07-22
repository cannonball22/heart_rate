//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:heart_rate/features/authentication/presentation/pages/sign_in.screen.dart';

import '../../../../presentation/widgets/primary_button.dart';
import '../../../../presentation/widgets/tertiary_button.dart';
import '../../../home/presentation/pages/home.screen.dart';
import '../../domain/repositories/AuthService.dart';

//t2 Dependancies Imports
//t3 Services
//t3 Models
//t1 Exports
class SignUpScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const SignUpScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  late FormController _formController;

  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    _formController = FormController();
    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION

  //SECTION - Action Callbacks
  //!SECTION
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _formController.controller("name"),
                    decoration: const InputDecoration(
                      hintText: "Full name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full name cannot be empty';
                      } else if (value.length < 3) {
                        return 'Full name must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _formController.controller("email"),
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _formController.controller("password"),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Create account',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool success = await AuthService()
                        .signUpWithEmailAndPassword(
                            email:
                                _formController.controller("email").text.trim(),
                            password:
                                _formController.controller("password").text,
                            fullName: _formController.controller("name").text,
                            context: context);
                    if (success) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TertiaryButton(
              title: "I have existing account",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SignInScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    _formController.dispose();
    //!SECTION
    super.dispose();
  }
}
