
// import 'package:tflite/tflite.dart';

// class Reco {
//   // Create an async method to load the model
//   Future<void> loadModel() async {
//     String? res = await Tflite.loadModel(
//       model: "assets/mobilenet_v1_1.0_224.tflite",
//       labels: "assets/labels.txt",
//       numThreads: 1, // defaults to 1
//       isAsset: true, // defaults to true, set to false to load resources outside assets
//       useGpuDelegate: false, // defaults to false, set to true to use GPU delegate
//     );

//     // You can handle the result or perform any other logic here
//     print("Model loading result: $res");
//   }
// }