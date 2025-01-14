import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';
import 'package:personal_finance_app/src/features/pots/logic/services/pots_local_service.dart';
import 'pots_event.dart';
import 'pots_state.dart';

class PotsBloc extends Bloc<PotsEvent, PotsState> {
  final PotsLocalService localService;
  PotsBloc({
    required this.localService,
  }) : super(PotsState()) {
    on<GetPots>(_getPots);
    on<AddNewPot>(_addNewPot);
    on<AddMoneyToPot>(_addMoneyToPot);
    on<WithdrawFromPot>(_withdrawFromPot);
    on<EditPot>(_editPot);
    on<DeletePot>(_deletePot);
  }

  void _getPots(GetPots event, Emitter<PotsState> emit) async {
    final pots = await localService.getPots();
    emit(state.copyWith(pots: pots));
  }

  void _addNewPot(AddNewPot event, Emitter<PotsState> emit) {
    final pots = [event.pot, ...state.pots];
    localService.addNewPot(event.pot);
    emit(state.copyWith(pots: pots));
  }

  void _addMoneyToPot(AddMoneyToPot event, Emitter<PotsState> emit) {
    final potToEdit = findPot(event.potName);
    final editedPot = potToEdit.copyWith(
      total: (potToEdit.total + event.amount),
    );

    final pots = state.pots
        .map((pot) => pot.name == potToEdit.name ? editedPot : pot)
        .toList();

    localService.editPot(editedPot);
    emit(state.copyWith(pots: pots));
  }

  void _withdrawFromPot(WithdrawFromPot event, Emitter<PotsState> emit) {
    final potToEdit = findPot(event.potName);
    final editedPot = potToEdit.copyWith(
      total: (potToEdit.total - event.amount),
    );

    final pots = state.pots
        .map((pot) => pot.name == potToEdit.name ? editedPot : pot)
        .toList();

    localService.editPot(editedPot);
    emit(state.copyWith(pots: pots));
  }

  void _editPot(EditPot event, Emitter<PotsState> emit) {
    final potToEdit = findPot(event.potName);
    final editedPot = event.editedPot;

    final pots = state.pots
        .map((pot) => pot.name == potToEdit.name ? editedPot : pot)
        .toList();

    localService.editPot(editedPot);
    emit(state.copyWith(pots: pots));
  }

  void _deletePot(DeletePot event, Emitter<PotsState> emit) {
    final potToDelete = findPot(event.potName);

    final pots =
        state.pots.where((pot) => pot.name != potToDelete.name).toList();

    localService.removePot(potToDelete.name);
    emit(state.copyWith(pots: pots));
  }

  //* ---------- Helper functions ---------- *//
  Pot findPot(String potName) {
    return state.pots.firstWhere(
      (pot) => pot.name == potName,
      orElse: () {
        throw ArgumentError('pot with name: $potName not found');
      },
    );
  }
}
