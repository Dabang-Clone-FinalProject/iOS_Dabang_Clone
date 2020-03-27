//
//  MarketingImfomationViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MarketingImfomationViewController: UIViewController {
  let maketingData = maketingDatas
  let tableView = UITableView().then {
    $0.register(MarketingImfomationTableViewCell.self, forCellReuseIdentifier: MarketingImfomationTableViewCell.identifier)
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


extension MarketingImfomationViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    maketingData.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return maketingData[section].MarketingDetails.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MarketingImfomationTableViewCell.identifier, for: indexPath) as! MarketingImfomationTableViewCell
    let data = maketingData[indexPath.section].MarketingDetails[indexPath.row]
    cell.configure(title: data.title, detail: data.detail)
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = MarketingImfomationView()
    view.configure(title: maketingData[section].name)
    return view
  }
  
}

extension MarketingImfomationViewController: UITableViewDelegate {
  
}
