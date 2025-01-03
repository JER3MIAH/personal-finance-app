import 'dart:convert';

class Transaction {
  final String id;
  final String title;
  final String category;
  final DateTime date;
  final double amount;
  final bool debit;

  Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.debit,
  });

  Transaction copyWith({
    String? id,
    String? title,
    String? category,
    DateTime? date,
    double? amount,
    bool? debit,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      debit: debit ?? this.debit,
    );
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      amount: map['amount'],
      debit: map['debit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date.toIso8601String(),
      'amount': amount,
      'debit': debit,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Transaction.fromJson(String source) {
    return Transaction.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'Transaction(id: $id, title: $title, category: $category, date: $date, amount: $amount, debit: $debit)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.category == category &&
        other.date == date &&
        other.amount == amount &&
        other.debit == debit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        date.hashCode ^
        amount.hashCode ^
        debit.hashCode;
  }
}
