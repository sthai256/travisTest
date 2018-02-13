// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'chq_integration_driver.dart';

void main() {
  group('auth login flow', () {
    ChqIntegrationDriver driver;

    setUpAll(() async {
      // Connects to the app
      driver = new ChqIntegrationDriver();
      await driver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection
        driver.close();
      }
    });

    test('Clean install, login into existing account', () async {
        // there is a race condition when app boots and the driver begins
        // auth api return current user async, awaiting for which screen to show
        await driver.waitInMilliseconds(500);

        await driver.waitUntilNoTransientCallbacks();
        await driver.waitForButtonTap("FLOATING_BUTTON");
        await driver.waitInMilliseconds(100);
        await driver.waitForButtonTap("FLOATING_BUTTON");
        await driver.waitInMilliseconds(100);
        await driver.waitForButtonTap("FLOATING_BUTTON");
        await driver.waitInMilliseconds(100);
        await driver.waitForButtonTap("FLOATING_BUTTON");
        await driver.waitInMilliseconds(1000);
      });
  });
}