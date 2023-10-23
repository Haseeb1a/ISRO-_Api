import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:isroapi/model/isromodel.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:isroapi/model/isromodel.dart';

class Isro {
  final String _url = "https://services.isrostats.in/api/launches";

  Dio? _dio;

  Isro() {
    _dio = Dio();
  }

  Future<List<Isromodel>> getIsro() async {
    try {
      final response = await _dio!.get(_url);
      if (response.statusCode == 200) {
        final List<Isromodel> spaceList =
           isromodelFromJson(json.encode(response.data));
        return spaceList;
      } else {
        print("Failed to fetch space data. Status code: ${response.statusCode}");
        return []; // Return an empty list or handle the error appropriately
      }
    } catch (error) {
      print("An error occurred: $error");
      rethrow;
    }
  }
}
