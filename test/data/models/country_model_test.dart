
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gql_app/data/models/country_model.dart';
import 'package:gql_app/domain/entities/country.dart';


import '../../fixtures/fixture_reader.dart';

void main() {
  final tCountryModel = CountryModel(id: "test", name: "test");

  test("should be a subclass of Country entity", () async {
    expect(tCountryModel, isA<Country>());
  });

  group("fromJson", () {
    test("should return a valid object", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture("country.json"));

      final result = CountryModel.fromJson(jsonMap);

      expect(result, tCountryModel);
    });
  });
}