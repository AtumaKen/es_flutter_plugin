import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:es_flutter_plugin/es_flutter_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('es_flutter_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await EsFlutterPlugin.platformVersion, '42');
  });
}
