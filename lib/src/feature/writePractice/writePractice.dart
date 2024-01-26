// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
// class WrirePractice extends StatefulWidget {
//   const WrirePractice({Key? key}) : super(key: key);

//   @override
//   State<WrirePractice> createState() => _WrirePracticeState();
// }

// class _WrirePracticeState extends State<WrirePractice> {
//   late final TextRecognizer textRecognizer;
//   String recoText = "";

//   @override
//   Future<void> initState() async {
//     super.initState();
//     final interpreter = await tfl.Interpreter.fromAsset('assets/mobilenet_v1_1.0_224.tflite');
//     textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Declare the GlobalKey outside the build method
//     final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Welcome to learn")),
//       body: Container(
//         alignment: Alignment.center,
//         height: MediaQuery.of(context).size.height - 200,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             // Use Expanded to allow the SignaturePad to take available space
//             Expanded(
//               child: SfSignaturePad(
//                 key: signaturePadKey, // Pass the GlobalKey to the widget
//                 minimumStrokeWidth: 20,
//                 maximumStrokeWidth: 20,
//                 strokeColor: Colors.white,
//                 backgroundColor: Colors.black,
//               ),
//             ),
//             const SizedBox(
//                 height:
//                     16), // Add some spacing between the SignaturePad and the button
//             Column(
//               children: [
//                 ElevatedButton(
//                   child: const Text("Clear"),
//                   onPressed: () async {
//                     signaturePadKey.currentState!.clear();
//                   },
//                 ),
//                 ElevatedButton(
//                   child: const Text("Save As Image"),
//                   onPressed: () async {
//                     final data = await signaturePadKey.currentState!
//                         .toImage(pixelRatio: 3.0);
//                     final imageByteData =
//                         await data.toByteData(format: ui.ImageByteFormat.png);
//                     final uint8List = imageByteData!.buffer.asUint8List();

//                     final appDocDir = await getApplicationDocumentsDirectory();
//                     final filePath = '${appDocDir.path}/image.png';

//                     final file = File(filePath);
//                     file.writeAsBytesSync(uint8List);

//                     try {
//                       final inputImage = InputImage.fromFilePath(filePath);
//                       print(filePath);
//                       final recognizedText =
//                           await textRecognizer.processImage(inputImage);
//                       final text = recognizedText.text.toString();
//                       print(text);
//                       setState(() {
//                         recoText = text;
//                       });
//                       if (await file.exists()) {
//                         await file.delete();
//                         print('File deleted successfully');
//                       } else {
//                         print('File does not exist');
//                       }
//                     } catch (e) {
//                       print('Error: $e');
//                       // Handle the error appropriately
//                     }
//                   },
//                 ),
//                 Text(recoText)
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
