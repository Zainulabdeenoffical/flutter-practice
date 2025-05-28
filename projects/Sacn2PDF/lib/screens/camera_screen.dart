// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   bool _capturedImage = false;
//   String _flashMode = 'off'; // 'off', 'on', 'auto'
//   String _selectedDocType = 'Document'; // 'Document', 'ID Card', 'Receipt'
//
//   void _toggleFlash() {
//     setState(() {
//       if (_flashMode == 'off') {
//         _flashMode = 'on';
//       } else if (_flashMode == 'on') {
//         _flashMode = 'auto';
//       } else {
//         _flashMode = 'off';
//       }
//     });
//   }
//
//   void _captureImage() {
//     setState(() {
//       _capturedImage = true;
//     });
//   }
//
//   void _resetCamera() {
//     setState(() {
//       _capturedImage = false;
//     });
//   }
//
//   void _selectDocType(String type) {
//     setState(() {
//       _selectedDocType = type;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black.withOpacity(0.5),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               _flashMode == 'off'
//                   ? Icons.flash_off
//                   : _flashMode == 'on'
//                   ? Icons.flash_on
//                   : Icons.flash_auto,
//               color: Colors.white,
//             ),
//             onPressed: _toggleFlash,
//           ),
//           IconButton(
//             icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
//             onPressed: () {
//               // Toggle camera
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Camera Preview
//           Expanded(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 // In a real app, this would be a camera preview
//                 // Using a placeholder for this example
//                 Container(
//                   color: Colors.black,
//                   child: _capturedImage
//                       ? Image.asset(
//                     'assets/images/sample_document.png',
//                     fit: BoxFit.contain,
//                     width: double.infinity,
//                     height: double.infinity,
//                   )
//                       : Center(
//                     child: AspectRatio(
//                       aspectRatio: 3 / 4,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.grey.withOpacity(0.5),
//                             width: 1,
//                           ),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: DottedBorder(
//                           color: Colors.white, // Dotted line color
//                           strokeWidth: 2, // Line width
//                           dashPattern: [8, 4], // Dash pattern
//                           borderType: BorderType.RRect,
//                           radius: Radius.circular(8),
//                           child: Stack(
//                             children: [
//                               // Document corner indicators
//                               Positioned(
//                                 top: 0,
//                                 left: 0,
//                                 child: _buildCorner(topLeft: true),
//                               ),
//                               Positioned(
//                                 top: 0,
//                                 right: 0,
//                                 child: _buildCorner(topRight: true),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 child: _buildCorner(bottomLeft: true),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 right: 0,
//                                 child: _buildCorner(bottomRight: true),
//                               ),
//                               // Guidance text
//                               const Center(
//                                 child: Text(
//                                   'Position your document within the frame',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Edit tools overlay (when image is captured)
//                 if (_capturedImage)
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       color: Colors.black.withOpacity(0.5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _buildEditTool(Icons.crop, 'Crop'),
//                           _buildEditTool(Icons.rotate_right, 'Rotate'),
//                           _buildEditTool(Icons.filter, 'Filter'),
//                           _buildEditTool(Icons.tune, 'Adjust'),
//                         ],
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//
//           // Document Type Selection
//           if (!_capturedImage)
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               color: Colors.black,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildDocTypeButton('Document'),
//                   const SizedBox(width: 16),
//                   _buildDocTypeButton('ID Card'),
//                   const SizedBox(width: 16),
//                   _buildDocTypeButton('Receipt'),
//                 ],
//               ),
//             ),
//
//           // Camera Controls
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             color: Colors.black,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: _capturedImage
//                   ? [
//                 // Retake button
//                 FloatingActionButton(
//                   heroTag: 'retake',
//                   onPressed: _resetCamera,
//                   backgroundColor: Colors.white24,
//                   child: const Icon(Icons.close, color: Colors.white, size: 32),
//                 ),
//                 // Confirm button
//                 FloatingActionButton(
//                   heroTag: 'confirm',
//                   onPressed: () {
//                     // Process the captured image and navigate to edit screen
//                     Navigator.pushNamed(context, '/pdf_preview');
//                   },
//                   backgroundColor: Colors.white,
//                   child: const Icon(Icons.check, color: Colors.black, size: 32),
//                 ),
//               ]
//                   : [
//                 // Gallery button
//                 FloatingActionButton(
//                   heroTag: 'gallery',
//                   mini: true,
//                   onPressed: () {
//                     // Open gallery
//                   },
//                   backgroundColor: Colors.white24,
//                   child: const Icon(Icons.photo_library, color: Colors.white),
//                 ),
//                 // Capture button
//                 FloatingActionButton(
//                   heroTag: 'capture',
//                   onPressed: _captureImage,
//                   backgroundColor: Colors.white,
//                   child: const Icon(Icons.camera_alt, color: Colors.black, size: 32),
//                 ),
//                 // Placeholder for alignment
//                 const SizedBox(width: 56),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCorner({
//     bool topLeft = false,
//     bool topRight = false,
//     bool bottomLeft = false,
//     bool bottomRight = false,
//   }) {
//     return Container(
//       width: 30,
//       height: 30,
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: (topLeft || topRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
//             width: 3,
//           ),
//           bottom: BorderSide(
//             color: (bottomLeft || bottomRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
//             width: 3,
//           ),
//           left: BorderSide(
//             color: (topLeft || bottomLeft) ? Theme.of(context).colorScheme.primary : Colors.transparent,
//             width: 3,
//           ),
//           right: BorderSide(
//             color: (topRight || bottomRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
//             width: 3,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditTool(IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           icon,
//           color: Colors.white,
//           size: 24,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDocTypeButton(String type) {
//     final isSelected = _selectedDocType == type;
//
//     return ElevatedButton(
//       onPressed: () => _selectDocType(type),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade800,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//       child: Text(type),
//     );
//   }
// }
//
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';

class DocumentScannerPage extends StatefulWidget {
  const DocumentScannerPage({Key? key}) : super(key: key);

  @override
  _DocumentScannerPageState createState() => _DocumentScannerPageState();
}

class _DocumentScannerPageState extends State<DocumentScannerPage> {
  File? _scannedImage;
  String _recognizedText = '';
  bool _isProcessing = false;
  String? _savedPdfPath;

  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  Future<void> scanDocument() async {
    File? scannedFile = await DocumentScannerFlutter.launch(context);

    if (scannedFile == null) return;

    setState(() {
      _scannedImage = scannedFile;
      _recognizedText = '';
      _isProcessing = true;
      _savedPdfPath = null;
    });

    final inputImage = InputImage.fromFile(scannedFile);
    final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

    setState(() {
      _recognizedText = recognizedText.text;
      _isProcessing = false;
    });

    await _generatePdfFromImage(scannedFile);
  }


  Future<void> _generatePdfFromImage(File imageFile) async {
    final pdfDoc = pw.Document();

    final imageBytes = await imageFile.readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdfDoc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Center(
            child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
          );
        },
      ),
    );

    final outputDir = await getApplicationDocumentsDirectory();
    final pdfPath = '${outputDir.path}/scanned_document_${DateTime.now().millisecondsSinceEpoch}.pdf';

    final pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(await pdfDoc.save());

    setState(() {
      _savedPdfPath = pdfPath;
    });
  }

  void _openPdf() {
    if (_savedPdfPath != null) {
      OpenFile.open(_savedPdfPath);
    }
  }

  @override
  void dispose() {
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Scanner with OCR & PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (_scannedImage != null)
              Expanded(
                flex: 3,
                child: Image.file(_scannedImage!),
              )
            else
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    'No document scanned yet.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            _isProcessing
                ? const CircularProgressIndicator()
                : Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Text(
                  _recognizedText.isEmpty ? 'No text recognized.' : _recognizedText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (_savedPdfPath != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Open Scanned PDF'),
                onPressed: _openPdf,
              ),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan Document'),
              onPressed: _isProcessing ? null : scanDocument,
            ),
          ],
        ),
      ),
    );
  }
}
