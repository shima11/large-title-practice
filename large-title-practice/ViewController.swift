//
//  ViewController.swift
//  large-title-practice
//
//  Created by jinsei_shima on 2019/07/08.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        extendedLayoutIncludesOpaqueBars = true

        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "Main"
        navigationItem.prompt = "Main Prompt"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
        ]
        navigationController?.navigationBar.largeTitleTextAttributes =  [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor.darkText
            ]
        
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .white

        search_controller: do {
            
            let searchController = UISearchController.init(searchResultsController: nil)
            //        searchController.searchResultsUpdater = self
            //        searchController.obscuresBackgroundDuringPresentation = false
            //        searchController.hidesNavigationBarDuringPresentation = false
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            
        }
        
        let rightBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: nil, action: nil)
        let leftBarButton = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: nil, action: nil)

        navigationItem.setRightBarButton(rightBarButton, animated: false)
        navigationItem.setLeftBarButton(leftBarButton, animated: false)

        custom_title_view: do {
            
//            let navigationView = UILabel()
//            navigationView.backgroundColor = .orange
//            navigationView.text = "custom view"
//            navigationView.textColor = .lightText
//            navigationItem.titleView = navigationView

        }

        let scrollView = UIScrollView()
        scrollView.backgroundColor = .groupTableViewBackground
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        view.addSubview(scrollView)
        
        //        let refreshControl = UIRefreshControl()
        //        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        //        scrollView.refreshControl = refreshControl

        let box = UIView()
        box.backgroundColor = .darkGray
        scrollView.addSubview(box)

        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.addSubview(button)
        
        scrollView.easy.layout(
            Edges()
        )
        
        box.easy.layout(
            Size(40),
            Top(20),
            CenterX()
        )
        
        button.easy.layout(
            Center()
        )
        
    }

    @objc func refresh(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.endRefreshing()
        }
    }
    
    @objc func didTap() {
        
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        
        navigationItem.title = "Detail"
        navigationItem.prompt = "Detail Prompt"

//        navigationItem.largeTitleDisplayMode = .automatic
//        navigationController?.navigationBar.prefersLargeTitles = true

        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .groupTableViewBackground
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.easy.layout(Edges())

    }
}
