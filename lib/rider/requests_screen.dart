import 'package:flutter/material.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/widgets/SecondRiderClipPath.dart';
import 'package:rushrider/widgets/app_bar.dart';
import '../widgets/RiderDrawer.dart';

class RequestScreen extends StatefulWidget {
  static const routeName = "/requestScreen";

  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List transactions = [
      Card(
        child: ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
            },
            title: Text(
              'Samosa',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Sardauna estate'),
            trailing: OutlinedButton(onPressed: () {}, child: Text('View'))),
      ),
      Card(
        child: ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed(PremiumInfoScreen.routeName);
            },
            title: Text(
              'Samosa',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Sardauna estate'),
            trailing: OutlinedButton(onPressed: () {}, child: Text('View'))),
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: RushRiderAppBar(_scaffoldKey, context),
      endDrawer: SafeArea(child: RiderDrawer()),
      body: Column(
        children: [
          ClipPath(
            clipper: SecondRiderClipPath(),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              height: SizeConfig.safeBlockVertical * 30,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 20, left: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'All sent requests',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
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
