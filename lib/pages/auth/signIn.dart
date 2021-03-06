import 'package:flutter/material.dart';

import 'package:flutter_pro_firebase_app/utility/isValid.dart';

import 'package:flutter_pro_firebase_app/pages/auth/signUp.dart';

import 'package:flutter_pro_firebase_app/components/appFormField.dart';
import 'package:flutter_pro_firebase_app/components/appDivider.dart';
import 'package:flutter_pro_firebase_app/components/appButton.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Default.
  String _emailError = '';
  String _passwordError = '';

  /// Default.
  bool _obscurePassword = true;

  void onSignIn() {
    final _email = _emailController.text.trim();
    final _password = _passwordController.text.trim();

    /// Reset.
    setState(() {
      _emailError = '';
      _passwordError = '';
    });

    final valid = isValidBlock((when) {
      when(_email.isEmpty, () => setState(() => _emailError = 'Required field'));
      when(_email.isNotEmpty && !isValidEmail(_email), () => setState(() => _emailError = 'Invalid email'));
      when(_password.isEmpty, () => setState(() => _passwordError = 'Required field'));
    });
    if (!valid) return;

    print('Sign In');
  }

  void onSignInWithFacebook() {
    print('Sign In with Facebook');
  }

  void onSignInWithGoogle() {
    print('Sign In with Google');
  }

  void changePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        TextButton(
          child: Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
          ),
        ),
      ],
    );
  }

  Widget body() {
    /// Qui la [SafeArea] ?? stata incapsulata all'interno del [SingleChildScrollView]
    /// per risolvere il problema della sovrapposizione della tastiera virtuale.
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            AppFormField(
              color: Colors.black12,
              borderRadius: 8,
              borderColor: Colors.black,
              textInputType: TextInputType.emailAddress,
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
              error: _emailError,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              borderRadius: 8,
              borderColor: Colors.black,
              textInputType: TextInputType.text,
              hintText: 'Password',
              obscureText: _obscurePassword,
              controller: _passwordController,
              icon: _obscurePassword ? Icons.visibility : Icons.visibility_off,
              onPressed: changePasswordVisibility,
              error: _passwordError,
            ),
            SizedBox(height: 16),
            AppButton(
              height: 48,
              minWidth: double.infinity,
              color: Colors.black,
              textColor: Colors.white,
              borderRadius: 8,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: onSignIn,
            ),
            SizedBox(height: 32),
            Row(
              children: [
                AppDivider(
                  height: 2,
                  color: Colors.black12,
                ),
                SizedBox(width: 8),
                Text('Or'),
                SizedBox(width: 8),
                AppDivider(
                  height: 2,
                  color: Colors.black12,
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: 48,
                    minWidth: double.infinity,
                    color: Colors.white,
                    textColor: Colors.black,
                    borderRadius: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 18,
                          width: 18,
                          image: AssetImage('assets/icons/authFacebook-32.png'),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Facebook',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onPressed: onSignInWithFacebook,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: AppButton(
                    height: 48,
                    minWidth: double.infinity,
                    color: Colors.white,
                    textColor: Colors.black,
                    borderRadius: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 18,
                          width: 18,
                          image: AssetImage('assets/icons/authGoogle-32.png'),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onPressed: onSignInWithGoogle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
