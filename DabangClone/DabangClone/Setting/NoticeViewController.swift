//
//  NoticeViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//
import UIKit
import Then
import SnapKit

class NoticeViewController: UIViewController {
  
  let topView = NoticeTopView().then {
    $0.backgroundColor = .white
  }
  
  let tableView = UITableView().then {
    $0.backgroundView = NoticeEmptyView()
    $0.alwaysBounceVertical = true
    $0.allowsSelection = false
    $0.separatorStyle = .none
    $0.keyboardDismissMode = .interactive
  }
  
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    self.view.backgroundColor = .white
    self.title = "알림"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(didTabPresentButton(_:)))
    self.navigationItem.rightBarButtonItem?.tintColor = .black
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = false
  }
  
  // MARK: -Action
  @objc private func didTabPresentButton(_ sender: UIButton) {
    let vc = UINavigationController(rootViewController: SettingViewController())
    vc.modalPresentationStyle = .fullScreen
    present(vc,animated: true)
  }
  
  //MARK: - SETUP UI
  private func setupUI() {
    self.view.addSubviews([topView,tableView])
    self.tableView.dataSource = self
    
    setupConstraints()
  }
  
  //MARK: Layout
  private func setupConstraints() {
    let guide = self.view.safeAreaLayoutGuide
    topView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(guide)
      $0.height.equalTo(60)
    }
    tableView.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview()
      $0.top.equalTo(topView.snp.bottom)
    }
  }
  
  
  
  
}

extension NoticeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
}


