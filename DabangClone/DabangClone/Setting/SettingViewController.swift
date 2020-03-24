//
//  SettingViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 20 기본 2단위 늘리기 8의 배수 4배수 2배수
class SettingViewController: UIViewController {
  
  let settingData = settingDatas
  let tableView = UITableView().then {
    $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    $0.allowsSelection = false
//    $0.estimatedRowHeight = 88.0
//    $0.rowHeight = UITableView.automaticDimension
  }
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    self.view.backgroundColor = .white
    super.viewDidLoad()
    
    setupUI()
  }
  
  //MARK: - SETUP UI
  private func setupUI() {
    self.view.addSubviews([tableView])
    
    tableView.dataSource = self
    tableView.delegate = self
    setupConstraints()
  }
  
  //MARK: - Layout
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.bottom.top.leading.trailing.equalToSuperview()
    }
  }
  
}


  //MARK: - UITableViewDataSource
extension SettingViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    settingData.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return settingData[section].options.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
    let data = settingData[indexPath.section].options[indexPath.row]
    cell.configure(title: data.title, detail: data.detail)
    return cell
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = SettingSectionView()
    view.configure(title: settingData[section].name)
    return view
  }
}

  //MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
}
