# Dart-Study
### Dart 시작하기 (for Flutter App Develop)
----

## 0. Introduction
### dart 특징

> JIT(just in time compile) vs AOT(ahead of time) compile
- 앱을 배포할 때 빨리 컴파일 확인해야 하므로 AOT가 되어야 함.
> null safety
- 프로그램 안전하게 해줌.

### flutter가 dart를 택한 이유
1. dart는 JIT와 AOT 2개 다 존재.
    1. 바로 결과 확인 가능.
2. 구글이 만들었음.
    1. react는 js 수정이 불가능.
    2. dart는 언어 수정해서 flutter를 빠르게 만들 수 있음.
---

## 1. Variables

### 1.1 var keyword
- var
  - 변수 자동 형식 지정
  - 변경 가능한 변수 선언

```dart echo
void main() {
  var name = 'kazu'; //자동 형식 지정
  name = 'kazu'; //변경 가능
}
```

### 1.2 Dynamic Type
- 정말 필요할 때만 사용할 것
> 데이터 타입 정하는 예시

```dart echo
if (name is String) {
    //name이 String인 것을 알기 때문에 string과 관련된 많은 함수 사용 가능
    name.isEmpty;
    name.toLowerCase();
  }
```

### 1.3 Nullable Variables
- 개발자가 null 값-런타임 에러를 참조할 수 있도록 해줌.

> null 처리 방법1

```dart echo
void main(){
    String? str = 'kazu';    //(데이터 타입)? : 데이터 타입일수도 null일수도 있음을 dart가 알아볼 수 있도록 함.
    str = null;

    if (str != null) {        //str이 null이 아니면 str.isNotEmpty
    str.isNotEmpty;
  }
  //다음 문장 실행
}
```

> null 처리 방법 2

```dart echo
void main(){
    String? str = 'kazu';    //(데이터 타입)? : 데이터 타입일수도 null일수도 있음을 dart가 알아볼 수 있도록 함.
    str = null;
    str?.isNotEmpty;         //변수?.isNotEmpty : 변수가 null이 아니면 str.isNotEmpty
  //다음 문장 실행
}
```

### 1.4 Final Variables
- 정적 변수와 같은 기능
- 런타임 중 만들어질 수 있는 변수.
  - ex)사용자가 앱을 실행하면서 변수 정의 가능
- var 대신 final을 사용하변 값 변경 불가능.

> 예시
```dart echo
void main() {
  final name = 'kazu'; //var 대신 final을 사용하면 값 변경 불가능.
}
```

### 1.5 Late Variables
- 초기 데이터 값 없이 변수 선언가능.
- 값을 넣기 전까지는 print 해도 결과 나오지 않음.
- api에서 값 가져온 후, late 변수에 넣어서 사용.

> 예시
```dart echo
late final String name;
// api 내용 가져오기
name = 'kazu';    //또는 name = api 관련 값
print(name);
```

### 1.6 Const Variables
- compile-time const에 알고 있는 값을 가진 변수
- javascript나 typescript의 const와는 다름.
- dart의 final과 비슷함.
- const는 코드 컴파일 전에 알고 있는 값 이어야 함.
  - ex) 앱 스토어 올리기 전에

> 예시
```dart echo
void main() {
  //const API = fetchApi(); //컴파일러는 API 변수 모름. api에서 받아와야 함.
  //api 요청한다 가정
  const max_allowed_price = 120;
  //앱에서 사용할 상수들이 있다면 const 써주면 됨
  //앱에 담긴 코드를 앱스토어에 보내기 전에 사용됨.
}
```

----
## 2. Data Types

### 2.0 Basic Data Types
- 모든 자료형들은 object로 이루어짐.

### 2.1 String Interpolation - text에 변수 추가하기
> [1] text에 String 변수 추가
```dart echo
void main() {
  var name = 'kazu';
  var greeting = "Hello everyone, my name is $name, nice to meet you";
  //$변수
  print(greeting);
}
```
> [2] text에 계산된 값 추가
```dart echo
void main() {
  var age = 10;
  var greeting = 'I\'m ${age + 2}'; //중괄호 안에 계산식.
  print(greeting);
}
```

