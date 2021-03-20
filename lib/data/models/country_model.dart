import 'package:gql_app/domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({required String id, required String name, required String slug})
      : super(id: id, name: name, slug: slug);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(id: json["id"], name: json["name"], slug: json["slug"]);
  }
}
