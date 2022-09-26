import 'dart:developer';

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
      backgroundColor: AppColors.contentColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(children: [
          _AppBar(),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<PokemonCubit, PokemonState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                if (state is SuccesState) {
                  return NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      final current = notification.metrics.pixels + 100;
                      final max = notification.metrics.maxScrollExtent;
                      if (current >= max) {
                        log('True');
                      }
                      return false;
                    },
                    child: ListView.separated(
                      itemBuilder: (context, index) => PokemonItems(
                        image: state.pokemonModel.results?[index].image,
                        name: state.pokemonModel.results?[index].name,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                      itemCount: state.pokemonModel.results!.length,
                    ),
                  );
                }
                if (state is ErrorState) {
                  return Text(
                    state.message ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppins14w500
                        .copyWith(color: Colors.white70),
                  );
                }
                return Text('Vse state Error !');
              },
            ),
          ),
        ]),
      ),
    );
  }
}
