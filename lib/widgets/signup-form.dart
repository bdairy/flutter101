import 'package:MyFirstApp/home.dart';
import 'package:MyFirstApp/models/http_exception.dart';
import 'package:MyFirstApp/providers/auth-provider.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:MyFirstApp/system-classes/system-colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

enum AuthMode {
  SignUp,
  Login,
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  AuthMode _mode = AuthMode.SignUp;
  final _form = GlobalKey<FormState>();
  Map<String, dynamic> _registerForm = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    final _authProv = Provider.of<AuthProvider>(context, listen: false);
    bool _validateForm() {
      var formIsValid = _form.currentState.validate();
      return formIsValid;
    }

    ApiService _service = ApiService();
    return Form(
      key: _form,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Email is required';
              }
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return 'Email is invalid';
              }
              return null;
            },
            onSaved: (newValue) {
              if (newValue.isNotEmpty) {
                _registerForm['email'] = newValue;
              }
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty || value.length < 6) {
                return 'Min of 6 charachters';
              }
              return null;
            },
            onSaved: (newValue) {
              if (newValue.isNotEmpty) {
                _registerForm['password'] = newValue;
              }
            },
          ),
          if (_mode == AuthMode.SignUp)
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              controller: _confirmPasswordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) {
                
              },
              validator: (value) {
                if (_mode == AuthMode.SignUp &&
                    value != _passwordController.text) {
                  return 'Pass & Confirm does not match ';
                }
                return null;
              },
            ),
          SizedBox(height: 30),
          RaisedButton.icon(
            color: SystemColors.primary,
            onPressed: () async {
              try {
                if (_validateForm()) {
                  _form.currentState.save();
                  _authProv.login(_registerForm['email'], _registerForm['password']);
                }
              } on HttpException catch (err) {
                print(err.toString());
              } catch (e) {
                // perform action
              }
            },
            icon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            label: Text(
              'Signup',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 15),
          FlatButton(
              onPressed: () {
                setState(() {
                  _mode = AuthMode.Login;
                });
              },
              child: Text(
                'Login instead',
                style: TextStyle(color: SystemColors.accent),
              ))
        ],
      ),
    );
  }
}
