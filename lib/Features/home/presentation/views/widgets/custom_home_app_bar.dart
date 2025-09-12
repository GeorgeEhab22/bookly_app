import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
      child: Row(
        children: [
          Image.asset(AssetsData.logo,height: 19.1,),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 25,),
          ),
        ],
      ),
    );
  }
}


