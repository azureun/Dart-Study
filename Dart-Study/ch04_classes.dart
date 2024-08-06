// #4 CLASSES

//4.0 Dart Class
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
/*
class Player {
  final String name;
  int xp; //late : 변수 선언은 했지만 값은 나중에 받아옴.

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
}*/

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

  //named vs positional
  // name - 기본적으로 required 속성 없음. 명시적임.
  // positional - 기본적으로 모든 positional parameter는 required임. parameter 없으면 작동 x

  player.sayHello();
}
*/

//====================

//4.4 Recap - flutter에서 많이 사용되는 fromJason named constructor

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

//4.5 Cascade Notation

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
  //[syntax sugar]

  // 원래 문장

  // var kazu = Player(name: 'kazu', xp: 1200, team: 'red');
  // kazu.name = 'azureun';
  // kazu.xp = 1200000;
  // kazu.team = 'blue';

  // syntax sugar된 문장 (kazu 변수 세미콜론 주의!)
  // var kazu = Player(name: 'kazu', xp: 1200, team: 'red')
  //   ..name = 'azureun'
  //   ..xp = 1200000
  //   ..team = 'blue';  // .. 2개의 점 모두 kazu를 가리킴

  // 또 다른 표현
  var kazu = Player(name: 'kazu', xp: 1200, team: 'red');
  var blueberry = kazu
    ..name = 'azureun'
    ..xp = 1200000
    ..team = 'blue'
    ..sayHello();
}
*/

//====================
