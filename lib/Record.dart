import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

//final Directory tempDir = await getTemporaryDirectory();
//
// final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
//
// final Directory? downloadsDir = await getDownloadsDirectory();

Future<void> startRecording() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/recording.mp3');

  final sound = FlutterSoundRecorder();
  await sound.startRecorder(toFile: file.path);
}

Future<void> stopRecording() async {
  final sound = FlutterSoundRecorder();
  await sound.stopRecorder();
}

Future<Duration?> playRecording(String uri) async {
  return FlutterSoundPlayer().startPlayer(fromURI: uri, codec: Codec.mp3);
}


