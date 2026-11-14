import 'package:globetab/app_config.dart';
import 'package:globetab/main.dart' as app_main;
import 'package:globetab/store_service.dart';
import 'package:flutter_test/flutter_test.dart';

/// Compile + law checks for wrapper v2.
///
/// `flutter test` compiles every imported file, so this is the real
/// compile proof on this Linux machine (flutter build ios needs a Mac).
/// It does NOT test real StoreKit — that can only be proven on a real
/// device / TestFlight.
void main() {
  test('product IDs follow the no-dots no-underscores law', () {
    expect(AppStore.proId, 'globetabpro');
    expect(AppStore.monthlyId, 'globetabmonthly');
    expect(AppStore.yearlyId, 'globetabyearly');
    for (final id in AppStore.productIds) {
      expect(id.contains('.'), isFalse, reason: 'dot in $id');
      expect(id.contains('_'), isFalse, reason: 'underscore in $id');
    }
  });

  test('main.dart compiles and AppShell exists', () {
    expect(app_main.AppShell, isNotNull);
    expect(AppConfig.appStoreUrl, startsWith('https://'));
    expect(AppConfig.moreAppsUrl, 'https://wajiha.fun');
  });
}
