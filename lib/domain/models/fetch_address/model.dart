class FetchAddressModel {
  final String id;
  final String address;
  final String pincode;

  FetchAddressModel(
      {required this.id, required this.address, required this.pincode});

  factory FetchAddressModel.fromJson(Map<String, dynamic> json) {
    return FetchAddressModel(
      id: json['Id'],
      address: json['address'],
      pincode: json['pincode'],
    );
  }
}

class AddressResponse {
  final int statusCode;
  final List<FetchAddressModel> data;

  AddressResponse({required this.statusCode, required this.data});

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      statusCode: json['statuscode'],
      data: (json['data'] as List)
          .map((i) => FetchAddressModel.fromJson(i))
          .toList(),
    );
  }
}
