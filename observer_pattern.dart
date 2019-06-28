main() async {
  WheatherData weatherData = WheatherData();
  Display display = DisplayDetail();
  display.register(weatherData);
  weatherData.setMeasuremensChanged(22, 35, 750);
  display.dispose();
  await Future.delayed(Duration(seconds: 3));
  Display displayTemp = DisplayTemp();
  displayTemp.register(weatherData);
  weatherData.setMeasuremensChanged(23, 50, 760);
  displayTemp.dispose();
}

class WheatherData implements Subject {
  List<Observer> observers;
  double temp;
  double humidity;
  double pressure;

  WheatherData() {
    observers = [];
  }

  @override
  void notyfyObserver() {
    for (var i = 0; i < observers.length; i++) {
      Observer observer = observers[i];
      print('notyfyObserver ${observers[i]}');
      observer.update(temp, humidity, pressure);
    }
  }

  @override
  void registerObserver(Observer observer) {
    observers.add(observer);
    print('registerObserver $observer');
  }

  @override
  void removeObserver(Observer observer) {
    int i = observers.indexOf(observer);
    if (i >= 0) {
      observers.removeAt(i);
      print('removeObserver $observer');
    }
  }

  void measurementsChanged() {
    notyfyObserver();
  }

  void setMeasuremensChanged(double temp, double humidity, double pressure) {
    this.temp = temp;
    this.humidity = humidity;
    this.pressure = pressure;
    measurementsChanged();
  }
}

abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notyfyObserver();
}

abstract class Observer {
  void update(double temp, double humidity, double pressure);
}

abstract class DisplayElement {
  void display();
}

abstract class Display implements Observer, DisplayElement {
  double temp;
  double humidity;
  double pressure;
  Subject weatherData;

  void register(Subject weatherData) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  void dispose() {
    weatherData.removeObserver(this);
  }

  @override
  void update(double temp, double humidity, double pressure) {
    this.temp = temp;
    this.humidity = humidity;
    this.pressure = pressure;
    display();
  }

  @override
  void display() {}
}

class DisplayDetail extends Display {
  @override
  void display() {
    print('$temp, $humidity, $pressure');
    super.display();
  }
}

class DisplayTemp extends Display {
  @override
  void display() {
    print(temp);
  }
}
