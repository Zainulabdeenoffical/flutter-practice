// // import 'package:flutter/material.dart';
// //
// // class CropEditorScreen extends StatefulWidget {
// //   const CropEditorScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _CropEditorScreenState createState() => _CropEditorScreenState();
// // }
// //
// // class _CropEditorScreenState extends State<CropEditorScreen> {
// //   double _rotation = 0.0;
// //   double _scale = 1.0;
// //   Offset _offset = Offset.zero;
// //
// //   // Corner positions for crop box
// //   Offset _topLeft = const Offset(50, 100);
// //   Offset _topRight = const Offset(300, 100);
// //   Offset _bottomLeft = const Offset(50, 500);
// //   Offset _bottomRight = const Offset(300, 500);
// //
// //   Offset? _activeCorner;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         title: const Text('Crop Document', style: TextStyle(color: Colors.white)),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.undo, color: Colors.white),
// //             onPressed: () {
// //               setState(() {
// //                 _rotation = 0.0;
// //                 _scale = 1.0;
// //                 _offset = Offset.zero;
// //                 _resetCropBox();
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           // Image Preview with Crop Box
// //           Expanded(
// //             child: Stack(
// //               children: [
// //                 // Image to crop
// //                 Center(
// //                   child: GestureDetector(
// //                     onScaleStart: (details) {
// //                       // Store initial values
// //                     },
// //                     onScaleUpdate: (details) {
// //                       setState(() {
// //                         _scale = (_scale * details.scale).clamp(0.5, 3.0);
// //                         _offset += details.focalPointDelta;
// //                       });
// //                     },
// //                     child: Transform.translate(
// //                       offset: _offset,
// //                       child: Transform.rotate(
// //                         angle: _rotation,
// //                         child: Transform.scale(
// //                           scale: _scale,
// //                           child: Container(
// //                             width: 300,
// //                             height: 400,
// //                             color: Colors.grey.shade300,
// //                             child: Center(
// //                               child: Icon(
// //                                 Icons.description,
// //                                 size: 100,
// //                                 color: Colors.grey.shade600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //                 // Crop Box Overlay
// //                 CustomPaint(
// //                   size: Size.infinite,
// //                   painter: CropBoxPainter(
// //                     topLeft: _topLeft,
// //                     topRight: _topRight,
// //                     bottomLeft: _bottomLeft,
// //                     bottomRight: _bottomRight,
// //                   ),
// //                 ),
// //
// //                 // Draggable Corners
// //                 _buildDraggableCorner(_topLeft, (offset) {
// //                   setState(() {
// //                     _topLeft = offset;
// //                   });
// //                 }),
// //                 _buildDraggableCorner(_topRight, (offset) {
// //                   setState(() {
// //                     _topRight = offset;
// //                   });
// //                 }),
// //                 _buildDraggableCorner(_bottomLeft, (offset) {
// //                   setState(() {
// //                     _bottomLeft = offset;
// //                   });
// //                 }),
// //                 _buildDraggableCorner(_bottomRight, (offset) {
// //                   setState(() {
// //                     _bottomRight = offset;
// //                   });
// //                 }),
// //               ],
// //             ),
// //           ),
// //
// //           // Controls
// //           Container(
// //             padding: const EdgeInsets.all(16),
// //             color: Colors.black,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 // Rotation Control
// //                 Row(
// //                   children: [
// //                     const Icon(Icons.rotate_left, color: Colors.white),
// //                     Expanded(
// //                       child: Slider(
// //                         value: _rotation,
// //                         min: -0.5,
// //                         max: 0.5,
// //                         onChanged: (value) {
// //                           setState(() {
// //                             _rotation = value;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                     const Icon(Icons.rotate_right, color: Colors.white),
// //                   ],
// //                 ),
// //
// //                 const SizedBox(height: 16),
// //
// //                 // Action Buttons
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: OutlinedButton(
// //                         onPressed: () {
// //                           _resetCropBox();
// //                         },
// //                         style: OutlinedButton.styleFrom(
// //                           foregroundColor: Colors.white,
// //                           side: const BorderSide(color: Colors.white),
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                         ),
// //                         child: const Text('Reset'),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 16),
// //                     Expanded(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           // Apply crop and navigate to next screen
// //                           Navigator.pushNamed(context, '/rotate-editor');
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Theme.of(context).colorScheme.primary,
// //                           foregroundColor: Colors.white,
// //                           padding: const EdgeInsets.symmetric(vertical: 16),
// //                         ),
// //                         child: const Text('Apply'),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildDraggableCorner(Offset position, Function(Offset) onDrag) {
// //     return Positioned(
// //       left: position.dx - 15,
// //       top: position.dy - 15,
// //       child: GestureDetector(
// //         onPanStart: (details) {
// //           _activeCorner = position;
// //         },
// //         onPanUpdate: (details) {
// //           if (_activeCorner != null) {
// //             onDrag(Offset(
// //               position.dx + details.delta.dx,
// //               position.dy + details.delta.dy,
// //             ));
// //           }
// //         },
// //         onPanEnd: (details) {
// //           _activeCorner = null;
// //         },
// //         child: Container(
// //           width: 30,
// //           height: 30,
// //           decoration: BoxDecoration(
// //             color: Colors.white.withOpacity(0.5),
// //             shape: BoxShape.circle,
// //             border: Border.all(color: Colors.white, width: 2),
// //           ),
// //           child: const Center(
// //             child: Icon(Icons.drag_indicator, color: Colors.white, size: 16),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _resetCropBox() {
// //     setState(() {
// //       _topLeft = const Offset(50, 100);
// //       _topRight = const Offset(300, 100);
// //       _bottomLeft = const Offset(50, 500);
// //       _bottomRight = const Offset(300, 500);
// //     });
// //   }
// // }
// //
// // class CropBoxPainter extends CustomPainter {
// //   final Offset topLeft;
// //   final Offset topRight;
// //   final Offset bottomLeft;
// //   final Offset bottomRight;
// //
// //   CropBoxPainter({
// //     required this.topLeft,
// //     required this.topRight,
// //     required this.bottomLeft,
// //     required this.bottomRight,
// //   });
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final paint = Paint()
// //       ..color = Colors.white
// //       ..strokeWidth = 2
// //       ..style = PaintingStyle.stroke;
// //
// //     // Draw the crop box
// //     final path = Path()
// //       ..moveTo(topLeft.dx, topLeft.dy)
// //       ..lineTo(topRight.dx, topRight.dy)
// //       ..lineTo(bottomRight.dx, bottomRight.dy)
// //       ..lineTo(bottomLeft.dx, bottomLeft.dy)
// //       ..close();
// //
// //     canvas.drawPath(path, paint);
// //
// //     // Draw semi-transparent overlay outside the crop box
// //     final backgroundPaint = Paint()
// //       ..color = Colors.black.withOpacity(0.5)
// //       ..style = PaintingStyle.fill;
// //
// //     final backgroundPath = Path()
// //       ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
// //       ..addPath(path, Offset.zero);
// //
// //     canvas.drawPath(backgroundPath, backgroundPaint);
// //   }
// //
// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class CropEditorScreen extends StatefulWidget {
//   const CropEditorScreen({super.key});
//
//   @override
//   CropEditorScreenState createState() => CropEditorScreenState();
// }
//
// class CropEditorScreenState extends State<CropEditorScreen> {
//   double _rotation = 0.0;
//   double _scale = 1.0;
//   Offset _offset = Offset.zero;
//   Offset _initialFocalPoint = Offset.zero;
//   Offset _initialOffset = Offset.zero;
//
//   // Crop box corners
//   Offset _topLeft = const Offset(50, 100);
//   Offset _topRight = const Offset(300, 100);
//   Offset _bottomLeft = const Offset(50, 500);
//   Offset _bottomRight = const Offset(300, 500);
//
//   Offset? _activeCorner;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title:
//             const Text('Crop Document', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.undo, color: Colors.white),
//             onPressed: () {
//               setState(() {
//                 _rotation = 0.0;
//                 _scale = 1.0;
//                 _offset = Offset.zero;
//                 _resetCropBox();
//               });
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 Center(
//                   child: GestureDetector(
//                     onScaleStart: (details) {
//                       _initialFocalPoint = details.focalPoint;
//                       _initialOffset = _offset;
//                     },
//                     onScaleUpdate: (details) {
//                       setState(() {
//                         _scale = (_scale * details.scale).clamp(0.5, 3.0);
//                         final Offset delta =
//                             details.focalPoint - _initialFocalPoint;
//                         _offset = _initialOffset + delta;
//                       });
//                     },
//                     child: Transform.translate(
//                       offset: _offset,
//                       child: Transform.rotate(
//                         angle: _rotation,
//                         child: Transform.scale(
//                           scale: _scale,
//                           child: Container(
//                             width: 300,
//                             height: 400,
//                             color: Colors.grey.shade300,
//                             child: Center(
//                               child: Icon(Icons.description,
//                                   size: 100, color: Colors.grey.shade600),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 CustomPaint(
//                   size: Size.infinite,
//                   painter: CropBoxPainter(
//                     topLeft: _topLeft,
//                     topRight: _topRight,
//                     bottomLeft: _bottomLeft,
//                     bottomRight: _bottomRight,
//                   ),
//                 ),
//                 _buildDraggableCorner(_topLeft, (offset) {
//                   setState(() {
//                     _topLeft = offset;
//                   });
//                 }),
//                 _buildDraggableCorner(_topRight, (offset) {
//                   setState(() {
//                     _topRight = offset;
//                   });
//                 }),
//                 _buildDraggableCorner(_bottomLeft, (offset) {
//                   setState(() {
//                     _bottomLeft = offset;
//                   });
//                 }),
//                 _buildDraggableCorner(_bottomRight, (offset) {
//                   setState(() {
//                     _bottomRight = offset;
//                   });
//                 }),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             color: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(Icons.rotate_left, color: Colors.white),
//                     Expanded(
//                       child: Slider(
//                         value: _rotation,
//                         min: -0.5,
//                         max: 0.5,
//                         onChanged: (value) {
//                           setState(() {
//                             _rotation = value;
//                           });
//                         },
//                       ),
//                     ),
//                     const Icon(Icons.rotate_right, color: Colors.white),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           _resetCropBox();
//                         },
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           side: const BorderSide(color: Colors.white),
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                         ),
//                         child: const Text('Reset'),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Navigate to next screen or process crop result
//                           Navigator.pushNamed(context, '/rotate-editor');
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               Theme.of(context).colorScheme.primary,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                         ),
//                         child: const Text('Apply'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDraggableCorner(Offset position, Function(Offset) onDrag) {
//     return Positioned(
//       left: position.dx - 15,
//       top: position.dy - 15,
//       child: GestureDetector(
//         onPanUpdate: (details) {
//           onDrag(position + details.delta);
//         },
//         child: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.5),
//             shape: BoxShape.circle,
//             border: Border.all(color: Colors.white, width: 2),
//           ),
//           child: const Center(
//             child: Icon(Icons.drag_indicator, color: Colors.white, size: 16),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _resetCropBox() {
//     _topLeft = const Offset(50, 100);
//     _topRight = const Offset(300, 100);
//     _bottomLeft = const Offset(50, 500);
//     _bottomRight = const Offset(300, 500);
//   }
// }
//
// class CropBoxPainter extends CustomPainter {
//   final Offset topLeft;
//   final Offset topRight;
//   final Offset bottomLeft;
//   final Offset bottomRight;
//
//   CropBoxPainter({
//     required this.topLeft,
//     required this.topRight,
//     required this.bottomLeft,
//     required this.bottomRight,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;
//
//     final path = Path()
//       ..moveTo(topLeft.dx, topLeft.dy)
//       ..lineTo(topRight.dx, topRight.dy)
//       ..lineTo(bottomRight.dx, bottomRight.dy)
//       ..lineTo(bottomLeft.dx, bottomLeft.dy)
//       ..close();
//
//     canvas.drawPath(path, paint);
//
//     final backgroundPaint = Paint()
//       ..color = Colors.black.withOpacity(0.5)
//       ..style = PaintingStyle.fill;
//
//     final backgroundPath = Path.combine(
//       PathOperation.difference,
//       Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
//       path,
//     );
//
//     canvas.drawPath(backgroundPath, backgroundPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class CropToPdfScreen extends StatefulWidget {
  const CropToPdfScreen({Key? key}) : super(key: key);

  @override
  _CropToPdfScreenState createState() => _CropToPdfScreenState();
}

