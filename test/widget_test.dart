import 'package:blind_dog/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Blind Dog app boots', (WidgetTester tester) async {
    await tester.pumpWidget(const BlindDogApp());

    expect(find.text('Blind Dog'), findsOneWidget);
  });
}
