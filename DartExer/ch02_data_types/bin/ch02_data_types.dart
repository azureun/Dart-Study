// #2 Data Types

//2.0 Basic Data Types
//모든 자료형들은 object로 이루어져 있음. & 모두 object를 상속 받고 있다.

/*
void main() {
  String name = 'kazu';
  bool alive = true;
  int age = 12;         //num 클래스 상속 받음
  double money = 69.99; //num 클래스 상속 받음
  num x = 12;
  x = 1.1;      //num은 int,double의 부모 class이므로 정수형이나 상수형일 수 있음
}
*/

//====================

//2.1 String Interpolation - text에 변수 추가하기

//[1] text에 String 변수 추가
/*
void main() {
  var name = 'kazu';
  var greeting = "Hello everyone, my name is $name, nice to meet you";
  //$변수

  print(greeting);
}*/

//[2] text에 계산된 값 추가
/*
void main() {
  var age = 10;
  var greeting = 'I\'m ${age + 2}'; //중괄호 안에 계산식 넣음.

  print(greeting);
}*/

//====================

//2.2 List
//List 기능 2가지 : collcetion if, collection for

//List는 class가 있고 EfficientLengthIterable<E>를 상속 받고 있음.
// > 변수.함수 함수 부분에서 모든 옵션을 볼 수 있음.

/*
void main() {
  var numbers = [1, 2, 3, 4]; //List<int>
  //List<int> numbers = [1,2,3,4];와 같음.
  numbers.add(1);
  numbers.first;      //리스트의 첫 번째 요소를 가져다 줌.
  numbers.last;       //리스트의 마지막 요소를 가져다 줌.
}*/

//[List 기능 1] - collection if
/*
void main() {
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ]; //gibeMeFive가 true이면 List에 5추가 하도록 함.

  //같은 표현 방법
  // if (giveMeFive) {
  //   numbers.add(5);
  // }
  print(numbers);   //결과 : [1, 2, 3, 4, 5]
}*/

//[List 기능 2] - collection for
/*
void main() {
  var oldFriends = ['kazu', 'vinsen'];

  //oldFriends에 newFriends를 추가
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "❤️$friend",
  ];

  //같은 표현
  // for (var friend in oldFriends) {
  //   newFriends.add("❤️$friend");
  // }

  print(newFriends);  //결과 : [lewis, ralph, darren, ❤️kazu, ❤️vinsen]
}*/

//====================

//2.3 Maps
//python의 dictionary와 비슷함.
//player나 movie처럼 API 구조 데이터라면 class 사용.

//Maps 형태
/*
void main() {
  //player의 자료형 : Map<String, Object>
  //Object는 어떤 자료형이든 될 수 있다.
  //Typescript의 경우, object는 any로 보면 됨.

  var player = {
    'name': 'kazu', //key, value(anything)
    'xp': 19.99,
    'superpower': false,
  };

  //컴파일러가 key, value 자료형 유추함.
  Map<int, bool> player2 = {
    1: true,
    2: false,
    3: true,
  };

  print(player);
  print(player2);
}
*/

//복잡한 Map 예시1
/*
void main(){
  Map<List<int>, bool> player={
    [1,2,3,5]:true,     //어떤 key든 value든 명시해 줄 수 있음
  };
  
  //Map도 method와 property를 가지고 있음.
  //ex) player.update 등등
}*/

//복잡한 Map 예시2
/*
void main() {
  List<Map<String, Object>> players = [
    {'name': 'kazu', 'xp': 1999},
    {'name': 'kazu2', 'xp': 19999.999},
  ];
}
*/

//====================

//2.4 Sets

//Set 형태
/*
void main() {
  var numbers = {1, 2, 3, 4};
  Set<int> numbers2 = {1, 2, 3, 4};

  numbers.add(1);
  numbers.add(1);
  numbers.add(1);   //Set은 같은 요소들 추가해도 고유한 요소 1개만 나타냄.
  print(numbers);   //결과 : {1, 2, 3, 4}
}
*/

//Dart Set -> JS Set Dart Set -> Python Set
//Dart List -> JS Array Dart List -> Python List