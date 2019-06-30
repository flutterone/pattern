void main() {
  PizzaStore pizzaStore = NYPizzaStore();
  Pizza myPizza = pizzaStore.orderPizza(TypePizza.Cheese);
  print(myPizza.name);
  print(myPizza.toppings);

}

enum TypePizza { Cheese, Greek, Pepperoni }

abstract class PizzaStore {
  Pizza orderPizza(TypePizza type) {
    Pizza pizza;
    pizza = createPizza(type);
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }

  Pizza createPizza(TypePizza type);
}

class NYPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(TypePizza type) {
    Pizza pizza;
    if (type == TypePizza.Cheese) {
      pizza = NYCheesePizza();
    } else if (type == TypePizza.Greek) {
      pizza = NYGreekPizza();
    } else if (type == TypePizza.Pepperoni) {
      pizza = NYPepperoniPizza();
    }
    return pizza;
  }
}

class ChicagoPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(TypePizza type) {
    Pizza pizza;
    if (type == TypePizza.Cheese) {
      pizza = ChicagoCheesePizza();
    } else if (type == TypePizza.Greek) {
      pizza = ChicagoGreekPizza();
    } else if (type == TypePizza.Pepperoni) {
      pizza = ChicagoPepperoniPizza();
    }
    return pizza;
  }
}

class SimplePizzaFactoty {
  Pizza createPizza(TypePizza type) {
    Pizza pizza;
    if (type == TypePizza.Cheese) {
      pizza = CheesePizza();
    } else if (type == TypePizza.Greek) {
      pizza = GreekPizza();
    } else if (type == TypePizza.Pepperoni) {
      pizza = PepperoniPizza();
    }
    return pizza;
  }
}

abstract class Pizza {
  String name;
  String sauce;
  List<String> toppings = [];

  void prepare() {
    print('подготовка приготовления пиццы $name');
  }

  void bake() {
    print('приготовление пиццы $name');
  }

  void cut() {
    print('нарезка пиццы $name');
  }

  void box() {
    print('упаковка пиццы $name');
  }
}

class CheesePizza extends Pizza {
  CheesePizza() {
    this.name = 'Cheese';
  }
}

class GreekPizza extends Pizza {
  GreekPizza() {
    this.name = 'GreekPizza';
  }
}

class PepperoniPizza extends Pizza {
  PepperoniPizza() {
    this.name = 'PepperoniPizza';
  }
}

class NYCheesePizza extends Pizza {
  NYCheesePizza() {
    this.name = 'NYCheesePizza';
    this.toppings.add('double cheese');
  }
}

class NYGreekPizza extends Pizza {
  NYGreekPizza() {
    this.name = 'NYGreekPizza';
  }
}

class NYPepperoniPizza extends Pizza {
  NYPepperoniPizza() {
    this.name = 'NYPepperoniPizza';
  }
}

class ChicagoCheesePizza extends Pizza {
  ChicagoCheesePizza() {
    this.name = 'ChicagoCheesePizza';
  }
}

class ChicagoGreekPizza extends Pizza {
  ChicagoGreekPizza() {
    this.name = 'ChicagoGreekPizza';
  }
}

class ChicagoPepperoniPizza extends Pizza {
  ChicagoPepperoniPizza() {
    this.name = 'ChicagoPepperoniPizza';
  }
}