### 2.2 List
- 순서가 있고, 데이터 중복 허용함.
- List는 [](대괄호)를 사용한다.
- List 기능 2가지
  - collection if, collection for
- Python List과 같음

> List 형태
  ```dart echo
  void main() {
  var numbers = [1, 2, 3, 4];
  List<int> numbers2 = [1, 2, 3, 4];    //같은 표현
  }
  ```

> collection if
```dart echo
  var giveMeFive = true;
  var numbers = [
    1, 2, 3, 4,
    if (giveMeFive) 5
  ]; //gibeMeFive가 true이면 List에 5추가 하도록 함.
  print(numbers);   //결과 : [1, 2, 3, 4, 5]
```

> collection for 
```dart echo
  var oldFriends = ['kazu', 'vinsen'];

  //oldFriends에 newFriends를 추가
  var newFriends = [
    'lewis', 'ralph', 'darren',
    for (var friend in oldFriends) "❤️$friend",
  ];
print(newFriends);  //결과 : [lewis, ralph, darren, ❤️kazu, ❤️vinsen]
```

### 2.3 Maps
- Key, Value 형태
  - Key는 중복 허용하지 않고, Value는 중복을 허용함.
  - Python의 Dictionary와 같음.
- Value는 어떤 자료형이든 될 수 있음.

> Maps 형태
```dart echo
void main() {
  //컴파일러가 key, value 자료형 유추함.
  var player = {
    'name': 'kazu', //key, value(anything)
    'xp': 19.99,
    'superpower': false,
  };
  print(player);
}
```

### 2.4 Sets
- 순서가 없고, 데이터 중복 허용하지 않음.
- Set은 {}(중괄호)를 사용한다.
- Python Set과 같음.

> Set 형태
```dart echo
void main() {
  var numbers = {1, 2, 3, 4};
  Set<int> numbers2 = {1, 2, 3, 4};

  numbers.add(1);
  numbers.add(1);
  numbers.add(1);   //Set은 같은 요소들 추가해도 고유한 요소 1개만 나타냄.
  print(numbers);   //결과 : {1, 2, 3, 4}
}
```
---

## 3. Funtions

### 3.0 Defining a Function
> 반환 값 없는 함수
```dart echo
void sayHello(String name) {
  print("Hello $name nice to meet you!");
}
```

> 반환 값 있는 함수
```dart echo
String sayHello2(String name) {
  return "Hello $name nice to meet you!";
}
```

> => (fat arrow syntax) : 바로 값 리턴. 함수가 한 줄일 때 사용.
```dart echo
num plus(num a, num b) => a + b;
```

### 3.1 Name Parameters
> 일반적인 Parameters 가진 Function
```dart echo
String Hello1(
  String name,
  String country,
  int age,
) {
  return "Hello $name, you are $age, and you come from $country";
}
```

> Parameter에 default value 지정한 Fuction
- {} 중괄호 안에 써주기
```dart echo
String Hello2({
  String name = 'anon',
  String country = 'uk',
  int age = 99,
}) {
  return "Hello $name, you are $age, and you come from $country";
}
```

> required modifier
- 사용자에게 입력 받아서 넣을 경우 사용.
- 로그인 같은 경우, default value를 지정할 수 없으므로 required modifier 사용.
```dart echo
String Hello3({
  required String name,
  required String country,
  required int age,
}) {
  return "Hello $name, you are $age, and you come from $country";
}
//main 함수a
void main() {
  Hello1('kazu', 'korea', 12);
  Hello2(country: 'us', age: 14, name: 'dart');
  Hello2();
  Hello3(country: 'korea', name: 'kazu', age: 12);
}
```
### 3.2 Optional Positional Parmeters
- Parameter 중 원하는 Parameter에만 default value 지정
- 형태 : [dataType? variable = 'default value']
> country만 Not required
```dart echo
String Hello2(
  String name,
  int age, [
  String? country = 'korea',         //country는 값이 있을 수도 없을 수도 있음.
]) =>
    "Hello $name, you are $age years old from $country";
```

