import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:geminicli_app/main.dart';

void main() {
  testWidgets('App renders SOC FOUNDRY title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Pump and settle to allow animations to complete.
    // The Hero section has a 1-second fade-in animation.
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify that our title text is present.
    // We merged "SOC" and "FOUNDRY" back into a single text widget.
    expect(find.text('SOC FOUNDRY'), findsOneWidget);

    // Verify the logo is present.
    expect(find.byType(Image), findsWidgets);
  });
}