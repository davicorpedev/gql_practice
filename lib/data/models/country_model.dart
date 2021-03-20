import 'package:gql_app/domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({required String id, required String name})
      : super(id: id, name: name);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(id: json["id"], name: json["name"]);
  }
}
