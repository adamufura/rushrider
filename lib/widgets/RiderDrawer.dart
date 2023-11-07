import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/providers/user_provider.dart';
import 'package:rushrider/rider/home_screen.dart';
import 'package:rushrider/rider/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiderDrawer extends StatefulWidget {
  const RiderDrawer({super.key});

  @override
  State<RiderDrawer> createState() => _RiderDrawerState();
}

class _RiderDrawerState extends State<RiderDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UserProvider>(context, listen: false).getLoggedInUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Drawer(
      width: SizeConfig.safeBlockHorizontal * 60,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 60,
                    )),
                ListTile(
                  title: Text(
                    "${user.loading ? '' : user.loggedInUser['fullname']}",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "${user.loading ? '' : user.loggedInUser['email']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Divider(),
                Text('RIDER',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Divider()
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading:
                      Icon(Icons.home, color: Theme.of(context).primaryColor),
                  title: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  },
                ),
                ListTile(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamed(VendorProfileScreen.routeName);
                  },
                  leading: Icon(Icons.account_circle_rounded,
                      color: Theme.of(context).primaryColor),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: OutlinedButton(
                onPressed: () async {
                  // sign user out
                  final prefs = await SharedPreferences.getInstance();

                  final signOut = await prefs.remove('rush-rider');

                  if (signOut) {
                    Navigator.of(context)
                        .pushReplacementNamed(SignInScreen.routeName);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                      (route) => false,
                    );
                  }
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sign out',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.logout)
                    ]),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
