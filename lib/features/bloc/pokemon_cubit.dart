// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pocemons_app/data/model/pokemon_model.dart';
import 'package:pocemons_app/data/repositories/pokemon_repo.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({required this.pokemonRepo}) : super(LoadingState());

  final PokemonRepo pokemonRepo;

  getPokemons() async {
    emit(LoadingState());
    final result = await pokemonRepo.getResult();
    final PokemonModel pokemon = PokemonModel.fromJson(result.data);
    emit(SuccesState(pokemonModel: pokemon));
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

class ErrorState extends PokemonState {}
