import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
        child: Row(
          children: [
            Image.asset(AssetsData.logo, height: 19.1),
            const Spacer(),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.search);
              },
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
