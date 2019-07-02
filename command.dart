void main() {
  RermoteControl rermoteControl = RermoteControl();
  Light light = Light();
  GarageDoor garageDoor = GarageDoor();
  CeilingFan ceilingFan = CeilingFan('Room');
  rermoteControl.setCommand(0, LightOnCommand(light), LightOffCommand(light));
  rermoteControl.onButtonWasPushed(0);
  rermoteControl.offButtonWasPushed(0);
  rermoteControl.setCommand(
      1, GarageDoorOpenCommand(garageDoor), GarageDoorCloseCommand(garageDoor));
  rermoteControl.onButtonWasPushed(1);
  rermoteControl.offButtonWasPushed(1);
  rermoteControl.undoButtonWasPushed();

  rermoteControl.setCommand(
      2, CeilingFanMediumCommand(ceilingFan), CeilingFanOffCommand(ceilingFan));
  rermoteControl.setCommand(
      3, CeilingFanHightCommand(ceilingFan), CeilingFanOffCommand(ceilingFan));
  rermoteControl.onButtonWasPushed(2);
  rermoteControl.offButtonWasPushed(3);
  rermoteControl.onButtonWasPushed(3);

  rermoteControl.undoButtonWasPushed();
  List<Command> macroCommands = [LightOnCommand(light), GarageDoorOpenCommand(garageDoor), CeilingFanHightCommand(ceilingFan)];
  List<Command> macroCommands2 = [LightOffCommand(light), GarageDoorCloseCommand(garageDoor), CeilingFanOffCommand(ceilingFan)];
  rermoteControl.setCommand(4, MacroCommand(macroCommands), MacroCommand(macroCommands2));
  rermoteControl.onButtonWasPushed(4);


  rermoteControl.setCommand(5, FuncAdapter(() => light.on()), FuncAdapter(() => light.off()));
  rermoteControl.onButtonWasPushed(5);
  
  
}

class RermoteControl {
  List<Command> onCommands;
  List<Command> offCommands;
 
  Command undoCommand;

  RermoteControl() {
    onCommands = List.filled(7, NoCommand());
    offCommands = List.filled(7, NoCommand());
   
    undoCommand = NoCommand();
  }

  void setCommand(int slot, Command onCommand, Command offCommand) {
    onCommands[slot] = onCommand;
    offCommands[slot] = offCommand;
  }
  

  void onButtonWasPushed(int slot) {
    onCommands[slot].execute();
    undoCommand = onCommands[slot];
  }

  void offButtonWasPushed(int slot) {
    offCommands[slot].execute();
    undoCommand = offCommands[slot];
  }

  void undoButtonWasPushed() {
    undoCommand.undo();
  }
}

abstract class Command {
  void execute();
  void undo();
}

class FuncAdapter implements Command {
  Function function;
  FuncAdapter(this.function);

  @override
  void execute() {
    function();
  }

  @override
  void undo() {
    // TODO: implement undo
  }
  
}

class NoCommand implements Command {
  @override
  void execute() {
    print('do nothing');
  }

  @override
  void undo() {
    print('do nothing');
  }
}

class MacroCommand implements Command {
  List<Command> comands;

  MacroCommand(this.comands);

  @override
  void execute() {
    for (Command command in comands) {
      command.execute();
    }
  }

  @override
  void undo() {
    for (Command command in comands) {
      command.undo();
    }
  }
}

class LightOnCommand implements Command {
  Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.on();
    print('lightON');
  }

  @override
  void undo() {
    light.off();
    print('lightOFF');
  }
}

class LightOffCommand implements Command {
  Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.off();
    print('lightOFF');
  }

  @override
  void undo() {
    light.on();
    print('lightON');
  }
}

class Light {
  void on() {print('on');}
  void off() {print('off');}
}

class GarageDoorOpenCommand implements Command {
  GarageDoor garageDoor;
  GarageDoorOpenCommand(this.garageDoor);
  @override
  void execute() {
    garageDoor.open();
    print('door open');
  }

  @override
  void undo() {
    garageDoor.close();
    print('door close');
  }
}

class GarageDoorCloseCommand implements Command {
  GarageDoor garageDoor;
  GarageDoorCloseCommand(this.garageDoor);
  @override
  void execute() {
    garageDoor.close();
    print('door close');
  }

  @override
  void undo() {
    garageDoor.open();
    print('door open');
  }
}

class GarageDoor {
  void open() {}
  void close() {}
}

class CeilingFanHightCommand implements Command {
  CeilingFan ceilingFan;
  int prevSpeed;

  CeilingFanHightCommand(this.ceilingFan);

  @override
  void execute() {
    prevSpeed = ceilingFan.getSpeed();
    ceilingFan.setHight();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.hight) {
      ceilingFan.setHight();
    } else if (prevSpeed == CeilingFan.medium) {
      ceilingFan.setMedium();
    } else if (prevSpeed == CeilingFan.low) {
      ceilingFan.setLow();
    } else if (prevSpeed == CeilingFan.off) {
      ceilingFan.setOff();
    }
  }
}

class CeilingFanMediumCommand implements Command {
  CeilingFan ceilingFan;
  int prevSpeed;

  CeilingFanMediumCommand(this.ceilingFan);

  @override
  void execute() {
    prevSpeed = ceilingFan.getSpeed();
    ceilingFan.setMedium();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.hight) {
      ceilingFan.setHight();
    } else if (prevSpeed == CeilingFan.medium) {
      ceilingFan.setMedium();
    } else if (prevSpeed == CeilingFan.low) {
      ceilingFan.setLow();
    } else if (prevSpeed == CeilingFan.off) {
      ceilingFan.setOff();
    }
  }
}

class CeilingFanLowCommand implements Command {
  CeilingFan ceilingFan;
  int prevSpeed;

  CeilingFanLowCommand(this.ceilingFan);

  @override
  void execute() {
    prevSpeed = ceilingFan.getSpeed();
    ceilingFan.setLow();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.hight) {
      ceilingFan.setHight();
    } else if (prevSpeed == CeilingFan.medium) {
      ceilingFan.setMedium();
    } else if (prevSpeed == CeilingFan.low) {
      ceilingFan.setLow();
    } else if (prevSpeed == CeilingFan.off) {
      ceilingFan.setOff();
    }
  }
}

class CeilingFanOffCommand implements Command {
  CeilingFan ceilingFan;
  int prevSpeed;

  CeilingFanOffCommand(this.ceilingFan);

  @override
  void execute() {
    prevSpeed = ceilingFan.getSpeed();
    ceilingFan.setOff();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.hight) {
      ceilingFan.setHight();
    } else if (prevSpeed == CeilingFan.medium) {
      ceilingFan.setMedium();
    } else if (prevSpeed == CeilingFan.low) {
      ceilingFan.setLow();
    } else if (prevSpeed == CeilingFan.off) {
      ceilingFan.setOff();
    }
  }
}

class CeilingFan {
  static const hight = 3;
  static const medium = 2;
  static const low = 1;
  static const off = 0;

  String location;
  int speed;

  CeilingFan(this.location) {
    speed = off;
  }

  void setHight() {
    speed = hight;
    print('fan hight');
  }

  void setMedium() {
    speed = medium;
    print('fan medium');
  }

  void setLow() {
    speed = low;
    print('fan low');
  }

  void setOff() {
    speed = off;
    print('fan off');
  }

  int getSpeed() => speed;
}
