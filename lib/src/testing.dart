import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

import 'core/widgets/show/show_loading_widget.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadableState(
      isLoading: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Testing'),
          MainButton(
            onPressed: () {},
            text: 'Login',
          ),
        ],
      ),
    ));
  }
}
