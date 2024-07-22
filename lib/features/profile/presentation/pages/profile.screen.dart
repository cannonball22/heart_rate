//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:heart_rate/Data/Repositories/user.repo.dart';
import 'package:heart_rate/features/authentication/presentation/pages/landing.screen.dart';
import 'package:heart_rate/presentation/widgets/primary_button.dart';
import 'package:heart_rate/presentation/widgets/section_title.dart';

import '../../../../Data/Model/Member/member.model.dart';
import '../../../../presentation/widgets/custom_text_form_field.dart';
import '../../../authentication/domain/repositories/AuthService.dart';

//t2 Dependancies Imports
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: MemberRepo().readSingle(AuthService().getCurrentUserId()),
          builder: (BuildContext context, AsyncSnapshot<Member?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return Column(
                children: [
                  const SectionTitle(title: "Personal details"),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintText: snapshot.data!.fullName,
                    isEnabled: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintText: snapshot.data!.email,
                    isEnabled: false,
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 42),
        child: PrimaryButton(
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
          color: Theme.of(context).colorScheme.error,
          title: 'Sign out',
        ),
      ),
    );
    //!SECTION
  }
}