### 3.3 QQ Operator(null aware operator)

> [1] ??(QQ operator)
- left ?? right
left가 null 이면 right return
left가 null 아니면 left return

```dart echo
//방법1 - 기본 형태
String capitalizeName1(String? name) {
  //String? : name은 null일수도 아닐수도
  if (name != null) return name.toUpperCase();
  return 'ANON';
}

//방법2 - ?(null-check operator)
String capitalizeName2(String? name) =>
    name != null ? name.toUpperCase() : 'ANON';
//name이 null이 아니면 name을 대문자로, null이면 name을 ANON로

//방법3 - ??(QQ operator) 사용. 가장 짧게 표현.
String capitalizeName3(String? name) => name?.toUpperCase() ?? 'ANON';
```

> [2] ?=(QQ equals)
```dart echo
  String? name;
  name ??= 'azureun';   //name이 null이면 azureun 할당
  //name ??= 'another'; //이 코드부턴 null 될 일 없으므로 에러
  //name = null;        //이 코드 이후부터 ??= 다시 사용 가능.
```

### 3.4 Typedef
- 자료형에 alias(타입 별칭)를 붙일 수 있게 해줌.
```dart echo
typedef ListOfInts = List<int>;    //ListOfInts는 List<int> 대신 사용 가능.
```

> Map의 typedef
```dart echo
typedef UserInfo = Map<String, String>;

String sayHi(Map<String, String> userInfo){
    return "Hi ${userInfo['kazu']}";
}
void main(){
    print(sayHi({"name" : "azureun"}));
}
```

---
## 4. Classes

### 4.0 Dart Class

> Class 구조
```dart echo
class Person {        //class 클래스 이름
    String name,      //필드 (멤버)
    int age;          //메소드 (함수)
}
```

> Property(속성)
- 객체의 특성 나타냄.
- 데이터 은닉 & 캡슐화 제공
- 변수 혹은 getter, setter를 통한 메소드 접근.

> class 접근
```dart echo
class Player {
    String name = 'kazu';
    final String name2 = 'cocoa';
    int xp = 1500;

    void sayHello(){
        print("Hi my name is $name);
    }
}

void main(){
    var player = Player();
    player.name = 'azureun';
    print(playe.name);
    player.sayHello();
```

### 4.1 Constructors (생성자)
- 클래스와 새 인스턴스를 생성 및 초기화
- 생성자 이름은 클래스의 이름과 같다.

> 생성자 예시1
```dart echo
Player(this.name, this.xp);    //입력 받는 순서대로 지정
```
> 생성자 예시2 (자바 생성자 초기와 비슷)
```dart echo
Player(String name, int xp){
    this.name = name;
    this.xp = xp;
}
```

### 4.2 Named Counstructor Parameters

> 생성자 Parameter들 required 형태로 관리
```dart echo
class Player {
  final String name;
  int xp;
  String team;
  int age;

  //1. 생성자의 Parameter들 중괄호로 감싸고
  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
}

void main(){
  //너무 많은 positional arguments가 이웃하면 혼란스러워짐.
  //아래와 같이 어떤 arguments인지 알 수 있도록 만들기

  //2. 각각 name Parameter 적어주기
  var player2 = Player(
  name: "azureun",
  xp: 2500,
  team: 'blue',
  age: 12,
);
}
```

### 4.3 Named Constructors
- Named Constructor는 여러 생성자를 가질 수 있고, 각 생성자에 의미 있는 이름 부여.
    -> 동일한 클래스에 대해 여러 방식으로 객체 초기화
- 형태 : ClassName().constructorName()

```dart echo
Player.createBluePlayer({required String name, required int age})
  : this.age = age,
    this.name = name,
    this.team = 'blue',
    this.xp = 0;
```

> named vs positional
- name : 기본적으로 required 속성 없음. 명시적 형태
- positional : 기본적으로 모든 positional parameter는 required. parameter 없으면 작동하지 않음.

