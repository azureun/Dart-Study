// #4 CLASSES

//4.0 Dart Class

//Property(속성)
//- 객체의 특성을 나타냄.
//- 데이터 은닉 & 캡슐화 제공
//- 변수 혹은 getter, setter를 통한 메소드 접근.

/*
class Player {
  //Class에서 property 선언 시, 꼭 타입 사용해서 정의.
  String name = 'kazu';
  final String name2 = 'cocoa'; //final variable, property는 수정 불가.
  int xp = 1500;

  void sayHello() {
    print("Hi my name is $name");
    //this.name 가능하지만, Class method 내에선 this는 사용하지 않는 것이 권고함.
  }
}

void main() {
  //Player instance 생성
  var player = Player(); //new Player()도 가능하지만 궂이 쓰진 않음.

  print(player.name);
  player.name = 'azureun';
  print(player.name); //바뀐 name인 azureun으로 출력됨.

  player.sayHello();
}
*/

//====================

//4.1 Constructors

// 클래스의 새 인스턴스를 생성, 초기화

/*
class Player {
  final String name;
  late int xp; //late : 변수 선언은 했지만 값은 나중에 받아옴.

  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  //바뀐 Player 생성자
  Player(this.name, this.xp);   //입력받는 순서대로 지정.

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("kazu", 1500);
  player.sayHello();
  var player2 = Player("cocoa", 2500);
  player2.sayHello();
}
*/

//====================

//4.2 Named Constructor Parameters
/*
class Player {
  final String name;
  int xp;
  String team;
  int age;

  //1. 생성자의 Parameter들 중괄호로 감싸고
  Player({    //방법1. default value or 방법2. required 적기
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  //너무 많은 positional arguments가 이웃하면 혼란스러워짐.
  //아래와 같이 어떤 arguments인지 알 수 있도록 만들기

  //2. 각각 name Parameter 적어주기
  var player = Player(
    name: "kazu",
    xp: 1500,
    team: 'blue',
    age: 12,
  );

  var player2 = Player(
    name: "azureun",
    xp: 2500,
    team: 'blue',
    age: 12,
  );
  player2.sayHello();
}
*/

//====================

//4.3 Named Constructors

// Named Constructor : 클래스는 여러 생성자를 가질 수 있고, 각 생성자에 의미 있는 이름 부여 가능.
// 동일한 클래스에 대해 여러 방식으로 객체 초기화
// 생성자의 목적 명확히 표현
// 형태 : ClassName.construcotrName()

// named vs positional
// name - 기본적으로 required 속성 없음. 명시적임.
// positional - 기본적으로 모든 positional parameter는 required임. parameter 없으면 작동 x

/*
class Player {
  final String name, team;
  int xp, age;

  //default constructor
  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  //Player 초기화하는 함수 >> : (콜론 써주기)
  //사용자로부터 입력받은 name, age를 변경.
  Player.createBluePlayer({required String name, required int age})
      : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0;

  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 0;

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  //named 형식
  var player = Player.createBluePlayer(
    name: "kazu",
    age: 12,
  );

  //더이상 named syntax 사용하지 않고 Positional Syntax를 사용하기 때문에 에러.
  // // var redPlayer = Player.createRedPlayer(
  // //   name: "kazu",
  // //   age: 12,
  // // );

  //positional 형식
  var redPlayer = Player.createRedPlayer("kazu", 12);

  player.sayHello();
}
*/

//====================

//4.4 Recap - fromJson named constructor

//JSON 데이터로부터 객체 생성하는 데 사용되는 특별한 생성자.
//dart, flutter에서 많이 사용되는 패턴
//API 응답 등 JSON 데이터를 객체로 변환할 때 사용.

/*
class Player {
  final String name;
  int xp;
  String team;

  //생성자는 클래스와 다른 이름인 Player.fromJson
  Player.fromJason(Map<String, dynamic> playerJson)
      //class 내부 name을 playerJson Map에서 key가 name인 값 가져와서 대입
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {
      "name": "kazu",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "azureun",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "cocoa",
      "team": "red",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    //JSON으로부터 새로운 Player 생성
    var player = Player.fromJason(playerJson);
    player.sayHello();
  });
}
*/

//====================

//4.5 Cascade Notation(..)

//Cascade Notation(..) : Object의 메서드 호출하거나 속성 설정할 때 사용

/*
class Player {
  String name, team;
  int xp;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  // 원래 문장
  var kazu1 = Player(name: 'kazu1', xp: 1200, team: 'red1');
  kazu1.name = 'azureun1';
  kazu1.xp = 1200000;
  kazu1.team = 'blue1';

  // Cascade Notation1 - syntax sugar된 문장 (kazu 변수 세미콜론 주의!)
  var kazu2 = Player(name: 'kazu2', xp: 1200, team: 'red2')
    ..name = 'azureun2'
    ..xp = 1200000
    ..team = 'blue2';  // .. 2개의 점 모두 kazu2를 가리킴

  // Cascade Notation2 
  var kazu3 = Player(name: 'kazu3', xp: 1200, team: 'red3');
  var blueberry = kazu3
    ..name = 'azureun3'
    ..xp = 1200000
    ..team = 'blue3'
    ..sayHello();
}
*/

