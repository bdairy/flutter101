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

class _SignupFormState extends State<SignupForm>
    with SingleTickerProviderStateMixin {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  AuthMode _mode = AuthMode.Login;
  final _form = GlobalKey<FormState>();
  Map<String, dynamic> _registerForm = {'email': '', 'password': ''};

  AnimationController _controller;
  Animation<Size> _switchAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _switchAnimation = Tween<Size>(
      begin: Size(double.infinity, 420),
      end: Size(double.infinity, 500),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    // _switchAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authProv = Provider.of<AuthProvider>(context, listen: false);
    bool _validateForm() {
      var formIsValid = _form.currentState.validate();
      return formIsValid;
    }

    Widget _theForm() {
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
                onFieldSubmitted: (_) {},
                validator: (value) {
                  if (_mode == AuthMode.SignUp &&
                      value != _passwordController.text) {
                    return 'Pass & Confirm does not match ';
                  }
                  return null;
                },
              ),
            SizedBox(height: 30),
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              color: _mode == AuthMode.Login ? Colors.green[100] : Colors.blueGrey,
              width: _mode == AuthMode.Login ? 110 : 250,
              child: RaisedButton.icon(
                color: SystemColors.primary,
                onPressed: () async {
                  try {
                    if (_validateForm()) {
                      _form.currentState.save();
                      _authProv.login(
                          _registerForm['email'], _registerForm['password']);
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
            ),
            SizedBox(height: 15),
            FlatButton(
                onPressed: () {
                  if (_mode == AuthMode.Login) {
                    setState(() {
                      _mode = AuthMode.SignUp;
                    });
                    _controller.forward();
                  } else {
                    setState(() {
                      _mode = AuthMode.Login;
                    });
                    _controller.reverse();
                  }
                },
                child: Text(
                  _mode == AuthMode.Login
                      ? 'Create new account'
                      : 'Login instead',
                  style: TextStyle(color: SystemColors.accent),
                ))
          ],
        ),
      );
    }

    return Card(
      color: Colors.white,
      elevation: 15,
      child: AnimatedBuilder(
        animation: _switchAnimation,
        child: _theForm(),
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width - 100,
            height: _switchAnimation.value.height,
            child: Column(
              children: [
                Text(
                  _mode == AuthMode.SignUp ? 'Join Our App' : 'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                child
              ],
            ),
          );
        },
      ),
    );
  }
}
