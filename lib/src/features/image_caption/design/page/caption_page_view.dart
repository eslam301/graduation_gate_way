import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/components/surface_container.dart';
import '../controller/caption_controller.dart';

class CaptionPageView extends StatelessWidget {
  const CaptionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final CaptionController controller = Get.put(CaptionController());

    return Scaffold(
        appBar: generalAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Caption'),
              GetBuilder<CaptionController>(builder: (context) {
                return SurfaceContainer(
                    height: 300,
                    child: controller.file == null
                        ? Container()
                        : Image.file(
                            controller.file!,
                            fit: BoxFit.fill,
                          ));
              }),
              const SizedBox(height: 20),
              MainButton(
                  onPressed: () {
                    controller.pickImage();
                  },
                  text: 'pick'),
              const SizedBox(height: 20),
              GetBuilder<CaptionController>(builder: (context) {
                return SurfaceContainer(
                    child: Text('prediction is  ${controller.caption}'));
              }),
              const SizedBox(height: 20),
              MainButton(
                  onPressed: () {
                    controller.submit();
                  },
                  text: 'submit'),
            ],
          ),
        ));
  }
}