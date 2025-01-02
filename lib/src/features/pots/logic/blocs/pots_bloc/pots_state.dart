import 'package:equatable/equatable.dart';
import 'package:personal_finance_app/src/features/pots/data/models/pot.dart';

class PotsState extends Equatable {
  final List<Pot> pots;
  const PotsState({
    this.pots = const [],
  });

  @override
  List<Object> get props => [pots];

  PotsState copyWith({
    List<Pot>? pots,
  }) {
    return PotsState(
      pots: pots ?? this.pots,
    );
  }
}
