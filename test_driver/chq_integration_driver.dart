import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';

// Helpful resources
// http://cogitas.net/write-integration-test-flutter/
// https://flutter.io/testing/

// Encapsulates all of Flutter driver API while adding some logging to each
// call to better understand when and where things break or timeout.
class ChqIntegrationDriver {
  FlutterDriver driver;

  FlutterDriver flutterDriver() => driver;

  Future<Null> connect() async {
    driver = await FlutterDriver.connect();
  }

  Future<Null> close() async {
    if (driver != null) {
      await driver.close();
    }
  }

  Future<Null> waitForScreen(String widgetName) async {
    try {
      print('running waitForScreen with widget ${widgetName}');
      await driver.waitFor(find.byType(widgetName));
    } catch(e) {
      print('FAILED waitForScreen with widget: ${widgetName}');
      rethrow;
    }
  }

  Future<Null> waitForButtonTap(String widgetKey) async {
    try {
      print('running waitForButtonTap with widget ${widgetKey}');
      await driver.tap(find.byValueKey(widgetKey));
    } catch (e) {
      print('FAILED waitForButtonTap with widget: ${widgetKey}');
      rethrow;
    }
  }

  Future<Null> waitForTextOnScreen(String text) async {
    try {
      print('running waitForTextOnScreen ${text}');
      await driver.waitFor(find.text(text));
    } catch (e) {
      print('FAILED waitForTextOnScreen with text: ${text}');
      rethrow;
    }
  }

  Future<Null> waitForTextfieldInputAndValidate(
      String widgetName,
      String input) async {
    try {
      print('running waitForTextfieldInputAndValidate ${widgetName}');
      await driver.tap(find.byValueKey(widgetName)); // acquire focus
      await driver.enterText(input); // enter text
      await driver.waitFor(find.text(input)); // verify text appears on UI
    } catch (e) {
      print('FAILED waitForTextfieldInputAndValidate with widget: ${widgetName} and input: ${input}');
      rethrow;
    }
  }

  Future<Null> waitInMilliseconds(int milliseconds) async {
    await new Future<Null>.delayed(new Duration(milliseconds: milliseconds));
  }

  Future<Null> waitUntilNoTransientCallbacks() async {
    await driver.waitUntilNoTransientCallbacks();
  }

  Future<Null> swipeLeftToRight(String widgetName) async {
    await driver.scroll(find.byType(widgetName),
        300.0, 0.0, new Duration(milliseconds: 100));
  }

  Future<Null> swipeRightToLeft(String widgetName) async {
    await driver.scroll(find.byType(widgetName),
        -300.0, 0.0, new Duration(milliseconds: 100));
  }
}