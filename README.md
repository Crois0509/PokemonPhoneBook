# Thumbnail

<img width="2642" alt="Untitled (1)" src="https://github.com/user-attachments/assets/d2bf3df6-19af-479d-a157-70c400f39d9c">

# PokemonPhoneBook

**목표**: Xcode에서 UIKit 프레임워크를 이용해서 스토리보드 혹은 코드베이스로 포켓몬 전화번호부 제작하기

![image](https://github.com/user-attachments/assets/b9e89e5b-123d-4484-9c9e-c9c8f58da66e)

### Pull Request 작성 규칙

1. **제목**: 작업한 내용에 대한 간단한 요약
     
2. **작업 세부 사항**:
  - ✨New Content✨: 새로 추가된 기능, 속성 등을 작성
  - ♻️Change Point♻️: 기존과 달라진 내용을 작성
  - 🚨Truble🚨: 작업 중 맞이한 문제, 해결하지 못한 점 등을 작성

3. **Github 커밋 컨벤션 가이드 (이모지 버전)**

  - 기본 커밋 타입 
    - ✨ `feat` : 새로운 기능 추가
    - 🐝 `fix` : 버그 수정 
    - 📝 `docs` : 문서 수정
    - 💄 `style` : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
    - ♻️ `refactor` : 코드 리팩토링
    - ✅ `test` : 테스트 코드, 리팩토링 테스트 코드 추가
    - 🎨 `chore` : 빌드 업무 수정, 패키지 매니저 수정

## 🌟 필수 구현 기능 (Levels 1-5)

- **Level 1**: `UILabel`, `UITableView`, `UIButton` 등을 이용해 테이블 뷰 만들기
- **Level 2**: `UIViewController`를 새로 추가하여 연락처 추가 화면을 구현하기(파일 이름: PhoneBookViewController.swift)
- **Level 3**: 상단 네비게이션 바 영역을 구현하기 (제목, 적용 버튼 등)
- **Level 4**: API를 연결하여 버튼을 눌렀을 때 랜덤한 이미지가 생성되도록 구현하기
- **Level 5**: 적용 버튼을 누르면 연락처 데이터(이름/전화번호/프로필 이미지)를 디스크에 실제 저장하도록 구현하기

## 💪 도전 구현 기능 (Levels 6-8)

- **Level 6**: 연락처를 추가한 후 메인화면의 연락처가 항상 이름 순으로 정렬되도록 구현하기
- **Level 7**: 테이블뷰의 셀을 클릭했을 때 `PhoneBookViewController` 페이지로 이동되도록 구현하기
- **Level 8**: 테이블뷰의 셀을 클릭해서 화면을 이동했을 때, 연락처 편집 페이지에서 실제로 기기 디스크 데이터에 Update가 일어나도록 구현하기

## 🔥 Challenge - 디테일 키우기

Level 1 ~ 8 까지 구현하고도 여유가 되시는 분들은 심화과정을 고민해보기

- 포켓몬의 덩치가 클 때, 이미지 영역을 벗어나는 경우가 있습니다. 이 때, 원 밖을 벗어나지 않도록 구현
- 연락처를 매우 많이 추가했을 경우(예: 20개 이상) 테이블 뷰 스크롤을 빠르게 내리면 이미지가 겹쳐 보이거나 텍스트가 제대로 노출되지 않는 문제 해결
- 어떻게 구현하냐에 따라 메인화면의 우상단의 `추가` 버튼이 잘 클릭되지 않는 문제 해결
- 연락처 앱에는 또 어떤 예외 사항이 있을지 스스로 고민해보며 자신만의 챌린지

## 📜 구현 가이드

- 개발 프로세스 가이드
  - **`UIKit` 화면 구성 및 화면 전환**
    - 화면구성: `UITableView`, `UILabel`, `UITextView`, `UIButton`  활용
    - 화면전환: `친구 목록 페이지` → `연락처 추가 페이지`로 이동
    
  - **`URLSession` / `Alamofire` 복습**
    - 네트워크 통신을 이용해서 서버에서 랜덤 포켓몬 이미지를 불러오기
    - 포켓몬 API: [포켓몬 API 링크](https://pokeapi.co/)

  - **`ViewController 생명주기` 개념**
    - 친구 목록 페이지에 진입할때마다 목록이 `이름순으로 정렬`되도록 설정
    
  - **`CoreData` / `UserDefaults` 활용**
    - 연락처 데이터를 `기기 디스크`에 저장

- **포켓몬 JSON Response 형태**
```swift
  // JSON Response 형태
  {
    "id": 25,
    "name": "pikachu",
    "height": 4,
    "weight": 60,
    "sprites": {
      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
    }
  }
```

---

## ⏰ 과제 일정

- 시작: 12월 6일(금) 17:00
- 종료: 12월 12일(목) 12:00 까지

## 🔥 구현 목표 🔥

- Lv1 ~ Lv8 까지 모두 구현 완료하기
- 실제 연락처 앱처럼 다양한 기능 제공하기
- CoreData를 이용한 앱 개발에 익숙해지기
- API 통신을 이용한 앱 개발에 익숙해지기
- 코드를 깔끔하게 작성하기(리팩토링 잘하기)
- 예외상황에 대한 고민을 통해 UX 개선하기
- 적절한 문서 주석 활용으로 코드 가독성 향상 시키기

## 💡 주요 기능 💡

### 1. 연락처 추가

- 새로운 연락처를 추가할 수 있다
- 연락처의 이미지를 설정할 수 있다(랜덤)
- 연락처의 이름을 설정할 수 있다
- 연락처의 번호를 설정할 수 있다

### 2. 연락처 수정

- 기존 연락처를 수정할 수 있다
- 기존 연락처의 이미지를 수정할 수 있다(랜덤)
- 기존 연락처의 이름을 수정할 수 있다
- 기존 연락처의 번호를 수정할 수 있다

### 3. 연락처 삭제

- 연락처 정보를 완전히 삭제할 수 있다
- 연락처를 다중 선택하여 한 번에 삭제할 수 있다

### 4. 이스터에그

- 프로필 이미지 설정시 일정 확률(1/4096)로 **이로치 포켓몬**이 등장

## 🤔 레벨별 고민했던 점

### Lv.1 테이블 뷰 헤더 문제

`Lv 1`을 구현할 때, 테이블 뷰의 구현은 어렵지 않게 마칠 수 있었지만 한 가지 고민이 있었다. 이번 과제의 특성상 메인 뷰 컨트롤러에서 서브뷰 컨트롤러로 이동을 `UINavigationController`를 사용해야 했는데, 이 탓에 테이블 뷰의 스크롤이 일정 이상 진행되면 테이블 뷰의 헤더가 상단에 표시되며 UI가 무너지는 문제였다.

나는 네비게이션 타이틀을 이용하여 상단바를 구현한 것이 아니라 별도의 `UIView`를 만들어 커스텀 네비게이션 타이틀을 만들었기 때문에 UI가 무너지면 타이틀이 가려지는 문제가 발생했다.
이 문제를 해결하기 위해 검색을 해 본 결과 테이블 뷰의 데이터소스 메소드에서 헤더의 크기를 조절하거나 없앨 수 있다는 것을 보고 메소드를 추가하여 문제를 해결했다.

```swift
 // 테이블뷰 헤더 크기
func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
}
    
// 테이블뷰 헤더 설정 = nil (표시하지 않음)
func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return nil
}
```

![스크린샷 2024-12-08 18 31 45](https://github.com/user-attachments/assets/23217be0-e81d-403f-9a10-0cd54520c031)

### Lv.2 ~ Lv.3 텍스트 필드와 텍스트뷰?

Lv.2 ~ Lv.3은 한 번에 진행했는데, 비교적 구현이 간단했기 때문이다.
다만 고민해썬 점은 `UITextView`와 `UITextField` 둘 중 어떤 것을 사용하여 이름과 번호를 입력하게 할 것인지에 대한 부분이었다.

이를 확실히 정하기 위해 둘의 비교를 진행해보았다.

#### **UITextField와 UITextView의 차이점**

| **특징**               | **UITextField**                                                                                       | **UITextView**                                                                                         |
|------------------------|-------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| **주요 용도**          | 단일 줄 텍스트 입력                                                                                   | 여러 줄 텍스트 입력                                                                                   |
| **Placeholder 지원**   | 기본적으로 지원 (e.g., `textField.placeholder = "Enter text"`)                                          | 기본적으로 지원하지 않음. 대신 `UILabel`을 겹쳐서 구현 가능                                            |
| **내장 Clear 버튼**     | Clear 버튼을 제공 (`clearButtonMode`)                                                                 | 지원하지 않음. 필요 시 커스텀 버튼 추가해야 함                                                         |
| **키보드 자동 관리**   | 텍스트 입력 시 키보드가 자동으로 표시되고, Return 키로 닫기 가능                                          | 키보드 자동 관리를 하지 않음. Return 키는 줄바꿈 용도로 사용됨. 키보드 닫기 기능은 직접 구현 필요         |
| **스크롤 기능**         | 텍스트 길이가 길어지면 자동 스크롤이 불가능하며 클립됨                                                   | 기본적으로 스크롤 가능                                                                                 |
| **델리게이트 메서드**   | `UITextFieldDelegate`                                                                                 | `UITextViewDelegate`                                                                                  |
| **UI 및 스타일 설정**  | `borderStyle` 등 기본적인 스타일 설정을 지원                                                            | 별도의 스타일 설정 없이 기본적으로 투명. `layer`를 사용해 커스터마이징 필요                            |
| **크기 조정**          | 텍스트가 길어져도 높이가 자동으로 확장되지 않음. 직접 조정 필요                                          | 텍스트가 길어지면 높이를 늘리는 방식으로 유연하게 설정 가능                                            |

둘을 비교해보니 사용 용도가 명확히 보이는 듯 했는데, 나는 이번에는 `UITextField`를 사용하기로 했다.
주요 선택 이유로는 `Clear` 버튼의 유무와 키보드 자동관리, `placeholder`의 유무였다. 특히 `placeholder`가 있는 것이 UX 적으로 적합하다고 생각했기에 간편히 이를 넣을 수 있는 `UITextField`가 더욱 적합해 보였다. 텍스트 길이가 제한되는 등의 문제가 있지만, 어차피 이름과 전화번호만 입력받을 것이기 때문에 문제가 없을 것이라고 판단하였다.

![스크린샷 2024-12-08 18 39 57](https://github.com/user-attachments/assets/8bda5183-ad1d-4b80-b699-c6e633226192)

### Lv.4 CoreData? API?

Lv.4를 구현하면서 고민했던 점은 이미지를 불러오는 방법이다. 이미지는 당연히 API를 통해 받아오야 하지만, 이 이미지를 앱을 시작할 때 모두 받아와서 코어데이터에 저장하고, 사용자가 이미지를 변경할 때는 코어데이터에서 불러오는 방법으로 구현할까 고민했었다.

하지만, 그렇게 할 경우 앱을 실행할 때 반복적이고 많은 API 요청을 실행하게 되고, 이로 인해 앱의 성능에 이슈가 생길지도 모른다고 생각했다.
때문에 비교적 성능비용이 낮은 방향으로 하고자 이벤트가 발생할 때만 API 통신을 진행하는 방향으로 진행했다.

대신 하나의 이스터에그를 숨겨뒀는데, 포켓몬에는 이로치(색이 다른 포켓몬)라는 개념이 있다.
API 페이지를 확인해보니 이로치 이미지도 지원하고 있었기 때문에 실제 이로치 등장 확률(1/4096)을 적용하여 특별한 이미지를 얻을 수 있도록 설정했다.
게다가 그냥 이로치 이미지로 바뀌면 알아볼 수 없기 때문에 특수 효과를 주어서 더욱 특별한 느낌을 주도록 했다.

| 일반적인 이미지 변경 | 이로치 이미지 등장시 |
| :-: | :-: |
| ![레벨4](https://github.com/user-attachments/assets/9fae1232-5309-40e7-81a7-747fa05d8a8a) | ![레벨4-1](https://github.com/user-attachments/assets/df80c038-080a-4b57-90e3-fa9c6eba46fa) |

### Lv.5 이미지를 어떻게 전달할까?

Lv.5를 해결할 때는 코어데이터에 이미지를 어떻게 전달하고 어떻게 불러올까 고민했다.
이름이나 번호는 `UITextField.text` 옵션이 있기 때문에 `String` 타입으로 주고 받으면 되지만, 이미지의 경우 고민이 되었다.

처음에는 이미지의 링크를 `String` 타입으로 바꿔서 저장하고, 불러올 때마다 변환을 시킬까 싶었으나 이것은 성능비용이 너무 비싸다는 생각이 들었고, 다른 방법을 모색했다.

인터넷을 찾아보니 코어데이터의 엔티티를 설정할 때 타입을 설정하는데, 여기서 `Binary Data`라는 타입이 있는데 이것을 이용하면 이미지를 `Data` 형식으로 저장할 수 있다는 것을 알았다.
이미지를 데이터화 시키는 방법은 `.pngData()` 메소드를 사용하면 쉽기 때문에 이 방법이 가장 적절해 보였다. 때문에 이 방법을 채택했고, 무사히 데이터를 저장할 수 있었다.

```swift
/// 폰 번호와 프로필 이미지를 저장하는 메소드
func createNewPhoneNumber() {
   guard let entity = NSEntityDescription.entity(forEntityName: PhoneBookData.className, in: self.container.viewContext) else { return }
        
   let newNumber = NSManagedObject.init(entity: entity, insertInto: self.container.viewContext)
   newNumber.setValue(self.nameTextField.text, forKey: PhoneBookData.Key.name)
   newNumber.setValue(self.numberTextField.text, forKey: PhoneBookData.Key.number)
   newNumber.setValue(self.profileImageView.image?.pngData(), forKey: PhoneBookData.Key.profile)
        
   do {
      try self.container.viewContext.save()
      print("번호 저장 성공")
   } catch {
      print("번호 저장 실패", error)
      return
   }
}
```

https://github.com/user-attachments/assets/12ff9348-a096-4fa1-b5f2-a3b971511c9e

### Lv.6 데이터를 이름순으로 정렬하기

Lv.6 에서는 추가된 데이터들을 이름순으로 정렬해야 했다.
사실 이 부분은 지난 프로젝트에서 경험한 적이 있기 때문에 그렇게 어렵지 않았다.

먼저 코어데이터에서 데이터를 모두 불러올 때, 데이터타입은 배열 형식이다. 때문에 `sorted(by:)` 옵션을 사용할 수 있는데, 이것을 이용하면 손쉽게 구현할 수 있다.
```swift
func readAllData() {
   do {
      let phoneBooks = try self.container.viewContext.fetch(PhoneBookData.fetchRequest())

      // 데이터를 알파벳 순으로 정렬하여 데이터소스에 전달
      self.dataSource = phoneBooks.sorted(by: {
      if let lhs = $0.name, let rhs = $1.name {
            return lhs < rhs
         } else {
            return false
         }
      })
      print("데이터 불러오기 성공")
            
   } catch {
      print("데이터 불러오기 실패", error)
   }
}
```

https://github.com/user-attachments/assets/8326ef41-c17a-4e3f-9f88-2e1373ed148c

### Lv.7 ~ Lv.8 테이블뷰 셀 선택시 액션 구현

Lv 7과 Lv 8에서는 테이블뷰의 셀을 선택시 `PhoneBookViewController` 창을 네비게이션으로 띄워 내용을 수정하고, 수정된 내용을 코어데이터에 업데이트하여 반영하는 작업을 진행해야 했다.
시작부터 난관에 부딪혔는데, 바로 `PhoneBookViewController`를 어떻게 띄울 것인지에 대한 문제였다. 과제에서는 새로운 뷰를 만들지 말고 기존 뷰를 활용하라고 했기 때문에 여러가지 고민을 해야 했다.

첫 번째 고민은 셀을 선택했을 때, 선택한 셀의 프로필 이미지, 이름, 전화번호 등의 데이터를 어떻게 전달할 것인가에 대한 고민이었다.
우선 셀의 선택 액션을 어떻게 구현할지 생각했는데, 테이블뷰 델리게이트 메소드를 활용하면 좋을 것 같았다.
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { ... }
```
이 메소드를 활용하면 테이블 뷰가 선택되었을 때 내부 코드가 실행되도록 할 수 있었다.
마침 `IndexPath`도 있었기 때문에 이것을 활용해서 셀의 데이터를 불러오기로 했다. 셀은 `dataSource` 라는 배열에서 정보를 가져와 내용을 구성한다.
때문에 반대로 셀의 정보를 가져오고 싶으면 `dataSource` 배열의 `IndexPath.row`번째 데이터를 가져오면 되는 것이다.
```swift
let data = self.dataSource[indexPath.row]
        
guard let name = data.name, let number = data.number, let imageData = data.profile else { return }
guard let image = UIImage(data: imageData) else { return }
```
셀의 정보를 가져왔으니 이걸 `PhoneBookViewController`에 전달하여 오픈하면 되는데, 이것을 구현하기 위해 많은 고민을 했다.
처음에는 델리게이트 패턴을 만들까 싶었지만, 두 개의 뷰 컨트롤러는 서로 네비게이션뷰를 통해 화면 전환을 할 뿐, 연결점이 없었다.

코어데이터를 프로토콜로 만들어 사용하고 있으니 이걸 이용해서 구현할까? 싶었으나, 코어데이터 프로토콜의 목적은 코어데이터의 CRUD 이기 때문에 연관성이 없는 기능을 넣으면 역할이 애매해진다고 느껴서 포기했다.
그럼 어떤 방법이 좋을까 고민하다가, 예전에 스토리보드로 구현한 뷰 컨트롤러를 인스턴스화 해서 가져온 일이 생각났다.

혹시 뷰 컨트롤러를 인스턴스화 하고, 인스턴스화 된 변수에 테이블뷰 셀의 데이터를 입력하고 네비게이션뷰를 통해 불러오면 되지 않을까?
실험을 위해 우선 뷰 컨트롤러를 인스턴스화 하여 네비게이션뷰로 불러오는 코드를 작성해보았다.
```swift
let destinationView = PhoneBookViewController()

self.navigationController?.navigationBar.isHidden = false
self.navigationController?.pushViewController(destinationView, animated: true)
```
이렇게 했더니 테이블뷰의 셀을 누르면 네비게이션을 통해 뷰 컨트롤러가 나타났다.
나는 여기서 확신을 얻고 `PhoneBookViewController`에 새로운 메소드를 추가했다.
```swift
func editPhoneNumber(name: String, number: String, image: UIImage) {
     self.nameTextField.text = name
     self.numberTextField.text = number
     self.profileImageView.image = image
        
     self.currentName = name
     self.currentNumbrer = number
}
```
이 메소드를 통해 외부에서 매개변수에 값을 입력하면, 파라미터 값을 뷰 컨트롤러에 전달하여 뷰 컨트롤러가 열렸을 때 이미 모든 값이 채워진 상태로 사용자에게 보여지게 된다.
이제 이 메소드를 테이블뷰 델리게이트 메소드에 추가하면 완성이다.
```swift
 // 셀이 선택되었을 때 실행할 액션
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let data = self.dataSource[indexPath.row]
        
     guard let name = data.name, let number = data.number, let imageData = data.profile else { return }
     guard let image = UIImage(data: imageData) else { return }
        
     // 서브뷰 업데이트 메소드 추가
     let destinationView = PhoneBookViewController()
     destinationView.editPhoneNumber(name: name, number: number, image: image)
     destinationView.state = .edit
        
     self.navigationController?.navigationBar.isHidden = false
     self.navigationController?.pushViewController(destinationView, animated: true)
}
```
이 외에도 `PhoneBookViewController`에 `enum`을 추가하여 현재 뷰 컨트롤러의 상태가 `Create`인지, `Update`인지 확인하여 서로 다른 메소드가 사용되도록 적용하였다.

https://github.com/user-attachments/assets/343b8839-971b-4c4d-b628-a80041ce973a

## 🔥 Challenge 🔥

### 1. 폰 번호 형식을 추가

이번 과제에서는 텍스트필드에 폰 번호를 입력하는게 있는데, 나는 여기에 포매터를 추가하였다.
사실 굳이 필요 없는 기능이지만, 하이픈 기호를 자동 삽입하기 위해서 포매터를 만들어 주었다.

우선 텍스트필드의 델리게이트를 이용하여 숫자만 입력 가능하게 하고, 폰 번호를 입력하는 텍스트필드에서는 넘버패드 키보드가 표시되도록 수정하였다.
```swift
// 넘버 텍스트필드에는 숫자만 입력할 수 있도록 제한하기 위한 메소드 설정
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     if textField.tag == 2 { // numberTextField만 숫자 제한
          let allowedCharacters = CharacterSet.decimalDigits
          let characterSet = CharacterSet(charactersIn: string)
          return allowedCharacters.isSuperset(of: characterSet)
     }
     return true // 다른 텍스트 필드는 제한하지 않음
}
```
이렇게 하면 사용자는 텍스트필드에 숫자 외에는 입력할 수 없게 된다.

이제 하이픈 기호를 자동으로 삽입해주는 메소드와 폰 번호 포매터를 만들어 사용자의 입력 값이 폰 번호의 형식인지 검사하는 메소드를 만들어준다.
```swift
/// 입력값이 폰 번호 형식인지 확인하는 메소드
/// - Parameter number: 입력값
/// - Returns: 폰 번호 형식과 일치하다면 true, 불일치할 경우 false
private func validatePhoneNumber(number: String) -> Bool {
// 폰 번호의 형식인지 확인하기 위한 정규식
     let regex = "^0([0-9]{1,2})-?([0-9]{3,4})-?([0-9]{4})$"
     return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: number)
}
    
/// 폰 번호에 하이픈(-) 기호를 자동 추가하는 메소드
/// - Parameter number: 하이픈을 추가할 폰 번호
/// - Returns: 하이픈이 추가된 폰 번호
private func withHypen(number: String) -> String {
     var phoneNumber = number
        
     if phoneNumber.count == 9 {
          phoneNumber.insert("-", at: phoneNumber.index(phoneNumber.startIndex, offsetBy: 2))
     } else if phoneNumber.count >= 9 && phoneNumber.dropLast(phoneNumber.count - 2) == "02" {
          phoneNumber.insert("-", at: phoneNumber.index(phoneNumber.startIndex, offsetBy: 2))
     } else {
          phoneNumber.insert("-", at: phoneNumber.index(phoneNumber.startIndex, offsetBy: 3))
     }
     phoneNumber.insert("-", at: phoneNumber.index(phoneNumber.endIndex, offsetBy: -4))
        
     return phoneNumber
}
```
원래는 사용자가 입력할 때 실시간으로 하이픈이 추가되는 것을 구현하고 싶었지만, 조건이 너무 많아지고 코드가 꼬이는 바람에 포기했다...

어쨌든 이렇게 하여 사용자는 하이픈기호 없이 번호만 입력하면 자동으로 하이픈을 추가하여 코어데이터에 저장하도록 하는 코드를 완성했다.

| 폰 번호를 아무렇게나 입력하면 | Alert이 경고 | 제대로 입력하면 | 연락처에 저장 |
| :-: | :-: | :-: | :-: |
| ![Simulator Screenshot - iPhone 16 Pro - 2024-12-11 at 20 31 58](https://github.com/user-attachments/assets/73752da2-144c-4f36-b0cb-744a876c48b5) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-11 at 20 32 02](https://github.com/user-attachments/assets/e0979d1e-1e93-4f9d-8d20-02e82e986972) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-11 at 20 32 18](https://github.com/user-attachments/assets/6caf8ba2-2a9d-4e9d-b013-5a82e3d7a327) | ![Simulator Screenshot - iPhone 16 Pro - 2024-12-11 at 20 32 21](https://github.com/user-attachments/assets/6025da19-3a48-4748-b17b-5c8a021cec03) |


### 2. 연락처 개별 삭제 기능

이번 추가 기능들을 구현하며 트러블이 굉장히... 굉장히 많았다.
가장 큰 문제는 연락처를 선택 삭제하는 부분이었는데, 셀과 뷰 컨트롤러 간의 연결과 업데이트에 대해 많이 공부할 수 있었던 시간이 되었다.

삭제할 데이터를 선택하면 selectedItem: Set<PhoneBookData>라는 배열에 담기게 되고, 삭제를 진행하면 이 배열에 있는 값과 테이블뷰의 데이터소스 값을 비교해서 동일한 값들을 삭제시키는 방법으로 구현했다.

셀을 반복해서 선택하면 selectedItem과 데이터를 비교해서 이미 존재하는 값일 경우 해당 값을 selectedItem에서 삭제하는 것으로 선택 해제를 구현하였다.

셀이 선택되면 체크박스가 체크 되어야 하는데, 이 부분에서 많이 헤맸다.
결국 중요한건 뷰 컨트롤러에서 셀의 변화를 셀에게 전달해야 한다는 점이었는데, 이번에는 selectedItem에 테이블뷰 셀이 가진 데이터와 같은 데이터가 있는지 비교하여 있을 경우 true, 없을 경우 false를 반환하게 하고 이것을 셀에 전달하여 체크박스의 상태를 변하게 하여 해결했다.

```swift
let isSelected = self.selectedItem.contains(self.dataSource[indexPath.row])
cell.editingCell(self.dataSource[indexPath.row], isSelected: isSelected)
```

https://github.com/user-attachments/assets/335f4b53-0f69-4b1c-b9f9-21069a15d6bf

### 3. 내 프로필 기능

모달로 새로운 화면을 띄웠을 때, 프로필 수정 후 자동으로 모달을 닫고 싶었는데 원하는 대로 실행되지 않았다.
`dismiss(animation:)`을 통해 닫으려고 했으나 이 과정이 제대로 이루어지지 않았다.

어떤 코드를 수정하면 좋을까 고민하다가 `Alert`의 핸들러를 통해 클로저로 해당 기능을 구현, 저장 후 자동으로 모달이 닫히는 기능을 구현 성공했다.

그러나 모달이 닫혔는데 내 프로필이 업데이트되지 않는 문제 발생했다.
내 프로필 데이터를 `UserDefaults`에 저장하는데, 모달이 닫혀도 이를 불러오는 작업이 없기 때문인 것으로 추정했고, 이를 해결하기 위해 내 프로필 데이터를 다시 불러오는 `reload()`메소드 작성했다.

이후 모달이 닫혔을 때 액션을 취하기 위해 `PhoneBookController` 에 `@escaping (() -> Void)?` 타입의 지역 변수 클로저를 선언하고 `deinit`에서 해당 클로저를 호출하게 하였다.

그리고 `ViewController`에서 모달뷰가 deinit 됐을 때 프로필뷰를 업데이트 하도록 클로저에 코드를 작성하였고, 최종적으로 원하는 대로 구현에 성공하였다.

사실 델리게이트 패턴을 쓴다던가, 다른 방법도 많은데 굳이 `deinit`을 사용한 이유는 단 한 가지의 기능을 위해 델리게이트를 만들고 사용하는 과정이 번거롭고 과하다고 생각했기 때문이다.
만약 델리게이트를 만들어 사용했을 것이라면 과제 초반부터 만들어서 적극 사용했을텐데, 이미 그렇지 않은 방향으로 만들어진 구조였기 때문에 이 구조를 무너뜨리지 않는 선에서 기능을 구현하고 싶어서 `deinit`과 클로저를 통해 해당 기능을 구현해 보았다.

![무제6](https://github.com/user-attachments/assets/ab0fc52d-bada-4015-a06c-edf5a9265c58)
