void main() {
  Beverage beverage = Americano(Size.Big);
  print('${beverage.getDescription()} ${beverage.cost().toStringAsFixed(2)}\$');
  beverage = Mocha(beverage);
  beverage = Soy(beverage);
  beverage = Whip(beverage);
  print('${beverage.getDescription()} ${beverage.cost().toStringAsFixed(2)}\$');
}

enum Size { Litle, Average, Big }

abstract class Beverage {
  Size size;
  String description = '';
  String getDescription() {
    return description;
  }

  void setSize(Size size) {
    this.size = size;
  }

  Size getSize() => size;
  double cost();
}

abstract class CondimentDecorator extends Beverage {}

class Espresso extends Beverage {
  Espresso(Size size) {
    description =
        'Espresso ${size.toString().toLowerCase().replaceAll('size.', '')}';
    setSize(size);
  }
  @override
  double cost() {
    double price;
    if (size == Size.Litle) {
      price = 1.99;
    } else if (size == Size.Average) {
      price = 2.30;
    } else if (size == Size.Big) {
      price = 2.60;
    }
    return price;
  }
}

class Americano extends Beverage {
  Americano(Size size) {
    description =
        'Americano ${size.toString().toLowerCase().replaceAll('size.', '')}';
    setSize(size);
  }
  @override
  double cost() {
    double price;
    if (size == Size.Litle) {
      price = 0.99;
    } else if (size == Size.Average) {
      price = 1.30;
    } else if (size == Size.Big) {
      price = 1.60;
    }
    return price;
  }
}

class Mocha extends CondimentDecorator {
  final Beverage beverage;
  Mocha(this.beverage) {
    setSize(beverage.size);
  }

  @override
  String getDescription() {
    return '${beverage.getDescription()}, Mocha';
  }

  @override
  double cost() {
    double price;
    if (size == Size.Litle) {
      price = 0.20;
    } else if (size == Size.Average) {
      price = 0.30;
    } else if (size == Size.Big) {
      price = 0.40;
    }
    return price + beverage.cost();
  }
}

class Soy extends CondimentDecorator {
  final Beverage beverage;
  Soy(this.beverage) {
    setSize(beverage.size);
  }
  @override
  String getDescription() {
    return '${beverage.getDescription()}, Soy';
  }

  @override
  double cost() {
    double price;
    if (size == Size.Litle) {
      price = 0.50;
    } else if (size == Size.Average) {
      price = 0.60;
    } else if (size == Size.Big) {
      price = 0.70;
    }
    return price + beverage.cost();
  }
}

class Whip extends CondimentDecorator {
  final Beverage beverage;
  Whip(this.beverage) {
    setSize(beverage.size);
  }
  @override
  String getDescription() {
    return '${beverage.getDescription()}, Whip';
  }

  @override
  double cost() {
    double price;
    if (size == Size.Litle) {
      price = 0.40;
    } else if (size == Size.Average) {
      price = 0.50;
    } else if (size == Size.Big) {
      price = 0.60;
    }
    return price + beverage.cost();
  }
}
