// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pocemons_app/data/model/pokemon_model.dart';

class PokemonRepo {
  PokemonRepo({required this.dio});
  final Dio dio;

  Future<Response> getResult() async {
    return await dio.get('character/');
  }
}
