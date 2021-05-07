## iOS 커리어 스타터 캠프

### 은행 매니저 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

# 브랜치 : STEP1, STEP2, STEP3

## 우리 팀만의 규칙

- 모든 팀원이 참여하는 것과 같은 기본적인 규칙 이외의 우리 팀만의 규칙을 정해요.
- 월, 목 활동학습 후 1시간 뒤 시작
- 1부 활동 시간 18시까지, 2부는 자율 조정

## 스크럼

- 스크럼이란 모든 팀원이 모여 매일 짧게 진행 상황을 공유하는 것을 말해요.
- 오전 9시 15분 시작 (수요일, 주말 제외)

## 프로젝트

- 프로젝트 협업과 관련된 규칙을 정해요.
- 제약사항
    - 코드에 느낌표(!)를 사용하지 않기
    - 외부 라이브러리를 사용하지 않기
    - GCD 대신 `Operation`을 활용해서 구현하기
- Contributor로 작업하기
- Commit Templete 설정하여 사용하기

```swift
# <타입>: <제목>

##### 제목은 최대 우측 '|' 까지만 입력 ######## -> |

# 본문은 위에 작성
##########본문은 우측 '|' 까지만 입력 ######################## -> |

# 꼬릿말은 아래에 작성: Ex #issue number

# --- COMMIT END ---
# <타입> 리스트
#   feat    : 기능 (새로운 기능)
#   fix     : 버그 (버그 수정)
#   refactor: 리팩토링
#   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
#   docs    : 문서 (문서 추가, 수정, 삭제)
#   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
#   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
# ------------------
#     제목 첫 글자를 대문자로
#     제목은 명령문으로
#     제목 끝에 마침표(.) 금지
#     제목과 본문을 한 줄 띄워 분리하기
#     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
#     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
# ------------------
```

# 적용해볼 수 있는 것들

- TDD(설계, Unit Test, Code 작성, 리팩토링)
- (추상화, 일반화, 캡슐화, 은닉화 같은 ) 객체 지향 프로그래밍하기
- UML
- 플로우차트
- 디자인패턴 (MVC)
- Struct, Class, Enum 중에 이유 있는 선택하기
- SOLID 원칙 지키기
    - **S** (Single Responsibility Principle) : 단일 책임 원칙
    - **O** (Open/Close Principle) : 개방/폐쇄 원칙
    - **L** (Liscov Substitution Principle) : 리스코브 치환 원칙
    - **I** (Interface Segregation Principle) : 인터페이스 분리 원칙
    - **D** (Dependency Inversion Principle) : 의존성 역전 원칙
- 객체지향 생활 체조 원칙 지키기

    규칙 1. 한 메서드에 오직 한 단계의 들여 쓰기만 한다.
    규칙 2. else 예약어를 쓰지 않는다.
    규칙 3. 모든 원시 값과 문자열을 포장한다.
    규칙 4. 한 줄에 점을 하나만 찍는다.
    규칙 5. 줄여 쓰지 않는다(축약 금지).
    규칙 6. 모든 엔티티를 작게 유지한다.
    규칙 7. 3개 이상의 인스턴스 변수를 가진 클래스를 쓰지 않는다.
    규칙 8. 일급 컬렉션을 쓴다.
    규칙 9. 게터/세터/프로퍼티를 쓰지 않는다.

- 이외에 배운 것 최대한 적용시켜보기
- 이전 PR들 참고해서 코드 업데이트하기
- LLDB 이용해서 디버깅 해보기
- 고차함수 같은 다양한 스위프트 문법 사용할 수 있으면 사용하기
