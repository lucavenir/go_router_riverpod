import 'package:alternative_example/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The login / logout flow works', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: TrialApp()));
    await tester.pump(const Duration(milliseconds: 750));

    // The initial location for our router is `/`,
    // but the redirect is immediately triggered
    expect(find.text("Login Page"), findsOneWidget);
    expect(find.text('Home Page'), findsNothing);

    // Tap the login button
    await tester.tap(find.bySemanticsLabel('Login'));
    await tester.pumpAndSettle(const Duration(milliseconds: 750));

    // Verify that we're at the home page
    expect(find.text("Login Page"), findsNothing);
    expect(find.text('Home Page'), findsOneWidget);

    // Tap the logout button
    await tester.tap(find.bySemanticsLabel('Logout'));
    await tester.pumpAndSettle(const Duration(milliseconds: 750));

    // // Verify that we're back to the login page
    expect(find.text("Login Page"), findsOneWidget);
    expect(find.text('Home Page'), findsNothing);
  });
}
