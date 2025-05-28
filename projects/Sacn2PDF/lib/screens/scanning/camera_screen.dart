// // // import 'package:flutter/material.dart';
// // // import 'package:dotted_border/dotted_border.dart';
// // // import 'crop_editor_screen.dart';
// // // import 'filter_contrast_screen.dart';
// // // import 'filter_grayscale_screen.dart';
// // // import 'rotate_editor_screen.dart';
// // //
// // // class mscanCameraScreen extends StatefulWidget {
// // //   const mscanCameraScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _CameraScreenState createState() => _CameraScreenState();
// // // }
// // //
// // // class _CameraScreenState extends State<mscanCameraScreen> {
// // //   bool _capturedImage = false;
// // //   String _flashMode = 'off'; // 'off', 'on', 'auto'
// // //   String _selectedDocType = 'Document'; // 'Document', 'ID Card', 'Receipt'
// // //
// // //   void _toggleFlash() {
// // //     setState(() {
// // //       if (_flashMode == 'off') {
// // //         _flashMode = 'on';
// // //       } else if (_flashMode == 'on') {
// // //         _flashMode = 'auto';
// // //       } else {
// // //         _flashMode = 'off';
// // //       }
// // //     });
// // //   }
// // //
// // //   void _captureImage() {
// // //     setState(() {
// // //       _capturedImage = true;
// // //     });
// // //   }
// // //
// // //   void _resetCamera() {
// // //     setState(() {
// // //       _capturedImage = false;
// // //     });
// // //   }
// // //
// // //   void _selectDocType(String type) {
// // //     setState(() {
// // //       _selectedDocType = type;
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.black,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.black.withOpacity(0.5),
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.close, color: Colors.white),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         actions: [
// // //           IconButton(
// // //             icon: Icon(
// // //               _flashMode == 'off'
// // //                   ? Icons.flash_off
// // //                   : _flashMode == 'on'
// // //                   ? Icons.flash_on
// // //                   : Icons.flash_auto,
// // //               color: Colors.white,
// // //             ),
// // //             onPressed: _toggleFlash,
// // //           ),
// // //           IconButton(
// // //             icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
// // //             onPressed: () {
// // //               // Toggle camera
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           // Camera Preview
// // //           Expanded(
// // //             child: Stack(
// // //               alignment: Alignment.center,
// // //               children: [
// // //                 // In a real app, this would be a camera preview
// // //                 // Using a placeholder for this example
// // //                 Container(
// // //                   color: Colors.black,
// // //                   child: _capturedImage
// // //                       ? Image.asset(
// // //                     'assets/images/sample_document.png',
// // //                     fit: BoxFit.contain,
// // //                     width: double.infinity,
// // //                     height: double.infinity,
// // //                   )
// // //                       : Center(
// // //                     child: AspectRatio(
// // //                       aspectRatio: 3 / 4,
// // //                       child: Container(
// // //                         decoration: BoxDecoration(
// // //                           border: Border.all(
// // //                             color: Colors.grey.withOpacity(0.5),
// // //                             width: 1,
// // //                           ),
// // //                           borderRadius: BorderRadius.circular(8),
// // //                         ),
// // //                         child: DottedBorder(
// // //                           color: Colors.white, // Dotted line color
// // //                           strokeWidth: 2, // Line width
// // //                           dashPattern: [8, 4], // Dash pattern
// // //                           borderType: BorderType.RRect,
// // //                           radius: Radius.circular(8),
// // //                           child: Stack(
// // //                             children: [
// // //                               // Document corner indicators
// // //                               Positioned(
// // //                                 top: 0,
// // //                                 left: 0,
// // //                                 child: _buildCorner(topLeft: true),
// // //                               ),
// // //                               Positioned(
// // //                                 top: 0,
// // //                                 right: 0,
// // //                                 child: _buildCorner(topRight: true),
// // //                               ),
// // //                               Positioned(
// // //                                 bottom: 0,
// // //                                 left: 0,
// // //                                 child: _buildCorner(bottomLeft: true),
// // //                               ),
// // //                               Positioned(
// // //                                 bottom: 0,
// // //                                 right: 0,
// // //                                 child: _buildCorner(bottomRight: true),
// // //                               ),
// // //                               // Guidance text
// // //                               const Center(
// // //                                 child: Text(
// // //                                   'Position your document within the frame',
// // //                                   style: TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 16,
// // //                                   ),
// // //                                   textAlign: TextAlign.center,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 // Edit tools overlay (when image is captured)
// // //                 if (_capturedImage)
// // //
// // //                   Positioned(
// // //                     bottom: 0,
// // //                     left: 0,
// // //                     right: 0,
// // //                     child: Container(
// // //                       padding: const EdgeInsets.symmetric(vertical: 16),
// // //                       color: Colors.black.withOpacity(0.5),
// // //                       child: Row(
// // //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                         children: [
// // //                           GestureDetector(
// // //                             onTap: () {
// // //                               Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(builder: (context) => const CropEditorScreen()),
// // //                               );
// // //                             },
// // //                             child: _buildEditTool(Icons.crop, 'Crop'),
// // //                           ),
// // //                           GestureDetector(
// // //                             onTap: () {
// // //                               Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(builder: (context) => const RotateEditorScreen()),
// // //                               );
// // //                             },
// // //                             child: _buildEditTool(Icons.rotate_right, 'Rotate'),
// // //                           ),
// // //                           GestureDetector(
// // //                             onTap: () {
// // //                               Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(builder: (context) => const FilterContrastScreen()),
// // //                               );
// // //                             },
// // //                             child: _buildEditTool(Icons.filter, 'Filter'),
// // //                           ),
// // //                           GestureDetector(
// // //                             onTap: () {
// // //                               Navigator.push(
// // //                                 context,
// // //                                 MaterialPageRoute(builder: (context) => const FilterGrayscaleScreen()),
// // //                               );
// // //                             },
// // //                             child: _buildEditTool(Icons.tune, 'Adjust'),
// // //                           ),
// // //                         ],
// // //
// // //                       ),
// // //                     ),
// // //                   ),
// // //               ],
// // //             ),
// // //           ),
// // //
// // //           // Document Type Selection
// // //           if (!_capturedImage)
// // //             Container(
// // //               padding: const EdgeInsets.symmetric(vertical: 16),
// // //               color: Colors.black,
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   _buildDocTypeButton('Document'),
// // //                   const SizedBox(width: 16),
// // //                   _buildDocTypeButton('ID Card'),
// // //                   const SizedBox(width: 16),
// // //                   _buildDocTypeButton('Receipt'),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //           // Camera Controls
// // //           Container(
// // //             padding: const EdgeInsets.symmetric(vertical: 24),
// // //             color: Colors.black,
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //               children: _capturedImage
// // //                   ? [
// // //                 // Retake button
// // //                 FloatingActionButton(
// // //                   heroTag: 'retake',
// // //                   onPressed: _resetCamera,
// // //                   backgroundColor: Colors.white24,
// // //                   child: const Icon(Icons.close, color: Colors.white, size: 32),
// // //                 ),
// // //                 // Confirm button
// // //                 FloatingActionButton(
// // //                   heroTag: 'confirm',
// // //                   onPressed: () {
// // //                     // Process the captured image and navigate to edit screen
// // //                     Navigator.pushNamed(context, '/pdf_preview');
// // //                   },
// // //                   backgroundColor: Colors.white,
// // //                   child: const Icon(Icons.check, color: Colors.black, size: 32),
// // //                 ),
// // //               ]
// // //                   : [
// // //                 // Gallery button
// // //                 FloatingActionButton(
// // //                   heroTag: 'gallery',
// // //                   mini: true,
// // //                   onPressed: () {
// // //                     // Open gallery
// // //                   },
// // //                   backgroundColor: Colors.white24,
// // //                   child: const Icon(Icons.photo_library, color: Colors.white),
// // //                 ),
// // //                 // Capture button
// // //                 FloatingActionButton(
// // //                   heroTag: 'capture',
// // //                   onPressed: _captureImage,
// // //                   backgroundColor: Colors.white,
// // //                   child: const Icon(Icons.camera_alt, color: Colors.black, size: 32),
// // //                 ),
// // //                 // Placeholder for alignment
// // //                 const SizedBox(width: 56),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildCorner({
// // //     bool topLeft = false,
// // //     bool topRight = false,
// // //     bool bottomLeft = false,
// // //     bool bottomRight = false,
// // //   }) {
// // //     return Container(
// // //       width: 30,
// // //       height: 30,
// // //       decoration: BoxDecoration(
// // //         border: Border(
// // //           top: BorderSide(
// // //             color: (topLeft || topRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
// // //             width: 3,
// // //           ),
// // //           bottom: BorderSide(
// // //             color: (bottomLeft || bottomRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
// // //             width: 3,
// // //           ),
// // //           left: BorderSide(
// // //             color: (topLeft || bottomLeft) ? Theme.of(context).colorScheme.primary : Colors.transparent,
// // //             width: 3,
// // //           ),
// // //           right: BorderSide(
// // //             color: (topRight || bottomRight) ? Theme.of(context).colorScheme.primary : Colors.transparent,
// // //             width: 3,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildEditTool(IconData icon, String label) {
// // //     return Column(
// // //       mainAxisSize: MainAxisSize.min,
// // //       children: [
// // //         Icon(
// // //           icon,
// // //           color: Colors.white,
// // //           size: 24,
// // //         ),
// // //         const SizedBox(height: 4),
// // //         Text(
// // //           label,
// // //           style: const TextStyle(
// // //             color: Colors.white,
// // //             fontSize: 12,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildDocTypeButton(String type) {
// // //     final isSelected = _selectedDocType == type;
// // //
// // //     return ElevatedButton(
// // //       onPressed: () => _selectDocType(type),
// // //       style: ElevatedButton.styleFrom(
// // //         backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade800,
// // //         foregroundColor: Colors.white,
// // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //       ),
// // //       child: Text(type),
// // //     );
// // //   }
// // // }
// // //
// // // mscan_camera_screen.dart
// // // ignore_for_file: camel_case_types
// //
// // import 'dart:io';
// //
// // import 'package:camera/camera.dart';
// // import 'package:dotted_border/dotted_border.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:path/path.dart' as path;
// // import 'package:path_provider/path_provider.dart';
// //
// // import 'crop_editor_screen.dart';
// // import 'filter_contrast_screen.dart';
// // import 'filter_grayscale_screen.dart';
// // import 'rotate_editor_screen.dart';
// //
// // class mscanCameraScreen extends StatefulWidget {
// //   const mscanCameraScreen({super.key});
// //
// //   @override
// //   CameraScreenState createState() => CameraScreenState();
// // }
// //
// // class CameraScreenState extends State<mscanCameraScreen> {
// //   late CameraController _cameraController;
// //   List<CameraDescription>? _cameras;
// //   bool _capturedImage = false;
// //   String _flashMode = 'off';
// //   String _selectedDocType = 'Document';
// //   File? _imageFile;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeCamera();
// //   }
// //
// //   Future<void> _initializeCamera() async {
// //     _cameras = await availableCameras();
// //     _cameraController = CameraController(_cameras![0], ResolutionPreset.high);
// //     await _cameraController.initialize();
// //     if (!mounted) return;
// //     setState(() {});
// //   }
// //
// //   void _toggleFlash() {
// //     setState(() {
// //       if (_flashMode == 'off') {
// //         _flashMode = 'on';
// //         _cameraController.setFlashMode(FlashMode.torch);
// //       } else if (_flashMode == 'on') {
// //         _flashMode = 'auto';
// //         _cameraController.setFlashMode(FlashMode.auto);
// //       } else {
// //         _flashMode = 'off';
// //         _cameraController.setFlashMode(FlashMode.off);
// //       }
// //     });
// //   }
// //
// //   Future<void> _captureImage() async {
// //     if (!_cameraController.value.isInitialized) return;
// //
// //     final directory = await getTemporaryDirectory();
// //     final filePath = path.join(directory.path, '${DateTime.now()}.jpg');
// //
// //     await _cameraController.takePicture().then((XFile file) {
// //       setState(() {
// //         _imageFile = File(file.path);
// //         _capturedImage = true;
// //       });
// //     });
// //   }
// //
// //   Future<void> _pickFromGallery() async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// //
// //     if (pickedFile != null) {
// //       setState(() {
// //         _imageFile = File(pickedFile.path);
// //         _capturedImage = true;
// //       });
// //     }
// //   }
// //
// //   void _resetCamera() {
// //     setState(() {
// //       _capturedImage = false;
// //       _imageFile = null;
// //     });
// //   }
// //
// //   void _selectDocType(String type) {
// //     setState(() {
// //       _selectedDocType = type;
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _cameraController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         // ignore: deprecated_member_use
// //         backgroundColor: Colors.black.withOpacity(0.5),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.close, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: Icon(
// //               _flashMode == 'off'
// //                   ? Icons.flash_off
// //                   : _flashMode == 'on'
// //                       ? Icons.flash_on
// //                       : Icons.flash_auto,
// //               color: Colors.white,
// //             ),
// //             onPressed: _toggleFlash,
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
// //             onPressed: () async {
// //               final newIndex =
// //                   _cameras!.indexOf(_cameraController.description) == 0 ? 1 : 0;
// //               _cameraController =
// //                   CameraController(_cameras![newIndex], ResolutionPreset.high);
// //               await _cameraController.initialize();
// //               if (mounted) setState(() {});
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Stack(
// //               alignment: Alignment.center,
// //               children: [
// //                 if (!_capturedImage)
// //                   _cameraController.value.isInitialized
// //                       ? CameraPreview(_cameraController)
// //                       : const Center(child: CircularProgressIndicator())
// //                 else
// //                   Image.file(_imageFile!,
// //                       fit: BoxFit.contain, width: double.infinity),
// //                 if (!_capturedImage) _buildFrameOverlay(),
// //                 if (_capturedImage)
// //                   Positioned(
// //                     bottom: 0,
// //                     left: 0,
// //                     right: 0,
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(vertical: 16),
// //                       color: Colors.black.withOpacity(0.5),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           _editTool(
// //                               () => _navigateTo(
// //                                   context, const CropEditorScreen()),
// //                               Icons.crop,
// //                               'Crop'),
// //                           _editTool(
// //                               () => _navigateTo(
// //                                   context, const RotateEditorScreen()),
// //                               Icons.rotate_right,
// //                               'Rotate'),
// //                           _editTool(
// //                               () => _navigateTo(
// //                                   context, const FilterContrastScreen()),
// //                               Icons.filter,
// //                               'Filter'),
// //                           _editTool(
// //                               () => _navigateTo(
// //                                   context, const FilterGrayscaleScreen()),
// //                               Icons.tune,
// //                               'Adjust'),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //               ],
// //             ),
// //           ),
// //           if (!_capturedImage) _buildDocTypeSelector(),
// //           _buildBottomBar(),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildFrameOverlay() {
// //     return Center(
// //       child: AspectRatio(
// //         aspectRatio: 3 / 4,
// //         child:DottedBorder(
// //           color: Colors.white,
// //           strokeWidth: 2,
// //           dashPattern: [8, 4],
// //           borderType: BorderType.RRect,
// //           borderRadius: BorderRadius.all(Radius.circular(8)), // <-- Corrected here
// //           child: Stack(
// //             children: [
// //               Positioned(top: 0, left: 0, child: _buildCorner(topLeft: true)),
// //               Positioned(top: 0, right: 0, child: _buildCorner(topRight: true)),
// //               Positioned(bottom: 0, left: 0, child: _buildCorner(bottomLeft: true)),
// //               Positioned(bottom: 0, right: 0, child: _buildCorner(bottomRight: true)),
// //               const Center(
// //                 child: Text(
// //                   'Position your document within the frame',
// //                   style: TextStyle(color: Colors.white, fontSize: 16),
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //
// //       ),
// //     );
// //   }
// //
// //   Widget _editTool(VoidCallback onTap, IconData icon, String label) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(icon, color: Colors.white, size: 24),
// //           const SizedBox(height: 4),
// //           Text(label,
// //               style: const TextStyle(color: Colors.white, fontSize: 12)),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildCorner({
// //     bool topLeft = false,
// //     bool topRight = false,
// //     bool bottomLeft = false,
// //     bool bottomRight = false,
// //   }) {
// //     return Container(
// //       width: 30,
// //       height: 30,
// //       decoration: BoxDecoration(
// //         border: Border(
// //           top: BorderSide(
// //               color: (topLeft || topRight)
// //                   ? Theme.of(context).colorScheme.primary
// //                   : Colors.transparent,
// //               width: 3),
// //           bottom: BorderSide(
// //               color: (bottomLeft || bottomRight)
// //                   ? Theme.of(context).colorScheme.primary
// //                   : Colors.transparent,
// //               width: 3),
// //           left: BorderSide(
// //               color: (topLeft || bottomLeft)
// //                   ? Theme.of(context).colorScheme.primary
// //                   : Colors.transparent,
// //               width: 3),
// //           right: BorderSide(
// //               color: (topRight || bottomRight)
// //                   ? Theme.of(context).colorScheme.primary
// //                   : Colors.transparent,
// //               width: 3),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildDocTypeSelector() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 16),
// //       color: Colors.black,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           _buildDocTypeButton('Document'),
// //           const SizedBox(width: 16),
// //           _buildDocTypeButton('ID Card'),
// //           const SizedBox(width: 16),
// //           _buildDocTypeButton('Receipt'),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildDocTypeButton(String type) {
// //     final isSelected = _selectedDocType == type;
// //
// //     return ElevatedButton(
// //       onPressed: () => _selectDocType(type),
// //       style: ElevatedButton.styleFrom(
// //         backgroundColor: isSelected
// //             ? Theme.of(context).colorScheme.primary
// //             : Colors.grey.shade800,
// //         foregroundColor: Colors.white,
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //       ),
// //       child: Text(type),
// //     );
// //   }
// //
// //   Widget _buildBottomBar() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 24),
// //       color: Colors.black,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: _capturedImage
// //             ? [
// //                 FloatingActionButton(
// //                   heroTag: 'retake',
// //                   onPressed: _resetCamera,
// //                   backgroundColor: Colors.white24,
// //                   child: const Icon(Icons.close, color: Colors.white, size: 32),
// //                 ),
// //                 FloatingActionButton(
// //                   heroTag: 'confirm',
// //                   onPressed: () {
// //                     Navigator.pushNamed(context, '/pdf_preview');
// //                   },
// //                   backgroundColor: Colors.white,
// //                   child: const Icon(Icons.check, color: Colors.black, size: 32),
// //                 ),
// //               ]
// //             : [
// //                 FloatingActionButton(
// //                   heroTag: 'gallery',
// //                   mini: true,
// //                   onPressed: _pickFromGallery,
// //                   backgroundColor: Colors.white24,
// //                   child: const Icon(Icons.photo_library, color: Colors.white),
// //                 ),
// //                 FloatingActionButton(
// //                   heroTag: 'capture',
// //                   onPressed: _captureImage,
// //                   backgroundColor: Colors.white,
// //                   child: const Icon(Icons.camera_alt,
// //                       color: Colors.black, size: 32),
// //                 ),
// //                 const SizedBox(width: 56),
// //               ],
// //       ),
// //     );
// //   }
// //
// //   void _navigateTo(BuildContext context, Widget screen) {
// //     Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
// //   }
// // }
// // ignore_for_file: camel_case_types
//
// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
//
// import 'crop_editor_screen.dart';
// import 'filter_contrast_screen.dart';
// import 'filter_grayscale_screen.dart';
// import 'rotate_editor_screen.dart';
//
// class mscanCameraScreen extends StatefulWidget {
//   const mscanCameraScreen({super.key});
//
//   @override
//   CameraScreenState createState() => CameraScreenState();
// }
//
// class CameraScreenState extends State<mscanCameraScreen> {
//   late CameraController _cameraController;
//   List<CameraDescription>? _cameras;
//   bool _capturedImage = false;
//   String _flashMode = 'off';
//   String _selectedDocType = 'Document';
//   File? _imageFile;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     // Initialize with the first camera available
//     _cameraController = CameraController(_cameras![0], ResolutionPreset.high);
//     await _cameraController.initialize();
//     if (!mounted) return;
//     setState(() {});
//   }
//
//   void _toggleFlash() {
//     setState(() {
//       if (_flashMode == 'off') {
//         _flashMode = 'on';
//         _cameraController.setFlashMode(FlashMode.torch);
//       } else if (_flashMode == 'on') {
//         _flashMode = 'auto';
//         _cameraController.setFlashMode(FlashMode.auto);
//       } else {
//         _flashMode = 'off';
//         _cameraController.setFlashMode(FlashMode.off);
//       }
//     });
//   }
//
//   Future<void> _captureImage() async {
//     if (!_cameraController.value.isInitialized) return;
//
//     final directory = await getTemporaryDirectory();
//     final filePath = path.join(directory.path, '${DateTime.now()}.jpg');
//
//     await _cameraController.takePicture().then((XFile file) {
//       setState(() {
//         _imageFile = File(file.path);
//         _capturedImage = true;
//       });
//     });
//   }
//
//   Future<void> _pickFromGallery() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//         _capturedImage = true;
//       });
//     }
//   }
//
//   void _resetCamera() {
//     setState(() {
//       _capturedImage = false;
//       _imageFile = null;
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
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
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
//             onPressed: () async {
//               // Toggle between front and back cameras
//               final newIndex =
//               _cameras!.indexOf(_cameraController.description) == 0 ? 1 : 0;
//               _cameraController =
//                   CameraController(_cameras![newIndex], ResolutionPreset.high);
//               await _cameraController.initialize();
//               if (mounted) setState(() {});
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 if (!_capturedImage)
//                   _cameraController.value.isInitialized
//                       ? CameraPreview(_cameraController)
//                       : const Center(child: CircularProgressIndicator())
//                 else
//                   Image.file(_imageFile!,
//                       fit: BoxFit.contain, width: double.infinity),
//                 if (!_capturedImage) _buildFrameOverlay(),
//                 if (_capturedImage) _buildEditToolsOverlay(),
//               ],
//             ),
//           ),
//           if (!_capturedImage) _buildDocTypeSelector(),
//           _buildBottomBar(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFrameOverlay() {
//     return Center(
//       child: AspectRatio(
//         aspectRatio: 3 / 4, // Typical document aspect ratio
//         child: DottedBorder(
//           color: Colors.white,
//           strokeWidth: 2,
//           dashPattern: [8, 4],
//           borderType: BorderType.RRect,
//           radius: Radius.circular(8),
//           child: Stack(
//             children: [
//               // Corner indicators for document alignment
//               Positioned(top: 0, left: 0, child: _buildCorner(topLeft: true)),
//               Positioned(top: 0, right: 0, child: _buildCorner(topRight: true)),
//               Positioned(bottom: 0, left: 0, child: _buildCorner(bottomLeft: true)),
//               Positioned(bottom: 0, right: 0, child: _buildCorner(bottomRight: true)),
//               const Center(
//                 child: Text(
//                   'Position your document within the frame',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditToolsOverlay() {
//     return Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         color: Colors.black.withOpacity(0.5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildEditTool(Icons.crop, 'Crop', () {
//               _navigateTo(context, const CropToPdfScreen());
//             }),
//             _buildEditTool(Icons.rotate_right, 'Rotate', () {
//               _navigateTo(context, const RotateEditorScreen());
//             }),
//             _buildEditTool(Icons.filter, 'Filter', () {
//               _navigateTo(context, const FilterContrastScreen());
//             }),
//             _buildEditTool(Icons.tune, 'Adjust', () {
//               _navigateTo(context, const FilterGrayscaleScreen());
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditTool(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: Colors.white, size: 24),
//           const SizedBox(height: 4),
//           Text(label,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
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
//               color: (topLeft || topRight)
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.transparent,
//               width: 3),
//           bottom: BorderSide(
//               color: (bottomLeft || bottomRight)
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.transparent,
//               width: 3),
//           left: BorderSide(
//               color: (topLeft || bottomLeft)
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.transparent,
//               width: 3),
//           right: BorderSide(
//               color: (topRight || bottomRight)
//                   ? Theme.of(context).colorScheme.primary
//                   : Colors.transparent,
//               width: 3),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDocTypeSelector() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       color: Colors.black,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildDocTypeButton('Document'),
//           const SizedBox(width: 16),
//           _buildDocTypeButton('ID Card'),
//           const SizedBox(width: 16),
//           _buildDocTypeButton('Receipt'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDocTypeButton(String type) {
//     final isSelected = _selectedDocType == type;
//
//     return ElevatedButton(
//       onPressed: () => _selectDocType(type),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected
//             ? Theme.of(context).colorScheme.primary
//             : Colors.grey.shade800,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//       child: Text(type),
//     );
//   }
//
//   Widget _buildBottomBar() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 24),
//       color: Colors.black,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: _capturedImage
//             ? [
//           FloatingActionButton(
//             heroTag: 'retake',
//             onPressed: _resetCamera,
//             backgroundColor: Colors.white24,
//             child: const Icon(Icons.close, color: Colors.white, size: 32),
//           ),
//           FloatingActionButton(
//             heroTag: 'confirm',
//             onPressed: () {
//               // Navigate to PDF preview screen or process the image
//               Navigator.pushNamed(context, '/pdf_preview');
//             },
//             backgroundColor: Colors.white,
//             child: const Icon(Icons.check, color: Colors.black, size: 32),
//           ),
//         ]
//             : [
//           FloatingActionButton(
//             heroTag: 'gallery',
//             mini: true,
//             onPressed: _pickFromGallery,
//             backgroundColor: Colors.white24,
//             child: const Icon(Icons.photo_library, color: Colors.white),
//           ),
//           FloatingActionButton(
//             heroTag: 'capture',
//             onPressed: _captureImage,
//             backgroundColor: Colors.white,
//             child: const Icon(Icons.camera_alt,
//                 color: Colors.black, size: 32),
//           ),
//           const SizedBox(width: 56), // Placeholder for alignment
//         ],
//       ),
//     );
//   }
//
//   void _navigateTo(BuildContext context, Widget screen) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class msCameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<msCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile;
  bool _isConverting = false; // Added to show loading indicator

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    // Ensure that you handle the case where no cameras are available.
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        // Handle no cameras found (e.g., show an error message)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No cameras found on this device.')),
        );
        return;
      }
      final firstCamera = cameras.first;
      _controller = CameraController(firstCamera, ResolutionPreset.high);
      _initializeControllerFuture = _controller.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing camera: $e')),
      );
    }
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        _imageFile = image;
      });
    } on CameraException catch (e) {
      print('Error taking picture: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to take picture: ${e.description}')),
      );
    } catch (e) {
      print('An unexpected error occurred while taking picture: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
  }

  Future<bool> _requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      final result = await Permission.storage.request();
      return result.isGranted;
    }
    return true;
  }

  Future<void> _convertImageToPDF(String imagePath) async {
    setState(() {
      _isConverting = true; // Show loading indicator
    });

    bool permissionGranted = await _requestStoragePermission();
    if (!permissionGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied. Cannot save PDF.')),
      );
      setState(() {
        _isConverting = false; // Hide loading indicator
      });
      return;
    }

    try {
      final imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image file not found.')),
        );
        return;
      }

      final pdf = pw.Document();
      final imageBytes = await imageFile.readAsBytes();
      final image = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
            child: pw.Image(image),
          ),
        ),
      );

      final outputDir = await getApplicationDocumentsDirectory();
      final pdfFileName = 'converted_image_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final pdfFile = File(path.join(outputDir.path, pdfFileName));
      await pdfFile.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF saved successfully at: ${pdfFile.path}'),
          backgroundColor: Colors.green,
        ),
      );

      // Reset image file after successful conversion
      setState(() {
        _imageFile = null;
      });
    } catch (e) {
      print('Error converting image to PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create PDF: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isConverting = false; // Hide loading indicator
      });
    }
  }

  void _retakePicture() {
    setState(() {
      _imageFile = null; // Clear the captured image to go back to camera preview
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera to PDF')),
      body: _imageFile == null
          ? FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Check if controller is initialized before showing preview
            if (_controller.value.isInitialized) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: Text('Camera not initialized.'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
          : Stack(
        fit: StackFit.expand,
        children: [
          Image.file(File(_imageFile!.path), fit: BoxFit.cover),
          if (_isConverting)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          Positioned(
            bottom: 32,
            right: 32,
            child: FloatingActionButton(
              heroTag: "savePdfBtn", // Unique tag for hero animation
              backgroundColor: Colors.white,
              child: const Icon(Icons.check, color: Colors.black),
              onPressed: _isConverting ? null : () => _convertImageToPDF(_imageFile!.path),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 32,
            child: FloatingActionButton(
              heroTag: "retakeBtn", // Unique tag for hero animation
              backgroundColor: Colors.white,
              child: const Icon(Icons.refresh, color: Colors.black),
              onPressed: _isConverting ? null : _retakePicture,
            ),
          ),
        ],
      ),
      floatingActionButton: _imageFile == null
          ? FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera),
      )
          : null,
    );
  }
}
