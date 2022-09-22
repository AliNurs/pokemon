part of '../pokemon_screen.dart';

class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PokeApp',
              style: AppTextStyles.white48w700,
            ),
            const SizedBox(width: 12),
            Image.asset(
              'assets/images/icon.png',
              scale: 11,
            )
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Pokemon list',
          style: AppTextStyles.white24w600,
        ),
        const SizedBox(height: 12),
        const Text(
          'Find the pokemon you want',
          style: AppTextStyles.white14w500,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(child: AppTextField()),
            // ),
            const SizedBox(
              width: 15,
              // height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                // ignore: sort_child_properties_last
                child: const Icon(
                  Icons.search,
                  color: AppColors.fieldText,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.itemPoints,
                ),
                height: 46,
                width: 46,
              ),
            )
          ],
        ),
      ],
    );
  }
}