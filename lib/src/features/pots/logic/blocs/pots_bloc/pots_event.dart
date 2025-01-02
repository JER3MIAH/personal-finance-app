import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';

abstract class PotsEvent extends Equatable {
  const PotsEvent();

  @override
  List<Object> get props => [];
}

class GetPots extends PotsEvent {
  const GetPots();
}

class AddNewPot extends PotsEvent {
  final Pot pot;
  const AddNewPot({
    required this.pot,
  });

  @override
  List<Object> get props => [pot];
}

class AddMoneyToPot extends PotsEvent {
  final String potName;
  final double amount;
  const AddMoneyToPot({
    required this.potName,
    required this.amount,
  });

  @override
  List<Object> get props => [potName, amount];
}

class WithdrawFromPot extends PotsEvent {
  final String potName;
  final double amount;
  const WithdrawFromPot({
    required this.potName,
    required this.amount,
  });

  @override
  List<Object> get props => [potName, amount];
}

class EditPot extends PotsEvent {
  final String potName;
  final Pot editedPot;
  const EditPot({
    required this.potName,
    required this.editedPot,
  });

  @override
  List<Object> get props => [potName, editedPot];
}

class DeletePot extends PotsEvent {
  final String potName;
  const DeletePot({
    required this.potName,
  });

  @override
  List<Object> get props => [potName];
}
