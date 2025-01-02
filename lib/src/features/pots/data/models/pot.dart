import 'dart:convert';

class Pot {
  final String name;
  final String theme;
  final double total;
  final double target;

  Pot({
    required this.name,
    required this.theme,
    required this.total,
    required this.target,
  });

  Pot copyWith({
    String? name,
    String? theme,
    double? total,
    double? target,
  }) {
    return Pot(
      name: name ?? this.name,
      theme: theme ?? this.theme,
      total: total ?? this.total,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'theme': theme,
      'total': total,
      'target': target,
    };
  }

  factory Pot.fromMap(Map<String, dynamic> map) {
    return Pot(
      name: map['name'],
      theme: map['theme'],
      total: map['total'],
      target: map['target'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pot.fromJson(String source) => Pot.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pot(name: $name, theme: $theme, total: $total, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pot &&
        other.name == name &&
        other.theme == theme &&
        other.total == total &&
        other.target == target;
  }

  @override
  int get hashCode {
    return name.hashCode ^ theme.hashCode ^ total.hashCode ^ target.hashCode;
  }
}
