### SampleDataDeliver_ios
---
  1. alert 창컨트롤러 인스턴스를 생성한다
  2. alert 창 컨트롤러에 들어갈 버튼 액션 객체를 생성
  3. 액션 추가후 컨트롤러를 표시해준다
---
#### 소스코드

1. alert 창컨트롤러 인스턴스를 생성한다.
```swift
 let alert = UIAlertController(title: "선택",
                               message: "항목을 선택해주세요",
                               preferredStyle: .actionSheet)// .alert / .actionSheet 스타일
```
2. alert 창 컨트롤러에 들어갈 버튼 액션 객체를 생성
```swift
         // .cancel style 로 지정한 버튼은 순서에 상관없이 항상 맨아래 위치함
        let cancel = UIAlertAction(title: "취소", style: .cancel){ (_)in self.resultlabel.text = "취소 버튼 클릭"}
        let ok = UIAlertAction(title: "확인", style: .default){ (_)in self.resultlabel.text = "확인 버튼 클릭"}
        let exec = UIAlertAction(title: "실행", style: .destructive){ (_)in self.resultlabel.text = "실행 버튼 클릭"}
        let stop = UIAlertAction(title: "중지", style: .default){ (_)in self.resultlabel.text = "중지 버튼 클릭"}
```

3. 액션 추가후 컨트롤러를 표시해준다
```swift
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
    
        self.present(alert, animated: false)
```

 * 화면이 뜨자마자 자동으로 alert 띄워야할때 (viewDidLoad()가 아닌 viewDidAppear()에 구현해주어야한다)
```swift
    override func viewDidAppear(_ animated: Bool) {
        //뷰가 완전히 화면에 표현되고 난 뒤 알람띄우기
        let alert_start = UIAlertController(title: "앱 시작 알림", message: "뷰가 완전히 표현됨", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert_start.addAction(ok)
        alert_start.addAction(cancel)
        self.present(alert_start,animated: false)
    }
```
 * alert 창에 텍스트필드 추가하여 처리하기
 ```swift
     @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){ (_) in
            //클로저 구문을 이용해 확인버튼 눌렀을때 처리
            let loginid = alert.textFields?[0].text
            let loginpw = alert.textFields?[1].text
            
            if loginid == "admin" && loginpw == "1234"{
                self.resultlabel.text = "인증완료"
            }else{
                self.resultlabel.text = "인증실패"
            }
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        //텍스트 필드 추가
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "아이디"
            tf.isSecureTextEntry = false
        })
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert,animated: false)
    }
```
---
#### 여러가지 클로저 표현 형식


 [원형]
  ```swift
    alert.addTextField(configurationHandler: {(textfield : UITextField) in
            textfield.placeholder = "비밀번호"
            textfield.isSecureTextEntry = true
        })
  ```
  
  
  [변형1]클로저 인자값 대신 메소드에 실행 블록 추가
  
  
```swift
        alert.addTextField(){(textfield:UITextField) in
            textfield.placeholder = "비밀번호"
            textfield.isSecureTextEntry = true
        }
```
        
        
 [변형2]클로저 인자값의 타입 생략

```swift
        alert.addTextField() {(tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        }
```


 [변형3]클로저 인자값을 생략
 ```swift
         alert.addTextField() { $0.placeholder = "비밀번호"
            $0.isSecureTextEntry = true
        }
 ```
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    
