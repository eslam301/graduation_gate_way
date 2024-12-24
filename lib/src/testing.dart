import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

import 'core/external/pdf_manger.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Testing'),
        MainButton(
          onPressed: () async {
            PdfManager.savePdfToDownloads(
              'test.pdf',
              await PdfManager.generateSamplePdf('test'),
            );
          },
          text: 'press',
        ),
      ],
    ));
  }
}
