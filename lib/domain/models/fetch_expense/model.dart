class FetchExpenseModel {
  final String id;
  final String landlordId;
  final String propertyId;
  final String subPropertyId;
  final String category;
  final String name;
  final DateTime expensesDate;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  FetchExpenseModel({
    required this.id,
    required this.landlordId,
    required this.propertyId,
    required this.subPropertyId,
    required this.category,
    required this.name,
    required this.expensesDate,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FetchExpenseModel.fromJson(Map<String, dynamic> json) {
    return FetchExpenseModel(
      id: json['id'],
      landlordId: json['landlordId'],
      propertyId: json['propertyId'],
      subPropertyId: json['subPropertyId'],
      category: json['category'],
      name: json['name'],
      expensesDate: DateTime.parse(json['expensesDate']),
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'landlordId': landlordId,
      'propertyId': propertyId,
      'subPropertyId': subPropertyId,
      'category': category,
      'name': name,
      'expensesDate': expensesDate.toIso8601String(),
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
