import 'package:intl/intl.dart';

class FetchTenantBills {
  final String id;
  final String propertyId;
  final String subPropertyId;
  final String tenantName;
  final String phone;
  final String email;
  final String advanceAmount;
  final String createdAt;
  final String updatedAt;
  final String landlordId;
  final String startDate;
  final String endDate;
  final String address;

  FetchTenantBills({
    required this.id,
    required this.propertyId,
    required this.subPropertyId,
    required this.tenantName,
    required this.phone,
    required this.email,
    required this.advanceAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.landlordId,
    required this.startDate,
    required this.endDate,
    required this.address,
  });

  factory FetchTenantBills.fromJson(Map<String, dynamic> json) {
    return FetchTenantBills(
      id: json['id'],
      propertyId: json['propertyId'],
      subPropertyId: json['subPropertyId'],
      tenantName: json['tenantName'],
      phone: json['phone'],
      email: json['email'],
      advanceAmount: json['advanceAmount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      landlordId: json['landlordId'],
      startDate: _formatDate(json['startDate']),
      endDate: _formatDate(json['endDate']),
      address: json['address'] ?? '',
    );
  }

  static String _formatDate(String date) {
    // Parsing the incoming date string
    DateTime parsedDate = DateTime.parse(date);

    // Formatting the date to 'dd MMM' format
    return DateFormat('dd MMM').format(parsedDate);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyId': propertyId,
      'subPropertyId': subPropertyId,
      'tenantName': tenantName,
      'phone': phone,
      'email': email,
      'advanceAmount': advanceAmount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'landlordId': landlordId,
      'startDate': startDate,
      'endDate': endDate,
      'address': address,
    };
  }
}
