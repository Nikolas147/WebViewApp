//
//  MainViewController.swift
//  FaberlicWebViewApp
//
//  Created by Aleksey on 19/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var menuTableView: UITableView!
    
    private var timer: Timer?
    let data = MenuManager.loadData()
    var displayedRows: [CollapsableViewModel] = []
    let searchController = UISearchController(searchResultsController: nil)
    var shownMenuView = false
    
    let button: UIButton = {
       let button = UIButton(frame: CGRect(x: 3, y: 3, width: 40, height: 40))
        button.setImage(UIImage(named: "MenuIcon"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadWebView(with: "https://new.faberlic.com/")
        
        configureMainView()
        configureSearchBar()
        configureMenuTableView()
    }
    
    func configureMainView() {
        self.view.insertSubview(button, at: 1)
        
        //Добавление и загрузка логотипа с сайта
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 20))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 20))
        imageView.contentMode = .scaleAspectFit
        let urlImage = URL(string:"https://new.faberlic.com/medias/new-lg-original.png?context=bWFzdGVyfGltYWdlc3w1MTE2fGltYWdlL3BuZ3xzeXMtbWFzdGVyL2ltYWdlcy9oMzEvaDkyL2gwMC84ODE3NjMzNTkxMzI2L25ld19sZ19vcmlnaW5hbC5wbmd8MjMzYzgxODU1NTEyMjE4MjNhODRhZmE0MjliNTc4OTdlYjgzNTI2MDdmZDI4YTVhNzVhMmYyMTgxYjk1YjlmOQ")
        var image = UIImage()
        if let data = try? Data(contentsOf: urlImage!) {
            image = UIImage(data: data)!
        } else {
            image = UIImage(named: "Faberlic.jpg")!
        }
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
        //Настройка navigation Bar
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.white
        
    }
    
    func configureSearchBar() {
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        menuTableView.tableHeaderView = searchController.searchBar
        menuTableView.reloadData()
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    func configureMenuTableView() {
        menuView.frame = CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        displayedRows = data
        menuTableView.separatorStyle = .none
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.frame = view.bounds
    }
    
    @objc func buttonAction(sender: UIButton!) {
        showMenuViewController(shownMenuView: shownMenuView)
    }

    @IBAction func back(_ sender: Any) {
        if shownMenuView {
            showMenuViewController(shownMenuView: shownMenuView)
        } else if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func reloadWebView(with link: String) {
        let url = URL(string: link)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func showMenuViewController(shownMenuView: Bool) {
        if shownMenuView {
            // убираем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.menuView.frame.origin.x = -self.view.frame.width
            }) { (finished) in
                
            }
        } else {
            // показываем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.menuView.frame.origin.x = 0
            }) { (finished) in
                
            }
        }
        self.shownMenuView = !self.shownMenuView
    }
}

// MARK: Work with MenuTableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CollapsibleTableViewCell") as? CollapsibleTableViewCell) ?? CollapsibleTableViewCell(style: .default, reuseIdentifier: "CollapsibleTableViewCell")
        cell.configure(withViewModel: displayedRows[indexPath.row])
        cell.iconImageView?.image = displayedRows[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let viewModel = displayedRows[indexPath.row]
        if viewModel.children.count > 0 {
            let range = indexPath.row+1...indexPath.row+viewModel.children.count
            let indexPaths = range.map { IndexPath(row: $0, section: indexPath.section) }
            tableView.beginUpdates()
            if viewModel.isCollapsed {
                displayedRows.insert(contentsOf: viewModel.children, at: indexPath.row + 1)
                tableView.insertRows(at: indexPaths, with: .automatic)
            } else {
                displayedRows.removeSubrange(range)
                tableView.deleteRows(at: indexPaths, with: .automatic)
            }
            tableView.endUpdates()
        }
        viewModel.isCollapsed = !viewModel.isCollapsed
        
        if let link = viewModel.link {
            reloadWebView(with: link)
            showMenuViewController(shownMenuView: shownMenuView)
        }
    }
}


// MARK: Work with SearchBar
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (_) in
            
            // поиск работает только с английским текстом
            self.reloadWebView(with: "https://new.faberlic.com/ru/search?text=\(searchText)")
            
            if self.shownMenuView{
                self.showMenuViewController(shownMenuView: self.shownMenuView)
            }
        })
    }
}

// MARK: Work with JavaScript
extension MainViewController {
    //    func addUserScript(js: String, contentController: WKUserContentController) {
    //        let userScript = WKUserScript(source: js,
    //                                      injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
    //                                      forMainFrameOnly: false)
    //        contentController.addUserScript(userScript)
    //    }
    //
    //    override func loadView() {
    //
    //        let webConfiguration = WKWebViewConfiguration()
    //        let contentController = WKUserContentController()
    //
    //        addUserScript(js: "document.getElementsByClassName('onboarding-trigger js-onboarding-trigger d-flex j-content-center a-items-center')[0].remove()",
    //                      contentController: contentController)
    //
    //        addUserScript(js: "document.getElementsByClassName('side-nav__enter d-flex ml-xl-2 js-side-menu__open')[0].style.visibility = 'hidden'",
    //                      contentController: contentController)
    //        addUserScript(js: "document.getElementsByClassName('navbar-header')[0].remove()",
    //                      contentController: contentController)
    //
    //        webConfiguration.userContentController = contentController
    //        webView = WKWebView(frame: .zero, configuration: webConfiguration)
    //        webView.uiDelegate = self
    //        webView.navigationDelegate = self
    //        view = webView
    //        print("load view")
    //    }
}
