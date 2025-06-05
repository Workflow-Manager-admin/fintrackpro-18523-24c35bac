import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fintrackpro/main.dart';

void main() {
  testWidgets('App loads main container', (WidgetTester tester) async {
    // Build FinTrackProApp and trigger a frame.
    await tester.pumpWidget(const FinTrackProApp());

    // Check FinTrackPro main UI is present
    expect(find.text('FinTrackPro'), findsOneWidget);

    // Check tab bar for 5 items
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.dashboard_rounded), findsOneWidget);
    expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
    expect(find.byIcon(Icons.show_chart), findsOneWidget);
    expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);
    expect(find.byIcon(Icons.category), findsOneWidget);
  });
}
