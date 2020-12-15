import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:MyFirstApp/widgets/signup-form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SystemColors.primary[200],
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'JMDB',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                SignupForm()
                 ],
            ),
          ),
        ),
      ),
    );
  }
}
