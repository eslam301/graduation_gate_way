import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../controller/chat_controller.dart';
import '../widget/chat_input.dart';
import '../widget/chat_widget.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatControllerImp controller = Get.put(ChatControllerImp());
    return Scaffold(
      appBar: generalAppBar(
        title: 'Chat Bot',
        centerTitle: true,
        height: 70,
      ),
      resizeToAvoidBottomInset: true,
      // Ensure layout adjusts when keyboard opens
      body: SafeArea(
          child: Column(
        children: [
          ChatBuilder(controller: controller),
          ChatInput(controller: controller),
        ],
      )),
    );
  }
}
