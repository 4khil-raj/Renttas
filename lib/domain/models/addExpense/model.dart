import 'dart:convert';

class AddExpenseModel {
  final String uid;
  final String propertyID;
  final String subPropertyId;
  final String category;
  final String name;
  final String amount;
  final String expensesDate;
  final String description;
  AddExpenseModel({
    required this.uid,
    required this.propertyID,
    required this.subPropertyId,
    required this.category,
    required this.name,
    required this.amount,
    required this.expensesDate,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'propertyID': propertyID,
      'subPropertyId': subPropertyId,
      'category': category,
      'name': name,
      'amount': amount,
      'expensesDate': expensesDate,
      'description': description,
    };
  }

  factory AddExpenseModel.fromMap(Map<String, dynamic> map) {
    return AddExpenseModel(
      uid: map['uid'] as String,
      propertyID: map['propertyID'] as String,
      subPropertyId: map['subPropertyId'] as String,
      category: map['category'] as String,
      name: map['name'] as String,
      amount: map['amount'] as String,
      expensesDate: map['expensesDate'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddExpenseModel.fromJson(String source) =>
      AddExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
