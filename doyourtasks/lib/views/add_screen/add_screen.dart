import 'package:doyourtasks/views/add_screen/add_screen_content.dart';
import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:doyourtasks/views/welcome_page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddContentView extends StatelessWidget {
  const AddContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AddScreenContent();
  }
}
