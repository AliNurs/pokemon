import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemons_app/features/bloc/pokemon_cubit.dart';
import 'package:pocemons_app/features/screens/pokemon_item.dart';
import 'package:pocemons_app/themes/app_colors.dart';
import 'package:pocemons_app/themes/text_styles.dart';
import '../../widgets/text_field.dart';
part 'widgets/app_bar.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff372323),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          _AppBar(),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<PokemonCubit, PokemonState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return CircularProgressIndicator.adaptive();
                }
                if (state is SuccesState) {
                  return ListView.separated(
                    itemBuilder: (context, index) => PokemonItems(
                      image: state.pokemonModel.results?[index].image,
                      name: state.pokemonModel.results?[index].name,
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemCount: state.pokemonModel.results!.length,
                  );
                }
                return Text('Error !');
              },
            ),
          ),
        ]),
      ),
    );
  }
}
