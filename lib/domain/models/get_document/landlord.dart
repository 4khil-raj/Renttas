class GetDocumentModel {
  final String id;
  final String propertyId;
  final String subPropertyId;
  final String imageName;
  final String doctype;
  final String docname;
  final String? description;
  final String createdAt;
  final String updatedAt;
  final String mobileNumber;

  GetDocumentModel({
    required this.id,
    required this.propertyId,
    required this.subPropertyId,
    required this.imageName,
    required this.doctype,
    required this.docname,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.mobileNumber,
  });

  factory GetDocumentModel.fromJson(Map<String, dynamic> json) {
    return GetDocumentModel(
      id: json['id'],
      propertyId: json['propertyid'],
      subPropertyId: json['subPropertyid'],
      imageName: json['ImageName'],
      doctype: json['doctype'],
      docname: json['docname'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      mobileNumber: json['mobileNumber'],
    );
  }

  static List<GetDocumentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GetDocumentModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyid': propertyId,
      'subPropertyid': subPropertyId,
      'ImageName': imageName,
      'doctype': doctype,
      'docname': docname,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'mobileNumber': mobileNumber,
    };
  }
}
