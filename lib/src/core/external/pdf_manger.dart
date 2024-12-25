import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class PdfManager {
  // Save a PDF to the application-specific directory
  static Future<String> savePdfToAppDirectory(
      String fileName, List<int> pdfBytes) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return 'Error: A file with the name "$fileName" already exists in the application directory.';
      }

      await file.writeAsBytes(pdfBytes);
      return 'PDF saved successfully to: $filePath';
    } catch (e) {
      return 'Error saving PDF: $e';
    }
  }

  // Save a PDF to the Downloads directory
  static Future<String> savePdfToDownloads(
      String fileName, List<int> pdfBytes) async {
    try {
      // Request storage permissions
      if (await Permission.storage.request().isDenied) {
        return 'Storage permission denied.';
      }

      // Define the Downloads folder path
      final directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        return 'Downloads folder not found.';
      }

      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return 'Error: A file with the name "$fileName" already exists in the Downloads folder.';
      }

      await file.writeAsBytes(pdfBytes);
      return 'PDF saved successfully to: $filePath';
    } catch (e) {
      return 'Error saving PDF: $e';
    }
  }

  // Save a PDF to a user-selected directory
  static Future<String> savePdfWithPicker(
      String fileName, List<int> pdfBytes) async {
    try {
      final selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        return 'Directory selection was canceled.';
      }

      // Request storage permissions
      if (await Permission.storage.request().isDenied) {
        return 'Storage permission denied.';
      }

      final filePath = '$selectedDirectory/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return 'Error: A file with the name "$fileName" already exists in the selected directory.';
      }

      await file.writeAsBytes(pdfBytes);
      return 'PDF saved successfully to: $filePath';
    } catch (e) {
      return 'Error saving PDF: $e';
    }
  }

  // Generate a sample PDF
  static Future<List<int>> generateSamplePdf(String content) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(content),
        ),
      ),
    );
    return pdf.save();
  }
}
