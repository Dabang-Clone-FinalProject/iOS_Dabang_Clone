//
//  ViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/20.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import KakaoOpenSDK
import SnapKit
import Then
import Alamofire
//import Kingfisher
//import Facebook
//import RxSwift
//import GoogleMap
//import KakaoMap(?)

class LoginViewController: UIViewController {
  
  //MARK: KakaoLogin Session
  let session = KOSession.shared()
  
  //MARK: Property
  let dabangLogoImage = UIImageView().then {
    $0.image = UIImage(named: "dabangLogo")
  }
  
  //MARK: 카카오 로그인 버튼
  let kakaoLoginButton = UIButton().then {
    $0.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
    $0.setBackgroundImage(UIImage(named: "KakaoButtonImage"), for: .normal)
  }
  
  
  let facebookLoginButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "FacebookButtonImage"), for: .normal)
  }
  
  let emailTextField = UITextField().then {
    $0.placeholder = "아이디(이메일 주소)"
    $0.background = UIImage(named: "TextFieldBG")
    $0.addLeftPadding()
  }
  
  let pwTextField = UITextField().then {
    $0.placeholder = "비밀번호"
    $0.background = UIImage(named: "TextFieldBG")
    $0.addLeftPadding()
  }
  
  let pureLoginButton = UIButton(type: .system).then {
    $0.setTitle("로그인", for: .normal)
    $0.setTitleColor(UIColor.white, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    $0.layer.cornerRadius = 4
    $0.backgroundColor = UIColor(named: "PureLoginButtonColor")
  }
  
  let findPwButton = UIButton(type: .system).then {
    $0.setTitle("비밀번호 찾기 | ", for: .normal)
    $0.setTitleColor(UIColor.gray, for: .normal)
    $0.backgroundColor = .clear
  }
  
  let signUpUseEmailButton = UIButton(type: .system).then {
    $0.setTitle("이메일로 회원가입", for: .normal)
    $0.setTitleColor(UIColor.gray, for: .normal)
    $0.backgroundColor = .clear
  }
  
  let bottomGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  let bottomCallNumLabel = UILabel().then {
    $0.text = "고객센터 02-1899-6840"
    $0.textColor = .gray
    $0.textAlignment = .center
    $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
  }
  
  let loginAlert = UIView().then {
    $0.layer.cornerRadius = 5
    $0.backgroundColor = UIColor(named: "AlertColor")
  }
  let loginAlertLabel = UILabel().then {
    $0.text = "로그인 후 알림을 받을 수 있습니다."
    $0.textColor = .white
    $0.textAlignment = .center
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
    
    setupUI()
    
  }
  
  
  //MARK: 알림 눌렀을 때 뜨는 로그인 뷰에 띄울 얼럿
  private func showLoginAlert() {
    loginAlert.alpha = 1
    loginAlertLabel.alpha = 1
    
    view.addSubview(loginAlert)
    loginAlert.addSubview(loginAlertLabel)
    
    loginAlert.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.snp.centerY).multipliedBy(1.7)
      $0.width.equalToSuperview().multipliedBy(0.7)
      $0.height.equalTo(30)
    }
    
    loginAlertLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    
    UIView.animate(withDuration: 0.5, delay: 1, animations: {
      self.loginAlert.alpha = 0
      self.loginAlertLabel.alpha = 0
    }, completion: { f in
      self.loginAlert.isHidden = true
      self.loginAlertLabel.isHidden = true
    })
    
    
    
  }
  
  
  //MARK: - SetupUI
  private func setupUI() {
    
    
    view.addSubviews([
      dabangLogoImage,
      emailTextField,
      pwTextField,
      pureLoginButton,
      findPwButton,
      signUpUseEmailButton,
      kakaoLoginButton,
      facebookLoginButton,
      bottomGrayView,
    ])
    
    bottomGrayView.addSubview(bottomCallNumLabel)
    setupConstraints()
  }
  
  //MARK: Layout
  private func setupConstraints() {
    
    dabangLogoImage.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(140)
    }
    
    emailTextField.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    
    pwTextField.snp.makeConstraints {
      $0.leading.equalTo(emailTextField)
      $0.top.equalTo(emailTextField.snp.bottom).offset(10)
      $0.width.equalTo(emailTextField)
      $0.height.equalTo(emailTextField)
    }
    
    pureLoginButton.snp.makeConstraints {
      $0.leading.equalTo(emailTextField)
      $0.top.equalTo(pwTextField.snp.bottom).offset(10)
      $0.height.width.equalTo(emailTextField)
    }
    
    signUpUseEmailButton.snp.makeConstraints {
      $0.leading.equalTo(view.snp.centerX)
      $0.top.equalTo(pureLoginButton.snp.bottom).offset(15)
    }
    
    findPwButton.snp.makeConstraints {
      $0.trailing.equalTo(signUpUseEmailButton.snp.leading)
      $0.top.equalTo(pureLoginButton.snp.bottom).offset(15)
    }
    
    kakaoLoginButton.snp.makeConstraints {
      $0.leading.equalTo(emailTextField)
      $0.top.equalTo(findPwButton.snp.bottom).offset(25)
      $0.trailing.equalTo(view.snp.centerX).offset(-5)
      $0.height.equalTo(emailTextField)
    }
    
    facebookLoginButton.snp.makeConstraints {
      $0.trailing.equalTo(emailTextField)
      $0.top.equalTo(findPwButton.snp.bottom).offset(25)
      $0.leading.equalTo(view.snp.centerX).offset(5)
      $0.height.equalTo(emailTextField)
    }
    
    bottomGrayView.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview()
      $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(70)
    }
    
    bottomCallNumLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    showLoginAlert()
  }
  
  //MARK: - KAKAO Login
  @objc private func touchUpLoginButton(_ sender: UIButton) {
    guard let session = KOSession.shared() else {
      return
    }
    
    if session.isOpen() {
      session.close()
    }
    
    session.open { (error) in
      if error != nil || !session.isOpen() { return }
      KOSessionTask.userMeTask(completion: { (error, user) in
        guard let user = user,
          let email = user.account?.email,
          let nickname = user.account?.profile?.nickname else { return }
        
        if let token = session.token {
          print("AccessToken :", token.accessToken)
          print("RefreshToken :", token.refreshToken)
          
          //AF Post
          self.postKakaoToken(Token: token.accessToken)
        }
        print("email :", email, " nickname :", nickname)
        let mainVC = MainViewController()
        
        self.present(mainVC, animated: false, completion: nil)
      })
    }
  }
  
  func postKakaoToken(Token: String) {
    let kakaoToken = Token
    let param: Parameters = [
      //            "access_token" : kakaoToken
      "username" : "admin",
      "password" : "admin123"
    ]
    //        let url = URL(string: "https://moonpeter.com/members/kakaoToken/")
    let url = URL(string: "https://moonpeter.com/api/token/")
    
    AF.request(url!, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: .none, interceptor: .none).responseString { response in
      print("성공? :", response.result)
      //            let resultString =  response.result
    }
    
    
  }
}

