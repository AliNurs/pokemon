// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pocemons_app/data/model/pokemon_model.dart';
import 'package:pocemons_app/data/repositories/pokemon_repo.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({required this.pokemonRepo}) : super(LoadingState());

  final PokemonRepo pokemonRepo;

  getPokemons(String? name) async {
    emit(LoadingState());

    try {
      final result = await pokemonRepo.getResult(name!);
      final PokemonModel pokemon = PokemonModel.fromJson(result.data);
      emit(SuccesState(pokemonModel: pokemon));
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode.toString() == 404.toString()) {
          emit(ErrorState(message: 'Нет Персонаж с таким именем!'));
        }
        if (e.type == DioErrorType.other) {
          emit(ErrorState(message: 'Нет Подключение к интернету'));
        }
      }
    }
  }
}

abstract class PokemonState {}

class SuccesState extends PokemonState {
  final PokemonModel pokemonModel;
  SuccesState({
    required this.pokemonModel,
  });
}

class InitialState extends PokemonState {}

class LoadingState extends PokemonState {}

class ErrorState extends PokemonState {
  ErrorState({required this.message});
  final message;
}
