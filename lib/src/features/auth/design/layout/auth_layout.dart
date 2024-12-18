import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/login_app_bar.dart';

class AuthLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const AuthLayout({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LoginAppBar(title: title),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - 90,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svg/login_image.svg',
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.only(
                    top: 31,
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: body,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
