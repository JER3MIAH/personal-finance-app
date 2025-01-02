import 'dart:convert';

class Budget {
  final String category;
  final double maximum;
  final String theme;
  final double spent;

  Budget({
    required this.category,
    required this.maximum,
    required this.theme,
    required this.spent,
  });

  Budget copyWith({
    String? category,
    double? maximum,
    String? theme,
    double? spent,
  }) {
    return Budget(
      category: category ?? this.category,
      maximum: maximum ?? this.maximum,
      theme: theme ?? this.theme,
      spent: spent ?? this.spent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'maximum': maximum,
      'theme': theme,
      'spent': spent,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      category: map['category'],
      maximum: map['maximum'],
      theme: map['theme'],
      spent: map['spent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));

  @override
  String toString() =>
      'Budget(category: $category, maximum: $maximum, theme: $theme, spent: $spent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Budget &&
        other.category == category &&
        other.maximum == maximum &&
        other.theme == theme &&
        other.spent == spent;
  }

  @override
  int get hashCode =>
      category.hashCode ^ maximum.hashCode ^ theme.hashCode ^ spent.hashCode;
}
