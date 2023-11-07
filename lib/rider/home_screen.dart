import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushrider/api/user.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/providers/user_provider.dart';
import 'package:rushrider/rider/all_deliveries.dart';
import 'package:rushrider/rider/order_info_screen.dart';
import 'package:rushrider/rider/requests_screen.dart';
import 'package:rushrider/widgets/CustomClipPath.dart';
import 'package:rushrider/widgets/RiderDrawer.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UserProvider>(context, listen: false).getLoggedInUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final user = Provider.of<UserProvider>(context);

    List transactions = [
      Card(
        child: ListTile(
            leading: CircleAvatar(
              child: Text('#1'),
            ),
            title: Text(
              'Deliver Samosa',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Sardauna Estate'),
            trailing: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OrderInfoScreen.routeName);
                },
                child: Text('View'))),
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 20,
              )),
        ),
        title: ListTile(
          title: Text('Hello,',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          subtitle: Text(
              "${user.loading ? '' : user.loggedInUser['fullname']} ${Emojis.wavingHand}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(UniconsLine.align_center, size: 28),
            ),
          )
        ],
      ),
      endDrawer: SafeArea(child: RiderDrawer()),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: SizeConfig.safeBlockVertical * 30,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: RiderClipPath(),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor,
                        height: SizeConfig.safeBlockVertical * 30,
                        child: const Text('')),
                  ),
                  Positioned(
                    top: SizeConfig.safeBlockVertical * 20,
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 80,
                      height: SizeConfig.safeBlockVertical * 15,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Your total balance',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'N20,000.00',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              height: SizeConfig.safeBlockVertical * 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AllDeliveries.routeName);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              UniconsLine.package,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              'All Deliveries',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    title: Text(
                      "Recent request",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    trailing: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RequestScreen.routeName);
                        },
                        child: Text('View all requests')),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) => transactions[index]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
