class Track {
  String title;
  String artist;
  String album;
  String coverUrl;
  String duration;
  String createdAt;

  Track({
    this.title,
    this.artist,
    this.album,
    this.coverUrl,
    this.duration,
    this.createdAt,
  });
}

final tracks = [
  Track(
      title: 'Babulla (Original Mix)',
      artist: 'Wilson Kentura, Tiuze Money, Mil Tokes Portuga',
      album: 'Babulla',
      coverUrl: 'assets/babulla-cover.jpg',
      duration: '6:17',
      createdAt: '17 min ago'),
  Track(
      title: 'Blue (Original Mix)',
      artist: 'Wilson Kentura',
      album: 'Unknown',
      duration: '6:51',
      createdAt: '20 min ago'),
  Track(
      title: 'You Stole My Funk',
      artist: 'Wilson Kentura, Tiuze Money, Chilli Funk',
      album: 'Unknown',
      duration: '6:26',
      createdAt: '15 min ago'),
  Track(
      title: 'Jungle Jail',
      artist: 'Wilson Kentura',
      album: 'Unknown',
      duration: '7:24',
      createdAt: '11 min ago'),
  Track(
      title: 'Ingani',
      artist: 'Afro Warriors, Wilson Kentura, Lizwi',
      album: 'Unknown',
      duration: '6:16',
      createdAt: '20-05-27'),
  Track(
      title: 'Mungu',
      artist: 'Wilson Kentura',
      album: 'Unknown',
      duration: '7:54',
      createdAt: '2020-05-27'),
  Track(
      title: 'Hybrid',
      artist: 'Sixnautic, Wilson Kentura',
      album: 'Unknown',
      duration: '6:26',
      createdAt: '2020-05-26'),
  Track(
      title: 'Malembe',
      artist: 'Wilson Kentura & Afro Warriors',
      album: 'Unknown',
      coverUrl: 'assets/malembe-cover.jpg',
      duration: '6:13',
      createdAt: '2020-05-26'),
];
