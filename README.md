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
- Key, Value 구조
- Key는 중복 허용하지 않고, Value는 중복을 허용함.

### 2.4 Sets
- 순서가 없고, 데이터 중복 허용하지 않음.
- Set은 {}(중괄호)를 사용한다.

> Set 형태
  ```dart echo
  void main() {
  var numbers = {1, 2, 3, 4};
  Set<int> numbers2 = {1, 2, 3, 4};    //같은 표현
  }
  ```


## 3. Funtions

## 4. Classes
