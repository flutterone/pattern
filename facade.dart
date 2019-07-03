void main() async {
  HomeTheaterFacade facade = HomeTheaterFacade(
      mediaPayer: MediaPayer(), projector: Projector(), screen: Screen());
  facade.watchMovie('Matrix');
  await Future.delayed(Duration(seconds: 1)).then((_) => print(''));
  facade.endMovie();
  await Future.delayed(Duration(seconds: 1)).then((_) => print(''));  
  facade.endMovie();
}

class HomeTheaterFacade {
  Screen screen;
  Projector projector;
  MediaPayer mediaPayer;
  String movie;

  HomeTheaterFacade({this.screen, this.projector, this.mediaPayer});

  void watchMovie(String movie) {
    screen.down();
    projector.on();
    projector.wideScreenMode();
    mediaPayer.on();
    mediaPayer.play(movie);
    print('воспроизведение фильма $movie');
    this.movie = movie;
  }

  void endMovie() {
    if (movie != null) {
      screen.up();
      projector.off();
      projector.wideScreenModeOff();
      mediaPayer.off();
      mediaPayer.stop(this.movie);
      print('сеанс окончен )');
      this.movie = null;
    } else {
      print('nothing');
    }
  }
}

class MediaPayer {
  void play(String movie) {
    print('play $movie');
  }

  void on() {
    print('mediaplayer on');
  }

  void off() {
    print('mediaplayer off');
  }

  void stop(String movie) {
    print('stop $movie');
  }
}

class Projector {
  void on() {
    print('projector on');
  }

  void wideScreenMode() {
    print('widescreenmode');
  }

  void off() {
    print('projector off');
  }

  void wideScreenModeOff() {
    print('widescreenmode off');
  }
}

class Screen {
  void down() {
    print('screen ready');
  }

  void up() {
    print('screen closed');
  }
}
