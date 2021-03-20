import 'package:gql_app/domain/entities/city.dart';

class CityModel extends City {
  CityModel({required String id, required String name, required String slug})
      : super(id: id, name: name, slug: slug);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(id: json["id"], name: json["name"], slug: json["slug"]);
  }
}
