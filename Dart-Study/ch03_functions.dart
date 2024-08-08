// #3 FUNCTIONS

//3.0 Defining a Function

/*
//반환값 없는 함수
void sayHello(String name) {
  print("Hello $name nice to meet you!");
}

//반환값 String
String sayHello2(String name) {
  return "Hello $name nice to meet you!";
}

//fat arrow syntax(=>)는 바로 return 하는 것과 같은 의미
// 함수가 한 줄일 때 사용.
String sayHello3(String name) => "Hello $name nice to meet you!";
num plus(num a, num b) => a + b;

void main() {
  print(sayHello2('kazu'));
  print(sayHello3('cocoa'));
}
*/

//====================

//3.1 Name Parameters
/*
String sayHello(String name, int age, String country) {
  return "Hello $name, you are $age, and you come from $country";
}

//Named Argument - null safety에 걸리지 않도록 Default values 지정.
//Parameter에 {}를 붙여줌.
String sayHello2(
    {String name = 'anon', int age = 99, String country = 'wakanda'}) {
  return "Hello $name, you are $age, and you come from $country";
}

//required modifier - 사용자에게 입력 받은 값 들어감
String sayHello3(
    {required String name, required int age, required String country}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  //요소들 순서 읽었을 때 요소들의 의미 알 수 없기 때문에 좋은 방법은 아님
  // > Named Argument 사용!
  print(sayHello('kazu', 11, 'korea'));

  //Named Argument : "순서 관계없이" argument의 이름들만 적으면 됨.
  print(sayHello2(age: 12, country: 'uk', name: 'cocoa'));

  //null safety없이 Default values 넣어서 출력됨.
  print(sayHello2());

  //required modifier
  //사용자들에게 입력 받아서 넣을 경우에도 사용.
  //ex) 로그인 값은 경우 default value를 줄 수 없으므로 required modifier 사용.
  sayHello3(age: 12, country: 'poland', name: 'kike');
}
*/

//====================

//3.2 Recap
/*
String Hello1(
  String name,
  String country,
  int age,
) {
  return "Hello $name, you are $age, and you come from $country";
}

String Hello2({
  String name = 'anon',
  String country = 'uk',
  int age = 99,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

String Hello3({
  required String name,
  required String country,
  required int age,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  Hello1('kazu', 'korea', 12);
  Hello2(country: 'us', age: 14, name: 'dart');
  Hello2();
  Hello3(country: 'korea', name: 'kazu', age: 12);
}
*/

//====================

//3.3 Optional Positional Parameters

//실제론 주로 named Argument 사용함.
/*
//Parameters 모두 required임.
String Hello(
  String name,
  int age,
  String country,
) =>
    "Hello $name, you are $age years old from $country";

//country만 Not required
//형태 : [dataType? variable = 'default value']
String Hello2(
  String name,
  int age, [
  String? country = 'korea', //country는 값이 있을 수도 없을 수도 있음.
]) =>
    "Hello $name, you are $age years old from $country";

void main() {
  Hello('kazu', 12, 'korea');

  //country만 Not required
  var result = Hello2('kazu', 12);
  print(result);
}
*/

//====================


//3.4 QQ Operator(null aware operator)
/*
// [1] ?? QQ operator
// [2] ?= QQ equlas(QQ assignment)

// [1] ?? QQ operator

//방법1 - 기본 형태
String capitalizeName1(String? name) {
  //String? : name은 null일수도 아닐수도
  if (name != null) return name.toUpperCase();
  return 'ANON';
}

//방법2 - ?(null-check operator) 사용
String capitalizeName2(String? name) =>
    name != null ? name.toUpperCase() : 'ANON';
//name이 null이 아니면 name을 대문자로, null이면 name을 ANON로

//방법3 - ??(QQ operator) 사용. 가장 짧게 표현.

## left ?? right ##
left가 null 이면 right return
left가 null 아니면 left return
String capitalizeName3(String? name) => name?.toUpperCase() ?? 'ANON';
//name 자체가 null인 경우엔 toUpperCase 호출 불가능하므로 name? 해줌.

void main() {
  capitalizeName1('kazu');
  capitalizeName2(null);
  capitalizeName3(null);

  // [2] QQ equals(QQ assignment)
  String? name;
  name ??= 'azureun';   //name이 null이면 azureun 할당
  //name ??= 'another'; //이 코드부턴 null 될일 없으므로 에러
  //name = null;        //이 코드 이후부터 ??= 다시 사용 가능.

  print(name);
}
*/

//====================

//3.5 Typedef

//typedef는 자료형에 alias(타입 별칭)를 붙일 수 있게 해줌.

//개념
/*
typedef ListOfInts = List<int>;

//List를 반대로 뒤집어서 return하는 function
List<int> reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed; //List를 reversed하면 Iterable 반환함.
  return reversed
      .toList(); //List랑 다른 iterable(순차적 접근)이 돼서 다시 List 변환해야 하므로 toList()사용.
}

// ListOfInts는 List<int>와 같은 자료형임.
ListOfInts reverseListOfNumbers2(List<int> list) {
  var reversed = list.reversed; //List를 reversed하면 Iterable 반환함.
  return reversed
      .toList(); //List랑 다른 iterable(순차적 접근)이 돼서 다시 List 변환해야 하므로 toList()사용.
}

void main() {
  print(reverseListOfNumbers([1, 2, 3]));
}
*/

//Map의 typedef
/*
typedef UserInfo = Map<String, String>;

String sayHi(Map<String, String> userInfo) {
  return "Hi ${userInfo['kazu']}";
}

void main() {
  print(sayHi({"name": "azureun"}));
}
*/