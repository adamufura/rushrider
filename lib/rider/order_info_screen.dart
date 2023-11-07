import 'package:flutter/material.dart';
import 'package:rushrider/configs/SizeConfig.dart';
import 'package:rushrider/widgets/RiderDrawer.dart';
import 'package:rushrider/widgets/app_bar.dart';

class OrderInfoScreen extends StatefulWidget {
  static const routeName = "/orderInfoScreen";
  const OrderInfoScreen({super.key});

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Information'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  CardInfo(
                    title: "Amount Deducted",
                    content: "N1500.00",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Medication From",
                    content: "Alqalam Univesity Clinic",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Medication Time",
                    content: "On 23rd Aug 2022, at 2:35pm",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Problem",
                    content: "A Leg Injury",
                  ),
                  Divider(thickness: 1.5),
                  CardInfo(
                    title: "Problem Description",
                    content: "A Serious  Leg Injury caused by gas accident",
                  ),
                  Divider(thickness: 1.5),
                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushNamed(InsurerHomeScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Accept',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.mark_chat_read_outlined,
                              color: Colors.white)
                        ]),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                          width: 1.5, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushNamed(InsurerHomeScreen.routeName);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Decline',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.cancel, color: Colors.white)
                        ]),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).errorColor,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                          width: 1.5, color: Theme.of(context).errorColor),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  String title;
  String content;
  CardInfo({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(title + ':',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
              )),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(content,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}
