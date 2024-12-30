import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

import 'features/image_caption/data/caption.dart';
import 'features/image_caption/data/model/caption_model.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainButton(
              onPressed: () async {
                final File file;
                final api = Get.find<ApiCaption>();
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  file = File(result.files.single.path!);
                  CaptionModel response = await api.getCaption(
                    image: file,
                  );
                  log(response.data.toString());
                } else {
                  // User canceled the picker
                }
              },
              text: 'test'),
        ],
      ),
    );
  }
}
