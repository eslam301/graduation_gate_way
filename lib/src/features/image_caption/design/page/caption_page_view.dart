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
          child: GetBuilder<CaptionController>(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Caption'),
                SurfaceContainer(
                    height: 300,
                    child: controller.file == null
                        ? Container()
                        : Image.file(
                            controller.file!,
                            fit: BoxFit.fill,
                          )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                        onPressed: () {
                          controller.pickImage();
                        },
                        text: 'pick'),
                    const SizedBox(width: 20),
                    controller.file == null
                        ? Container()
                        : MainButton(
                            onPressed: () {
                              controller.submit();
                            },
                            text: 'submit')
                  ],
                ),
                const SizedBox(height: 20),
                controller.file == null
                    ? Container()
                    : Text(controller.file!.path.split('/').last),
                const SizedBox(height: 20),
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : Container(),
              ],
            );
          }),
        ));
  }
}
