import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soil_app/screens/auth/login.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(const Login());
    Finder emailField = find.byKey(const Key('email'));
    await tester.enterText(emailField, "text");

    Finder loginButton = find.byKey(const Key('login_btn'));
    await tester.tap(loginButton);
    await tester.pump();
  });
}
