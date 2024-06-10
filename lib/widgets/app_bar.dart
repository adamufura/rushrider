import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:rushrider/configs/palette.dart';

PreferredSizeWidget RushRiderAppBar(_scaffoldKey, context) {
  return AppBar(
    backgroundColor: Palette.rushRiderTheme,
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
    title: const ListTile(
      title:
          Text('Hello,', style: TextStyle(fontSize: 16, color: Colors.white)),
      subtitle: Text('Adamu Fura ${Emojis.wavingHand}',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          splashColor: Theme.of(context).primaryColor,
          onPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
          icon: const Icon(
            UniconsLine.align_center,
            size: 28,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
