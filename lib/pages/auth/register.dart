import 'package:flutter/material.dart';

import 'package:flutter_pro_firebase_app/pages/auth/login.dart';

import 'package:flutter_pro_firebase_app/components/appFormField.dart';
import 'package:flutter_pro_firebase_app/components/appDivider.dart';
import 'package:flutter_pro_firebase_app/components/appButton.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          onPressed: () => Navigator.pushNamed(context, LoginPage.routeName),
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
              radius: 8,
              textInputType: TextInputType.name,
              hintText: 'First Name',
              obscureText: false,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              radius: 8,
              textInputType: TextInputType.name,
              hintText: 'Last Name',
              obscureText: false,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              radius: 8,
              textInputType: TextInputType.emailAddress,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              radius: 8,
              textInputType: TextInputType.text,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 16),
            AppFormField(
              color: Colors.black12,
              radius: 8,
              textInputType: TextInputType.text,
              hintText: 'Confirm Password',
              obscureText: true,
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
              onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
