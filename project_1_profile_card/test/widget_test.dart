import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Profile card shows name and sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ملفي الشخصي'), findsOneWidget);
    expect(find.text('معاذ ناجي العدل'), findsOneWidget);
    expect(find.text('نبذة عني'), findsOneWidget);
  });
}
