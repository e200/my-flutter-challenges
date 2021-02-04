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
        title: 'Blue (Original Mix)',
        artist: 'Wilson Kentura',
        album: 'Unknown',
        duration: '6:51',
        createdAt: '20 min ago'
      ),
      Music(
        title: 'You Stole My Funk',
        artist: 'Wilson Kentura, Tiuze Money, Chilli Funk',
        album: 'Unknown',
        duration: '6:26',
        createdAt: '15 min ago'
      ),
      Music(
        title: 'Babulla (Original Mix)',
        artist: 'Wilson Kentura, Tiuze Money, Mil Tokes Portuga',
        album: 'Babulla',
        duration: '6:17',
        createdAt: '17 min ago'
      ),
      Music(
        title: 'Jungle Jail',
        artist: 'Wilson Kentura',
        album: 'Unknown',
        duration: '7:24',
        createdAt: '11 min ago'
      ),
      Music(
        title: 'Ingani',
        artist: 'Afro Warriors, Wilson Kentura, Lizwi',
        album: 'Unknown',
        duration: '6:16',
        createdAt: '20-05-27'
      ),
      Music(
        title: 'Mungu',
        artist: 'Wilson Kentura',
        album: 'Unknown',
        duration: '7:54',
        createdAt: '2020-05-27'
      ),
      Music(
        title: 'Hybrid',
        artist: 'Sixnautic, Wilson Kentura',
        album: 'THE SCOTTS',
        duration: '6:26',
        createdAt: '2020-05-26'
      ),
    ];
  }
}
