import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../data/caption.dart';

class CaptionController extends GetxController {
  File? file;
  String caption = '';

  final api = Get.find<ApiCaption>();

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    update();
  }

  submit() async {
    log('submit');
    Responseclass response = await api.getCaption(image: file ?? File(''));
    caption = response.data;
    log(caption);
    update();
  }
}
