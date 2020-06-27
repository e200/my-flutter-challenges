class Music {
  String title;
  String artist;
  String album;
  String duration;
  String createdAt;

  Music({
    this.title,
    this.artist,
    this.album,
    this.duration,
    this.createdAt,
  });
}

class MusicRepository {
  Future<List<Music>> getAll() async {
    return [
      Music(
        title: 'So Heavy I Fell Through the Earth (Visualizer)',
        artist: 'Grimes',
        album: 'So Heavy I Fell Through the Earth (Visualizer)',
        duration: '3:52',
        createdAt: '20 min ago'
      ),
      Music(
        title: 'WISH',
        artist: 'Denzel Curry Feat. Kiddo Marv',
        album: 'ZUU',
        duration: '3:12',
        createdAt: '15 min ago'
      ),
      Music(
        title: 'Cayendo',
        artist: 'Frank Ocean',
        album: 'Side A - Acoustic',
        duration: '3:23',
        createdAt: '17 min ago'
      ),
      Music(
        title: 'Wdpk 83.7 FM',
        artist: 'Daft Punk',
        album: 'Homework',
        duration: '0:28',
        createdAt: '11 min ago'
      ),
      Music(
        title: 'Say It',
        artist: 'Flume feat. Tove Lo',
        album: 'Skin',
        duration: '4:22',
        createdAt: '20-05-27'
      ),
      Music(
        title: 'Mistubishi Sony',
        artist: 'Frank Ocean',
        album: 'Endless',
        duration: '2:26',
        createdAt: '2020-05-27'
      ),
      Music(
        title: 'THE SCOTTS',
        artist: 'THE SCOTTS',
        album: 'THE SCOTTS',
        duration: '2:46',
        createdAt: '2020-05-26'
      ),
    ];
  }
}
