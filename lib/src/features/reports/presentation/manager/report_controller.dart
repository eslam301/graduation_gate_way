import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/external/pdf_manger.dart';

class ReportController extends GetxController {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectFileNameController =
      TextEditingController();
  final TextEditingController superVisorNameController =
      TextEditingController();
  final TextEditingController taskCompletedController = TextEditingController();
  final TextEditingController taskPreparedController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final DateFormat formatter = DateFormat('yyyy-MM-dd/HH:mm');

  import() async {
    if (formKey.currentState!.validate()) {
      try {
        final pdf = pw.Document();
        pdf.addPage(
          pw.Page(build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Align(
                  alignment: pw.Alignment.center,
                  child: pw.Text(projectNameController.text,
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 24,
                      )),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Supervisor: ${superVisorNameController.text}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                    )),
                pw.SizedBox(height: 20),
                pw.Text('Task Completed:.\n ${taskCompletedController.text}',
                    style: const pw.TextStyle(
                      fontSize: 16,
                    )),
                pw.Spacer(),
                pw.Text('Task Prepared:\n ${taskPreparedController.text}',
                    style: const pw.TextStyle(
                      fontSize: 16,
                    )),
                pw.Spacer(),
                pw.Text(
                  'Generated on: ${formatter.format(DateTime.now())}',
                ),
              ],
            );
          }),
        );

        final pdfBytes = await pdf.save();

        String result = await PdfManager.savePdfToDownloads(
            "${projectFileNameController.text}.pdf", pdfBytes);
        log('Result: $result');
        Get.snackbar('Message', result);
      } catch (e) {
        log('Error: $e');
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
