void main() {
  Beverage beverage = Americano();
  print('${beverage.getDescription()} ${beverage.cost()}\$');
  beverage = Mocha(beverage);
  beverage = Soy(beverage);
  beverage = Whip(beverage);
  print('${beverage.getDescription()} ${beverage.cost()}\$');
}

abstract class Beverage {
  String description = '';
  String getDescription() {
    return description;
  }

  double cost();
}

abstract class CondimentDecorator extends Beverage {
  String getDescription();
}

class Espresso extends Beverage {
  Espresso() {
    description = 'Espresso';
  }
  @override
  double cost() {
    return 1.99;
  }
}

class Americano extends Beverage {
  Americano() {
    description = 'Americano';
  }
  @override
  double cost() {
    return 0.99;
  }
}

class Mocha extends CondimentDecorator {
  final Beverage _beverage;
  Mocha(this._beverage);
  String getDescription() {
    return '${_beverage.getDescription()}, Mocha';
  }

  @override
  double cost() {
    return 0.20 + _beverage.cost();
  }
}

class Soy extends CondimentDecorator {
  final Beverage _beverage;
  Soy(this._beverage);
  String getDescription() {
    return '${_beverage.getDescription()}, Soy';
  }

  @override
  double cost() {
    return 0.50 + _beverage.cost();
  }
}

class Whip extends CondimentDecorator {
  final Beverage _beverage;
  Whip(this._beverage);
  String getDescription() {
    return '${_beverage.getDescription()}, Whip';
  }

  @override
  double cost() {
    return 0.30 + _beverage.cost();
  }
}
