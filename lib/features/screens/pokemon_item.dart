import 'package:flutter/material.dart';
import 'package:pocemons_app/themes/app_colors.dart';
import 'package:pocemons_app/themes/text_styles.dart';

class PokemonItems extends StatelessWidget {
  const PokemonItems({super.key, required this.name, required this.image});

  final name;
  final image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: AppTextStyles.poppins18w500,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.itemPoints,
            ),
            height: 74,
            width: double.infinity,
          ),
          Positioned(
            right: 3,
            bottom: 0,
            child: Image.asset(
              'assets/images/pokemon.png',
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }
}
