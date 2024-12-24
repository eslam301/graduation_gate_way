import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/custom_drawer.dart';

class ReportsPageView extends StatelessWidget {
  const ReportsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Reports',
      ),
      body: const Center(
        child: Text('ReportsPageView'),
      ),
    );
  }
}
