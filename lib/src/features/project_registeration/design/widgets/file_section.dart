import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

import '../manager/project_register_controller.dart';

class FileSection extends StatelessWidget {
  const FileSection({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRegisterControllerImp controller =
        Get.find<ProjectRegisterControllerImp>();
    return SurfaceContainer(
      child: Obx(() {
        return Row(
          children: [
            Text(
              controller.file.toString().split('/').last,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.selectFile();
                },
                icon: const Icon(CupertinoIcons.add))
          ],
        );
      }),
    );
  }
}
