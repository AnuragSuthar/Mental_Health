// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:audioplayers/audioplayers.dart';

// class CameraAudioPage extends StatefulWidget {
//   final bool isDarkMode;
//   final VoidCallback toggleTheme;

//   const CameraAudioPage({
//     Key? key,
//     required this.isDarkMode,
//     required this.toggleTheme,
//   }) : super(key: key);

//   @override
//   _CameraAudioPageState createState() => _CameraAudioPageState();
// }

// class _CameraAudioPageState extends State<CameraAudioPage> {
//   late AudioPlayer _audioPlayer;
//   bool _isPlaying = false;
//   String? _localFilePath;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     _loadAudioFile();
//   }

//   Future<void> _loadAudioFile() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/audio.mp3'; // replace with your file
//     // simulate saving a file locally if needed
//     // File(filePath).writeAsBytes(...);
//     setState(() {
//       _localFilePath = filePath;
//     });
//   }

//   Future<void> _togglePlayback() async {
//     if (_isPlaying) {
//       await _audioPlayer.stop();
//     } else {
//       if (_localFilePath != null && File(_localFilePath!).existsSync()) {
//         await _audioPlayer.play(DeviceFileSource(_localFilePath!));
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Audio file not found")));
//         return;
//       }
//     }

//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDark = widget.isDarkMode;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera & Audio'),
//         backgroundColor: isDark ? Colors.grey[900] : Colors.green,
//         actions: [
//           IconButton(
//             icon: AnimatedSwitcher(
//               duration: Duration(milliseconds: 400),
//               child:
//                   isDark
//                       ? Icon(Icons.dark_mode, key: ValueKey('moon'))
//                       : Icon(Icons.wb_sunny, key: ValueKey('sun')),
//             ),
//             onPressed: widget.toggleTheme,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               _isPlaying ? Icons.stop_circle : Icons.play_circle_fill,
//               size: 80,
//               color: isDark ? Colors.orangeAccent : Colors.green,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: _togglePlayback,
//               icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
//               label: Text(_isPlaying ? "Stop" : "Play"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: isDark ? Colors.orange : Colors.green,
//                 foregroundColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: isDark ? Colors.black : Colors.white,
//     );
//   }
// }
