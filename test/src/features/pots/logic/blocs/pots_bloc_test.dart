import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_bloc.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_event.dart';
import 'package:personal_finance_app/src/features/pots/logic/blocs/pots_bloc/pots_state.dart';
import 'package:personal_finance_app/src/features/pots/logic/services/pots_local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late PotsLocalService localService;
  late PotsBloc potsBloc;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    localService = PotsLocalService(prefs: prefs);
    potsBloc = PotsBloc(localService: localService);
  });

  tearDown(() {
    potsBloc.close();
  });

  group('Pots Bloc -', () {
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

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState(pots: [])] when GetPots is added after build.',
      build: () => potsBloc,
      act: (bloc) => bloc.add(GetPots()),
      expect: () => [PotsState(pots: [])],
    );

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState(pots: [testPot])] when AddNewPot is added.',
      build: () => potsBloc,
      act: (bloc) => bloc.add(AddNewPot(pot: testPot)),
      expect: () => [
        PotsState(pots: [testPot])
      ],
    );

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState] with updated total property when AddMoneyToPot is added.',
      build: () => potsBloc,
      seed: () => PotsState(pots: [testPot.copyWith(total: 20.0)]),
      act: (bloc) => bloc.add(AddMoneyToPot(potName: 'potName', amount: 30.0)),
      expect: () => [
        PotsState(pots: [testPot.copyWith(total: 50.0)])
      ],
    );

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState] with updated total property when WithdrawFromPot is added.',
      build: () => potsBloc,
      seed: () => PotsState(pots: [testPot.copyWith(total: 20.0)]),
      act: (bloc) =>
          bloc.add(WithdrawFromPot(potName: 'potName', amount: 30.0)),
      expect: () => [
        PotsState(pots: [testPot.copyWith(total: -10.0)])
      ],
    );

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState] with updated pot when EditPot is added.',
      build: () => potsBloc,
      seed: () => PotsState(pots: [testPot, testPot2]),
      act: (bloc) => bloc.add(EditPot(
        potName: 'potName',
        editedPot: testPot.copyWith(name: 'newPotName'),
      )),
      expect: () => [
        isA<PotsState>().having(
          (state) => state.pots.first.name,
          'first pot name',
          'newPotName',
        ),
      ],
    );

    blocTest<PotsBloc, PotsState>(
      'emits [PotsState] with updated pot when DeletePot is added.',
      build: () => potsBloc,
      seed: () => PotsState(pots: [testPot, testPot2]),
      act: (bloc) => bloc.add(DeletePot(potName: 'potName')),
      expect: () => [
        PotsState(pots: [testPot2]),
      ],
    );
  });
}
