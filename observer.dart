void main() {
  NewsData newsData = NewsData();
  Display display = Display();
  display.registerListenNewsData(newsData);
  newsData.setNews('Заголовок новости', 'Тело новости');
  display.removeListenNewsData();
  newsData.setNews('Заголовок новости 2', 'Тело новости 2');
}




class NewsData implements Subject {
  List<Observer> observers = [];
  String _title;
  String _body;

  @override
  void _addObserver(Observer observer) {
    observers.add(observer);
    print('add $observer');
  }

  @override
  void _notyfyObserver() {
    for (Observer item in observers) {
      item._update(_title, _body);
    }
  }

  @override
  void _removeObserver(Observer observer) {
    bool result = observers.remove(observer);
    result ? print('$observer is removed') : print('$observer not found');
  }

  void _newsUpdated() {
    _notyfyObserver();
  }

  void setNews(String title, String body) {
    this._title = title;
    this._body = body;
    _newsUpdated();
  }
}

abstract class Subject {
  void _addObserver(Observer observer);
  void _removeObserver(Observer observer);
  void _notyfyObserver();
}

abstract class Observer {
  void _update(String title, String body);
  void registerListenNewsData(Subject newsData);
  void removeListenNewsData();
}

abstract class DisplayElement {
  void _display();
}

class Display implements Observer, DisplayElement {
  String _title;
  String _body;
  Subject _newsData;

  @override
  void _display() {
    print('$_title $_body');
  }

  @override
  void _update(String title, String body) {
    this._title = title;
    this._body = body;
    _display();
  }

  @override
  void registerListenNewsData(Subject newsData) {
    this._newsData = newsData;
    newsData._addObserver(this);
  }

  @override
  void removeListenNewsData() {
    _newsData._removeObserver(this);
  }
}
