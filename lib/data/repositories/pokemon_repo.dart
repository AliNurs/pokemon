// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class PokemonRepo {
  PokemonRepo({required this.dio});
  final Dio dio;

  Future<Response> getResult(String name) async {
    return await dio.get(
      'character/',
      queryParameters: {'name': name},
    );
  }
}
