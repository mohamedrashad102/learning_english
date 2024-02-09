import 'package:audioplayers/audioplayers.dart';

abstract class AudioService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static playFromAssets(String path) {
    _audioPlayer.play(AssetSource(path));
  }
}
