import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_ai/main.dart';

void main() {
  testWidgets('KrishiAI app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const KrishiAIApp());
    expect(find.text('KrishiAI'), findsOneWidget);
  });
}
