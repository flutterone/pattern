main(List<String> arguments) {
  Character king = King();
  king.setWeapon(SwordBehavior());
  king.fight();

  Character trol = Trol();
  trol.setWeapon(KnifeBehavior());
  trol.fight();
}

class King extends Character {}

class Trol extends Character {}

abstract class Character {
  WeaponBehavior weapon;
  void fight() {
    weapon.useWeapons();
  }

  void setWeapon(WeaponBehavior wb) {
    weapon = wb;
  }
}

abstract class WeaponBehavior {
  void useWeapons();
}

class KnifeBehavior implements WeaponBehavior {
  @override
  void useWeapons() {
    print('реализация удара ножом');
  }
}

class BowAndArrowBehavior implements WeaponBehavior {
  @override
  void useWeapons() {
    print('реализация выстрела из лука');
  }
}

class SwordBehavior implements WeaponBehavior {
  @override
  void useWeapons() {
    print('реализация удара мечем');
  }
}
