void main() {
  WildTurkey wildTurkey = WildTurkey();
  Duck turkeyAdapter = TurkeyAdapter(wildTurkey);
  turkeyAdapter.fly();
  turkeyAdapter.quack();
}

abstract class Duck {
  void quack();
  void fly();
}

abstract class Turkey {
  void gobble();
  void fly();
}

class MallardDuck implements Duck {
  @override
  void fly() {
    print('fly');
  }

  @override
  void quack() {
    print('quack');
  }
}

class WildTurkey implements Turkey {
  @override
  void fly() {
    print('short fly');
  }

  @override
  void gobble() {
    print('gobble');
  }
  
}

class TurkeyAdapter implements Duck {
  Turkey turkey;

  TurkeyAdapter(this.turkey);

  @override
  void fly() {
    turkey.fly();
  }

  @override
  void quack() {
    turkey.gobble();
  }
  
}
