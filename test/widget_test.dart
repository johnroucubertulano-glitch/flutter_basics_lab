import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_basics_lab/activity3_weather_layout.dart';

void main() {
  testWidgets('Weather dashboard loads', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherDashboardApp());

    expect(find.text('Weather Dashboard'), findsOneWidget);
    expect(find.text('Magallanes'), findsOneWidget);
    expect(find.text('32°'), findsOneWidget);
  });
}