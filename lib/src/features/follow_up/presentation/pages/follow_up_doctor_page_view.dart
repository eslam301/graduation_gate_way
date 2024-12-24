import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';

class FollowUpDoctorPageView extends StatelessWidget {
  const FollowUpDoctorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Follow Ups',
      ),
    );
  }
}