//====================

//4.6 Enums

//enum은 코드 작성 시, 실수하지 않도록 도와주는 타입.
//enum type에 생성된 값들 중에서만 값이 할당되므로 선택의 폭을 좁혀줌.

/*
enum Team { red, blue } //새로운 타입 정의
enum XPLevel { beginner, medium, pro }

class Player {
  String name;
  XPLevel xp;
  Team team; //String이 아니라 enum인 Team이 DataType
  //team 종류가 2개의 옵션만 있음. (red, blue) > 오타 실수 줄어듬.

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print('Hi my name is $name ${xp.name} ${team.name}');
  }
}

void main() {
  var kazu = Player(
    name: 'kazu',
    xp: XPLevel.medium,
    team: Team.red,
  )..sayHello(); //출력 결과 : Hi my name is kazu medium red

  var blueberry = kazu
    ..name = 'azureun'
    ..xp = XPLevel.pro
    ..team = Team.blue
    ..sayHello(); //출력 결과 : Hi my name is azureun pro blue
}
*/

//====================

//4.7 Abstract Classes

//추상 클래스는 다른 클래스들이 직접 구현해야하는 메소드들을 모아 놓은 청사진 클래스
//공통된 필드(변수)와 메소드

/*
abstract class Human {
  void walk();
}

enum Team { blue, red }

enum XPLevel { beginner, medium, pro }

//Human 추상 클래스를 상속받는 모든 클래스는 walk() 메소드를 정의해야 함.
class Player extends Human {
  String name;
  XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void walk() {
    //Player class에 walk 메소드를 만들어줌.
    print('i\'m walk');
  }

  void sayHello() {
    print('Hi my name is $name ${xp.name} ${team.name}');
  }
}

class Coach extends Human {
  void walk() {
    //Coach class의 walk 메소드는 다르게 작동.
    print('The coach is walking.');
  }
}

void main() {
  var player = Player(
    name: 'kazu',
    xp: XPLevel.pro,
    team: Team.blue,
  )..sayHello();

  var coach = Coach();
  player.walk();
  coach.walk();
}
*/

//====================

//4.8 Inheritance

// 상속하고 super를 이용해 부모 클래스의 생성자를 호출할 수 있다.
//super클래스 : extends 한 부모 클래스와 상호작용할 수 있도록 함.

/*
enum Team { red, blue }

class Human {
  String name;
  Human({required this.name}); //Player 생성자 함수에 있는 name을 여기 Human으로 전달함.
  //Human 내에서도 생성자 함수 호출해야 함. Human의 name도 설정해야하기 때문

  void sayHello() {
    print("Hi my name is $name");
  }
}

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name, //String name도 필수 요소를 받겠다고 적어줘야 함. 이걸 Human에 전달해줌.
  }) : super(name: name); //첫번째 name은 Human의 name, 두번째 name은 Player의 name

  //super(name);을 전달하면 Human(this.name); 기본 클래스를 함께 호출함.

  @override
  void sayHello() {
    super.sayHello(); //Human class의 sayHello먼저 출력
    print('and I play for ${team}');
  }
}

void main() {
  var player = Player(
    team: Team.red,
    name: 'kazu',
  );
}
*/

//====================

//4.9 Mixins

//Mixin : **생성자가 없는 클래스**. / 생성자가 없으면 Mixin 클래스가 됨
//클래스 속성(property) 추가할 때 사용.
//여러 클래스에 재사용이 가능함.

//<extends와 Mixin차이>
//extends : 확장한 해당 클래스는 부모 클래스가 되고, 자식 클래스는 부모 클래스를 super로 접근한다.(==부모 클래스의 인스턴스가 됨)
//Mixin : with 키워드로 단순히 Mixin 내부 프로퍼티, 메소드들 가져오기만 함.

/*
mixin Strong {
  final double strengthLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print("runnnnnnn!");
  }
}

mixin Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  //with 사용. Strong, Quick, Tall 클래스에 있는 프로퍼티 & 메소드를 Player에 넣기
  final Team team;

  Player({
    required this.team,
    required String name,
  });

  void say() {
    print('${team.name} team Fighting!');
  }
}

class Horse with Strong, QuickRunner {} //다른 곳에서도 Mixin 클래스 가져오기 가능.

class Kid with QuickRunner {}

void main() {
  var player = Player(
    team: Team.red,
    name: 'kazu',
  )..say();

  player.runQuick();
  
}
*/

//====================
