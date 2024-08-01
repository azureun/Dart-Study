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
<code>void main() {
  var name = 'kazu'; //자동 형식 지정
  name = 'kazu'; //변경 가능
}</code>

### 1.2 Dynamic Type
- 정말 필요할 때만 사용할 것
> 데이터 타입 정하는 예시
<code>if (name is String) {
    //name이 String인 것을 알기 때문에 string과 관련된 많은 함수 사용 가능
    name.isEmpty;
    name.toLowerCase();
  }</code>

### 1.3 Nullable Variables
- 개발자가 null 값-런타임 에러를 참조할 수 있도록 해줌.

> null 처리하는 방법1
<code>void main(){
    
}</code>


## 2. Data Types

## 3. Funtions

## 4. Classes
