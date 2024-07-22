//t2 Core Packages Imports
import 'package:flutter/material.dart';

//t2 Dependancies Imports
//t3 Services
//t3 Models
//t1 Exports
class SectionTitle extends StatelessWidget {
  //SECTION - Widget Arguments
  final String title;
  final Function? onPressed;

  //!SECTION
  //
  const SectionTitle({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(
          key: key,
        );

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.48,
          ),
        ),
        (onPressed != null)
            ? IconButton(
                onPressed: () => onPressed!(),
                icon: Icon(
                  Icons.add,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container()
      ],
    );
    //!SECTION
  }
}
