//
//  ViewController.swift
//  SampleAlertAction
//
//  Created by 박정훈 on 14/01/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultlabel: UILabel!
    
    override func viewDidLoad() {
        //화면이 뜨자마자 알람을 띄우기에는 적절하지않음
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //뷰가 완전히 화면에 표현되고 난 뒤 알람띄우기
        let alert_start = UIAlertController(title: "앱 시작 알림", message: "뷰가 완전히 표현됨", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert_start.addAction(ok)
        alert_start.addAction(cancel)
        self.present(alert_start,animated: false)
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)// .alert / .actionSheet 스타일
        
        // .cancel style 로 지정한 버튼은 순서에 상관없이 항상 맨아래 위치함
        let cancel = UIAlertAction(title: "취소", style: .cancel){ (_)in self.resultlabel.text = "취소 버튼 클릭"}
        
        let ok = UIAlertAction(title: "확인", style: .default){ (_)in self.resultlabel.text = "확인 버튼 클릭"}
        let exec = UIAlertAction(title: "실행", style: .destructive){ (_)in self.resultlabel.text = "실행 버튼 클릭"}
        let stop = UIAlertAction(title: "중지", style: .default){ (_)in self.resultlabel.text = "중지 버튼 클릭"}
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
    
        self.present(alert, animated: false)
    }
    
    @IBAction func loginaction(_ sender: Any) {
        let title = "iTunes Store 에 로그인"
        let message = "사용자의 Apple ID go90181@naver.com 의 암호를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default){(_) in if let textfield = alert.textFields?[0]{
            print("입력된 값은 \(textfield.text!)")
        }else{
            print("입력된 값이 없습니다.")
            }
        }
            //확인 버튼 눌렀을때 처리해주는 코드 클로저 구문 사용

        alert.addAction(cancel)
        alert.addAction(ok)
        
        //텍스트필드추가
        alert.addTextField(configurationHandler: { (textfield) in
            textfield.placeholder = "암호"
            textfield.isSecureTextEntry = true //입력 비밀번호 처리
        })
        
        self.present(alert,animated: false)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){ (_) in
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
}

