import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/login_app_bar.dart';

class AuthLayout extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final String title;
  final String subTitle;

  const AuthLayout(
      {super.key,
      required this.appBarTitle,
      required this.body,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: LoginAppBar(title: appBarTitle),
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
                  child: Column(
                    children: [
                      FadeInLeft(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title.capitalize!,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ),
                      FadeInLeft(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: Text(
                                subTitle,
                                style: theme.textTheme.bodyMedium,
                              ),
                            )),
                      ),
                      body
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
