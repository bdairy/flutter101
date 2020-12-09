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
                Card(
                  color: Colors.white,
                  elevation: 15,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width - 100,
                    height: 400,
                    child: Column(

                      children: [
                        Text(
                          'Join Our App',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        SignupForm()

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
