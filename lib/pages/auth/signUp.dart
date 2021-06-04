import 'package:flutter/material.dart';

import 'package:flutter_pro_firebase_app/pages/auth/signIn.dart';

import 'package:flutter_pro_firebase_app/components/appFormField.dart';
import 'package:flutter_pro_firebase_app/components/appDivider.dart';
import 'package:flutter_pro_firebase_app/components/appButton.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void onSignUp() {
    final _firstName = _firstNameController.text.trim();
    final _lastName = _lastNameController.text.trim();
    final _email = _emailController.text.trim();
    final _password = _passwordController.text.trim();
    final _confirmPassword = _confirmPasswordController.text.trim();

    print('$_firstName - $_lastName - $_email - $_password - $_confirmPassword');
  }

  void onSignUpWithFacebook() {
    print('Sign Up with Facebook');
  }

  void onSignUpWithGoogle() {
    print('Sign Up with Google');
  }

  void changePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void changeConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
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
            'Already have an account? Sign In',
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
              builder: (context) => SignInPage(),
            ),
          ),
        ),
      ],
    );
  }

  Widget body() {
    /// Qui la [SafeArea] è stata incapsulata all'interno del [SingleChildScrollView]
    /// per risolvere il problema della sovrapposizione della tastiera virtuale.
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
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
              textInputType: TextInputType.name,
              hintText: 'First Name',
              obscureText: false,
              controller: _firstNameController,
              error: '',
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              borderRadius: 8,
              borderColor: Colors.black,
              textInputType: TextInputType.name,
              hintText: 'Last Name',
              obscureText: false,
              controller: _lastNameController,
              error: 'Field required.',
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              borderRadius: 8,
              borderColor: Colors.black,
              textInputType: TextInputType.emailAddress,
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
              error: '',
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
              error: '',
              icon: _obscurePassword ? Icons.visibility : Icons.visibility_off,
              onPressed: changePasswordVisibility,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              borderRadius: 8,
              borderColor: Colors.black,
              textInputType: TextInputType.text,
              hintText: 'Confirm Password',
              obscureText: _obscureConfirmPassword,
              controller: _confirmPasswordController,
              error: '',
              icon: _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
              onPressed: changeConfirmPasswordVisibility,
            ),
            SizedBox(height: 16),
            AppButton(
              height: 48,
              minWidth: double.infinity,
              color: Colors.black,
              textColor: Colors.white,
              borderRadius: 8,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: onSignUp,
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
                    onPressed: onSignUpWithFacebook,
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
                    onPressed: onSignUpWithGoogle,
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