class _CropToPdfScreenState extends State<CropToPdfScreen> {
  final CropController _controller = CropController();
  Uint8List? _imageData;
  Uint8List? _croppedData;
  bool _isCropping = false;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: source);
    if (picked != null) {
      final imageBytes = await File(picked.path).readAsBytes();
      setState(() {
        _imageData = imageBytes;
        _croppedData = null;
        _isCropping = true;
      });
    }
  }

  Future<void> _savePdf() async {
    if (_croppedData == null) return;

    final pdf = pw.Document();
    final image = pw.MemoryImage(_croppedData!);

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(child: pw.Image(image));
      },
    ));

    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/cropped_image.pdf');
    await file.writeAsBytes(await pdf.save());

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved at ${file.path}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crop Image to PDF')),
      body: Column(
        children: [
          if (_imageData == null) ...[
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Capture from Camera'),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.photo),
              label: const Text('Select from Gallery'),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ] else if (_isCropping) ...[
            Expanded(
              child: Crop(
                image: _imageData!,
                controller: _controller,
                onCropped: (Uint8List cropped) {
                  setState(() {
                    _croppedData = cropped;
                    _isCropping = false;
                  });
                },
                withCircleUi: false,
                baseColor: Colors.black,
                maskColor: Colors.black.withOpacity(0.5),
                cornerDotBuilder: (size, edgeAlignment) => const DotControl(),
              ),
            ),
            ElevatedButton(
              onPressed: () => _controller.crop(),
              child: const Text('Crop Image'),
            ),
          ] else if (_croppedData != null) ...[
            Expanded(
              child: Image.memory(_croppedData!),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Save as PDF'),
                onPressed: _savePdf,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class DotControl extends StatelessWidget {
  const DotControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

