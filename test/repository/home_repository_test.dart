import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testes_unitarios/repository/home_repository.dart';

void main() {
  final _prefsChannel =
      const MethodChannel('plugins.flutter.io/shared_preferences');
  final _repository = HomeRepository();

  testWidgets('Should validate read current index repository', (tester) async {
    _prefsChannel.setMethodCallHandler((call) => Future.value(0));

    expect(_repository.readCurrentIndex(), isA<Future<int>>());
  });
}
