class AuthorModel {
  final String id;
  final String name;
  final String biography;

  AuthorModel({required this.id, required this.name, required this.biography});

  factory AuthorModel.fromJson(Map<String, dynamic> data) {
    return AuthorModel(
        id: data['id'] ?? 'NA',
        name: data['name'] ?? 'NA',
        biography: data['biography'] ?? "NA");
  }
}
