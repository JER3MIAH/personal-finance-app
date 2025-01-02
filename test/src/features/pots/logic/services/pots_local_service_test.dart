import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/services/pots_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late PotsLocalService localService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = PotsLocalService(prefs: prefs);
  });

  group('Pot Local Service -', () {
    final testPot = Pot(
      name: 'potName',
      theme: 'theme',
      total: 120.0,
      target: 200.0,
    );

    final testPot2 = Pot(
      name: 'pot2Name',
      theme: 'theme2',
      total: 198.0,
      target: 500.0,
    );

    test('[addPot] updates the pot list with provided pot', () async {
      await localService.addNewPot(testPot);
      final pots = await localService.getPots();

      expect(pots, [testPot]);
    });

    test('[editPot] updates the pot list with provided pot', () async {
      await localService.addNewPot(testPot);
      final updatedPot = testPot2.copyWith(name: testPot.name);
      await localService.editPot(updatedPot);
      final pots = await localService.getPots();

      expect(pots, [updatedPot]);
    });

    test('[removePot] removes provided pot from the pot list', () async {
      await localService.addNewPot(testPot);
      await localService.removePot(testPot.name);
      final pots = await localService.getPots();

      expect(pots, []);
    });
  });
}
