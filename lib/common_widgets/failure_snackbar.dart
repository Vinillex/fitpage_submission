import 'package:flutter/material.dart';

import '../model/api_failure.dart';
import '../utility/app_constants.dart';

void showFailureSnackBar(ApiFailure? apiFailure) {
  AppConstants.scaffoldKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: (apiFailure != null)
            ? Text(
          getMessageFromErrorCode(
            apiFailure.message,
          ),
        )
            : const Text(
          'Looks like your internet is down. Check your connection!',
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            AppConstants.scaffoldKey.currentState!.hideCurrentSnackBar();
          },
        ),
      ),
    );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "wrong-password":
      return "Wrong email/password combination.";
    case "user-not-found":
      return "No user found with this email.";
    case "user-disabled":
      return "User disabled.";
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Oops !!! Something went wrong.";
  }
}
