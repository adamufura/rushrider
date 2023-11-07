import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rushrider/api/order.dart';
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 5,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          'TOTAL ORDERS',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 5,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          'PENDING ORDERS',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
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
                  child: FutureBuilder(
                    future: getAllRiderPENDINGOrders(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.data['size'] < 1) {
                        return const Center(
                          child: Text('No New Order Request'),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data['size'],
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                child: Text("#" +
                                    snapshot.data['data'][index]['id']
                                        .toString()),
                              ),
                              title: Text(
                                snapshot.data['data'][index]['title'],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                  "Destination: ${snapshot.data['data'][index]['customer_address']}"),
                              trailing: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        OrderInfoScreen.routeName,
                                        arguments: {
                                          'orderID': snapshot.data['data']
                                              [index]['id'],
                                        });
                                  },
                                  child: Text('View'))),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
