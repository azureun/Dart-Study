import 'package:main01/main01.dart' as main01;

//#1 VARIABLES

//1.1 var keyword
/*
void main() {
  var name = 'kazu'; //자동 형식 지정
  name = 'kazu'; //변경 가능
}
*/

//====================

//1.2 Dynamic Type

/*
void main() {
  dynamic name; //dynamic만 사용해서는 name.함수()는 많지 않음.

  if (name is String) {
    //name이 String인 것을 알기 때문에 string과 관련된 많은 함수 사용 가능
    name.isEmpty;
    name.toLowerCase();
  }
  if (name is int) {
    name.isEven;
    name.isInfinite;
  }

  //이 밖에는 name은 dynamic이기 때문에 타입 체크 필요함.
}
*/

//====================

//1.3 Nullable Variables : String? kazu = 'ka';
// 개발자가 null 값-런타임 에러를 참조할 수 있도록 해줌.

//without null safety code > null safety가 없는 버전은 에러 발생
/*
bool isEmpty(String string) => string.length == 0;
//null 보낸 뒤 string의 length라는 속성에 접근하는데 null에는 length 속성을 가지고 있지 않기 때문.
main() {
  isEmpty(null);  //null == absent
}*/

// null safety 활용
/*
void main() {
  String? kazu = 'kazu'; //String? : kazu가 string일수도(OR) null일 수도
  kazu = null;           //kazu는 string이어야 하므로 에러. String?하면 nullable 변수로 됨.

  //긴 ver : 값이 존재하는지 확인 후 수행하도록하는 코드
  if (kazu != null) {
    kazu.isNotEmpty;
  }
  //짧은 ver
  kazu?.isNotEmpty;
}*/

//====================

//1.4 Final Variables
//정적 변수와 같은 기능
/*
void main() {
  final name = 'kazu'; //var 대신 final을 사용하면 값 변경 불가능.
}
*/

//====================

//1.5 Late Variables
// 초기 데이터 없이 변수 선언하도록 함.
//flutter로 data fetching 때 유용함.
/*
void main() {
  late final String name; //final 변수이므로 1번만 선언 가능.
  //do something, go to api
  name = 'kazu';          //api에서 데이터 받아 변수 사용
  print(name);            //값을 넣기 전까지는 print하면 아무것도 없기 때문에 에러.
}
*/

//====================

//1.6 Const Variables - compile-time constant
//const 변수 : compile-time const에 알고 있는 값을 가진 변수
//js나 typescript의 const와 다름. dart의 final과 비슷함

/*
void main() {
  //const API = fetchApi(); //컴파일러는 API 변수 모름. api에서 받아와야 함.
  //api 요청한다 가정

  //만약 앱스토어에 앱을 올리기 전 "알고 있는 값"이면 const
  //"어떤 값인지 모르거나" "그 값이 api로부터 오거나" "사용자 입력인 경우는" final or var

  const max_allowed_price = 120;
  //앱에서 사용할 상수들이 있다면 const 써주면 됨
  //앱에 담긴 코드를 앱스토어에 보내기 전에 사용됨.
}*/

//====================

//1.7 Recap 복습
/*
void main() {
  const api_key = '121212';
  //const VS final
  //const는 코드를 컴파일하기 전에 알아야 함. ex)앱 스토어에 앱 올리기 전에
  //final은 런타임 중 만들어질 수 있음. ex)사용자가 앱 실행하면서 변수 정의 가능.

  String? name = 'kazu';
  name = null;

  if (name != null) {
    name.isEmpty;
  }
  name?.isEmpty; //name이 null이면 isEmpty 호출하지 않음.

  late final f;
  late var v;
  late int i;
  late final String str;
  //api something
  str = 'kazu'; //나중에 변수 사용.
  print(str);
}
*/