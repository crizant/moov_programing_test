import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:q2/constants.dart';
import 'package:q2/models/person.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.json-generator.com/',
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    ),
  );

  Future<List<Person>> getPeople() async {
    try {
      final response = await _dio.get(
        'templates/-xdNcNKYtTFG/data',
      );
      return (response.data as List)
          .map<Person?>((e) => Person.fromJson(e))
          .whereType<Person>()
          .toList();
    } catch (e) {
      debugPrint('API error: $e');
      return [];
    }
  }
}
