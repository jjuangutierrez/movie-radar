class ProductionCompanyModel {
  int id;
  String name;
  String logoPath;
  String originalCountry;

  ProductionCompanyModel({
    required this.id,
    required this.name,
    required this.logoPath,
    required this.originalCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'] ?? '',
      originalCountry: json['origin_country'] ?? '',
    );
  }
}
