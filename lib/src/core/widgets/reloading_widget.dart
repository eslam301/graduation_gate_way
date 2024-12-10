import 'package:flutter/cupertino.dart';

class ReloadingWidget extends StatelessWidget {
  const ReloadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator());
  }
}
