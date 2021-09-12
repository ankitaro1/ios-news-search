//
//  ABCNewsViewController.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma7 on 13/09/21.
//

import UIKit

open class ABCNewsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, SearchNewsFlowDelegate {

    @IBOutlet public var newsSearchBar: UISearchBar?
    @IBOutlet public var newsTableView: UITableView?
    
    var dataList: [SearchUIDataModel] = []
    var viewModel: SearchNewsViewModel?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        if let searchTextField = self.newsSearchBar?.value(forKey: "searchField") as? UITextField, let clearButton = searchTextField.value(forKey: "_clearButton")as? UIButton {
            clearButton.addTarget(self, action: #selector(self.clearSearch), for: .touchUpInside)
            searchTextField.textColor = .black
            searchTextField.backgroundColor = .white
        }
        self.viewModel = SearchNewsViewModel(delegate: self)
        self.newsSearchBar?.delegate = self
        self.newsTableView?.delegate = self
        self.newsTableView?.dataSource = self
        self.newsTableView?.register(UINib(nibName: "NewsTableViewCell", bundle: Constants.bundle), forCellReuseIdentifier: "NewsTableViewCell")
        self.newsTableView?.layer.cornerRadius = CGFloat(12.0)
        self.setTableViewVisibility()
    }
    
    public func fetchSearchNewsSuccess(data: [SearchUIDataModel]) {
        self.dataList = data
        self.newsTableView?.reloadData()
    }
    
    func setTableViewVisibility() {
        if self.newsSearchBar?.text?.isEmpty ?? false {
            self.newsTableView?.isHidden = true
        } else {
            self.newsTableView?.isHidden = false
        }
    }
    
    @objc
    public func clearSearch() {
        self.dataList = []
        self.newsTableView?.reloadData()
        self.newsSearchBar?.resignFirstResponder()
        self.setTableViewVisibility()
    }
    
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.setTableViewVisibility()
        self.callSearchApi()
    }
    
    func callSearchApi() {
        self.viewModel?.searchParameter = self.newsSearchBar?.text ?? ""
        self.viewModel?.performSearchNewsAction()
    }
    
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.setTableViewVisibility()
        self.newsSearchBar?.resignFirstResponder()
        self.callSearchApi()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell ?? NewsTableViewCell()
        cell.data = self.dataList[indexPath.row]
        cell.setData()
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targerVC = WebViewController()
        targerVC.loadUrl = self.dataList[indexPath.row].url
        self.navigationController?.pushViewController(targerVC, animated: true)
    }
}
