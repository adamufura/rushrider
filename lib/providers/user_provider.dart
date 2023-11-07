import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rushrider/api/user.dart';

class UserProvider with ChangeNotifier {
  Map<dynamic, dynamic> _loggedInUser = {};
  bool loading = false;

  Map<dynamic, dynamic> get loggedInUser => _loggedInUser;

  getLoggedInUser() async {
    loading = true;
    final user = User();

    // Fetch user data
    final userData = await user.getUser(await user.getUserEmail());

    if (userData != null) {
      // If the userData is not null, set the values in _loggedInUser
      _loggedInUser = userData;
      // Add more fields as needed

      loading = false;
      notifyListeners();
    } else {
      // Handle the case where userData is null or data retrieval fails
      loading = false;
      notifyListeners();
    }
  }
}
