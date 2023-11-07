import 'package:flutter/material.dart';
import 'package:rushrider/auth_screen.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isLoading = false;

  late TextEditingController fullnameTextController = TextEditingController();
  late TextEditingController phonenumberTextController =
      TextEditingController();
  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: const Color(0xffECF2F3),
                height: SizeConfig.safeBlockVertical * 30,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: 30),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Rider',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 80,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailTextController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: fullnameTextController,
                    decoration: const InputDecoration(labelText: 'Fullname'),
                  ),
                  TextFormField(
                    controller: phonenumberTextController,
                    decoration:
                        const InputDecoration(labelText: 'Phone number'),
                  ),
                  TextFormField(
                    controller: passwordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Already have an account? Sign In",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(SignInScreen.routeName);
                            },
                            child: Text('here'))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: OutlinedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.arrow_forward_outlined, color: Colors.white)
                    ]),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(
                      width: 1.5, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
