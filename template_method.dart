void main() {
  CaffeineBeverage caffeineBeverage = Tea();
  caffeineBeverage.wantAddCondiments(true);
  caffeineBeverage.prepareRecipe();
}

abstract class CaffeineBeverage {
  bool wantsCondiments = false;
  void prepareRecipe() {
    //final
    
    boilWater();
    brew();
    pourInCup();

    if (wantsCondiments) {
      addCondiments();
    }
  }

  void brew();
  void addCondiments();

  void boilWater() {
    print('вскипятить воду');
  }

  void pourInCup() {
    print('перелить в чашку');
  }

  void wantAddCondiments(bool addCondiments) {
    wantsCondiments = addCondiments;
  }
}

class Coffee extends CaffeineBeverage {
  @override
  void addCondiments() {
    print('добавить сахар');
  }

  @override
  void brew() {
    print('завариваем кофе');
  }
}

class Tea extends CaffeineBeverage {
  @override
  void addCondiments() {
    print('добавить лимон');
  }

  @override
  void brew() {
    print('завариваем чай');
  }
}
