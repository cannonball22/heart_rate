//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:heart_rate/Data/Repositories/user.repo.dart';
import 'package:heart_rate/features/authentication/presentation/pages/landing.screen.dart';
import 'package:heart_rate/presentation/widgets/primary_button.dart';
import 'package:heart_rate/presentation/widgets/section_title.dart';

import '../../../../Data/Model/App User/app_user.model.dart';
import '../../../../presentation/widgets/custom_text_form_field.dart';
import '../../../authentication/domain/repositories/AuthService.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class ProfileScreen extends StatefulWidget {
  //SECTION - Widget Arguments

  //!SECTION
  //
  const ProfileScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  AppUser? appUser;
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
    //t2 --Controllers & Listeners
    //
    //t2 --State
    AppUserRepo().readSingle(AuthService().getCurrentUserId()).then((value) {
      setState(() {
        appUser = value;
        _ageController.text = "${appUser?.age}";
        _sleepDurationController.text = "${appUser?.sleepDuration}";
        _heightController.text = "${appUser?.height}";
        _weightController.text = "${appUser?.weight}";

        selectedOccupation = "${appUser?.occupation}";
        selectedPhysicalActivity = "${appUser?.physicalActivity}";
        selectedStressLevel = "${appUser?.stressLevel}";
        selectedIsAthlete = "${appUser?.isAthlete}";
      });
    });
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
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        title: const Text("My profile"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                AuthService().signOut(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LandingScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                'Sign out',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ))
        ],
      ),
      body: appUser != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SectionTitle(title: "Account details"),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      hintText: appUser!.fullName,
                      isEnabled: false,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      hintText: appUser!.email,
                      isEnabled: false,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SectionTitle(title: "Personal information"),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        hintText: "Age",
                        labelText: "Age",
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
                      onChanged: (value) {
                        appUser?.age = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _sleepDurationController,
                      decoration: const InputDecoration(
                        hintText: "Sleep Duration (hours)",
                        labelText: "Sleep Duration (hours)",
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
                      onChanged: (value) {
                        appUser?.sleepDuration = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      hint: const Text("Select your occupation"),
                      value: selectedOccupation,
                      decoration: const InputDecoration(
                        labelText: "Occupation",
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
                          appUser?.occupation = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      hint: const Text("Select your physical activity"),
                      value: selectedPhysicalActivity,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Physical activity",
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
                          appUser?.physicalActivity = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      hint: const Text("Select your stress level"),
                      value: selectedStressLevel,
                      decoration: const InputDecoration(
                        labelText: "Stress level",
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
                          appUser?.stressLevel = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      hint: const Text("Are you an athlete?"),
                      value: selectedIsAthlete,
                      decoration: const InputDecoration(
                        labelText: "Is athlete?",
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
                          appUser?.isAthlete = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        hintText: "Height (cm)",
                        labelText: "Height (cm)",
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
                      onChanged: (value) {
                        appUser?.height = int.parse(value);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        hintText: "Weight (kg)",
                        labelText: "Weight (kg)",
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
                      onChanged: (value) {
                        appUser?.weight = int.parse(value);
                      },
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 42),
        child: PrimaryButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await AppUserRepo().updateSingle(appUser!.id, appUser!);
              const snackbar = SnackBar(
                content: Text(
                  "Your profile updated successfully!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color(0xFF4CAF50),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 6,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            }
          },
          color: Theme.of(context).colorScheme.primary,
          title: 'Save',
        ),
      ),
    );
    //!SECTION
  }
}