```dart echo
void main() {
  //named 형식
  var player = Player.createBluePlayer(
    name: "kazu",
    age: 12,
  );
  //positional 형식
  var redPlayer = Player.createRedPlayer("kazu", 12);
}
```
### 4.4 fromJson named Constructor
- JSON 데이터로부터 객체 생성 시 사용되는 특별한 생성자
- API 응답 등 JSON 데이터를 객체로 변환할 때 사용.

> Player 생성자와 다른 이름인 Player.fromJson
```dart echo
Player.fromJason(Map<String, dynamic> playerJson)
  //class 내부 name을 playerJson Map에서 key가 name인 값 가져와서 대입
  : name = playerJson['name'],
    xp = playerJson['xp'],
    team = playerJson['team'];
```

### 4.5 Cascade Notation(..)
- Object의 메소드 호출하거나 속성 설정할 때 사용.

> 인스턴스 초기화 3가지 형태 예시
```dart echo
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
```
### 4.6 Enums
- enum은 코드 작성 시, 실수하지 않도록 도와주는 타입
- enum type에 생성된 값들 중에서만 값이 할당되므로 선택의 폭을 좁힘.

> enum 예시
```dart echo
enum Team { red, blue } //새로운 타입 정의
enum XPLevel { beginner, medium, pro }

//class Player..

void main() {
  var kazu = Player(
    name: 'kazu',
    xp: XPLevel.medium,    //선택지 3가지만 고를 수 있음.
    team: Team.red,        //선택지 2가지만 고를 수 있음.
  )..sayHello(); //출력 결과 : Hi my name is kazu medium red
}
```
### 4.7 Abstract Classes
- 추상 클래스는 다른 클래스들이 구현해야하는 메소드들을 모아 놓은 설계도 클래스
- 메소드 이름은 같지만 다르게 작동.

> 추상 클래스 예시
```dart echo
abstract class Human {
  void walk();
}

//enum Team ..
//enum XPLevel ..
Class Player extends Human {    //추상 클래스 Human을 상속 받음
    //Player 생성자
    void walk(){
        print("I'm walk');
    }
}
class Coach extends Human {    //추상 클래스 Human을 상속 받음
    void walk(){                //Player에도 walk() 메소드가 있지만 다르게 작동함.
        print("The coach is walking.");
    }
}
```
### 4.8 Inheritance (상속)
- extends
  - 자식 클래스는 부모 클래스의 매소드와 속성을 상속 받음.
  - 단일 클래스만 상속 받을 수 있음.
  - supper 키워드로 부모 클래스의 생성자를 호출할 수 있다.

> 상속 예시
```dart echo
// enum ..
class Human{
    String name;
    Human({required this.name});
}
class Player extends Human {
    final Team team;
    Player({
        required this.team,
        required String name,    //String name도 필수 요소를 받겠다고 적어야 함. Human에 name 넘겨 주기 위함.
    }) : super(name : name);    //첫번째 name : Human의 name, 두번째 name : Player의 name
    @override
    void sayHello() {
    super.sayHello(); //Human class의 sayHello먼저 출력
    print('and I play for ${team}');
    }
}
```
### 4.9 Mixins
- 생성자가 없는 클래스
- 클래스 속성 추가 시 사용함.
- 여러 클래스에 재사용 가능함.

> Mixin 예시
```dart echo
mixin Strong {
  final double strengthLevel = 1500.99;
}
mixin QuickRunner {
  void runQuick() {
    print("runnnnnnn!");
  }
}

class Player with Strong, QuickRunner {
  //with 사용. Strong, Quick 클래스에 있는 프로퍼티 & 메소드를 Player에 넣기
  final Team team;

  Player({
    required this.team,
    required String name,
  });
  void say() {
    print('${team.name} team Fighting!');
  }
}
class Horse with Strong, QuickRunner {} //다른 클래스도 Mixin 클래스 가져오기 가능.
class Kid with QuickRunner {}

void main() {
  var player = Player(
    team: Team.red,
    name: 'kazu',
  )..say();
  player.runQuick();
}
```
---
