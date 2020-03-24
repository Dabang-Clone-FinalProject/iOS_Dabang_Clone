//
//  MoreViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
  
  //MARK: - 프로퍼티
  let userName = "PandaMan"
  let userEmail = "user@user.com"
  
  let moreView = MoreView()
  
  
  //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
//      navigationController?.pushViewController(LoginViewController(), animated: true)
      
      setupUI()
    }
  
  
  //MARK: - SetupUI & Constraints
  private func setupUI() {
    moreView.frame = view.frame
    view.addSubview(moreView)
    setupConstraints()
  }
  private func setupConstraints() {

  }
    

}
