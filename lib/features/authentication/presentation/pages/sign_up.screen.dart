//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:form_controller/form_controller.dart';
import 'package:heart_rate/core/Services/Id%20Generating/id_generating.service.dart';
import 'package:heart_rate/features/authentication/presentation/pages/sign_in.screen.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../presentation/widgets/primary_button.dart';
import '../../../../presentation/widgets/tertiary_button.dart';
import '../../../home/presentation/pages/home.screen.dart';
import '../../domain/repositories/AuthService.dart';

//t2 Dependencies Imports
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
  final _ageController = TextEditingController();
  final _sleepDurationController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  //t2 --Controllers
  //
  //t2 --State
  String? selectedOccupation;
  String? selectedPhysicalActivity;
  String? selectedIsAthlete;
  String? selectedStressLevel;

  //t2 --State
  //
  //t2 --Constants
  final _formKey = GlobalKey<FormState>();
  final physicalActivities = ['Low', 'Normal', 'High'];
  final occupations = [
    "Doctor",
    "Nurse",
    "Truck driver",
    "Police officer",
    "Factory worker",
    "Security guard",
    "Journalist",
    "Plumber",
    "HR manager",
    "Web developer",
    "Engineer",
    "Pharmacist"
  ];

  final stressOptions = ['Low', 'Normal', 'High'];
  final isAthleteOptions = ['Yes', 'No'];

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
                  const Text(
                    'Account Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                    keyboardType: TextInputType.name,
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
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
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
                  const SizedBox(height: 16),
                  const Text(
                    'General Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      final age = int.tryParse(value);
                      if (age == null || age <= 0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _sleepDurationController,
                    decoration: const InputDecoration(
                      hintText: "Sleep Duration (hours)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your sleep duration';
                      }
                      final sleepDuration = double.tryParse(value);
                      if (sleepDuration == null ||
                          sleepDuration <= 0 ||
                          sleepDuration > 24) {
                        return 'Please enter a valid sleep duration';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    hint: const Text("Select your occupation"),
                    value: selectedOccupation,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: occupations.map((occupation) {
                      return DropdownMenuItem<String>(
                        value: occupation,
                        child: Text(occupation),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your occupation';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedOccupation = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    hint: const Text("Select your physical activity"),
                    value: selectedPhysicalActivity,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: physicalActivities.map((activity) {
                      return DropdownMenuItem<String>(
                        value: activity,
                        child: Text(activity),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your physical activity level';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedPhysicalActivity = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    hint: const Text("Select your stress level"),
                    value: selectedStressLevel,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: stressOptions.map((activity) {
                      return DropdownMenuItem<String>(
                        value: activity,
                        child: Text(activity),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your stress level';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedStressLevel = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    hint: const Text("Are you an athlete?"),
                    value: selectedIsAthlete,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: isAthleteOptions.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select if you are an athlete';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedIsAthlete = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                      hintText: "Height (cm)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }
                      final height = double.tryParse(value);
                      if (height == null || height <= 0) {
                        return 'Please enter a valid height';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                      hintText: "Weight (kg)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      }
                      final weight = double.tryParse(value);
                      if (weight == null || weight <= 0) {
                        return 'Please enter a valid weight';
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
                    String userId = IdGeneratingService.generate();

                    AppUser appUser = AppUser(
                      id: '',
                      fullName: _formController.controller("name").text,
                      email: _formController.controller("email").text.trim(),
                      weight: int.parse(_weightController.text),
                      height: int.parse(_heightController.text),
                      age: int.parse(_ageController.text),
                      sleepDuration: int.parse(_sleepDurationController.text),
                      isAthlete: selectedIsAthlete!,
                      occupation: selectedOccupation!,
                      physicalActivity: selectedPhysicalActivity!,
                      stressLevel: selectedStressLevel!,
                    );
                    bool success = await AuthService()
                        .signUpWithEmailAndPassword(
                            appUser: appUser,
                            password:
                                _formController.controller("password").text,
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
