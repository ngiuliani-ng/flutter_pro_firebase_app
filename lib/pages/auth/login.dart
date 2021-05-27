import 'package:flutter/material.dart';

import 'package:flutter_pro_firebase_app/pages/auth/register.dart';

import 'package:flutter_pro_firebase_app/components/appFormField.dart';
import 'package:flutter_pro_firebase_app/components/appDivider.dart';
import 'package:flutter_pro_firebase_app/components/appButton.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
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
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, RegisterPage.routeName),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
