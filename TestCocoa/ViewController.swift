//
//  ViewController.swift
//  TestCocoa
//
//  Created by user on 03.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var newsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private var model: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-12-13&to=2021-12-13&sortBy=popularity&apiKey=API_KEY")!) { data, response, error in
            if let data = data {
                do {
                    self.model  = (try JSONDecoder().decode(News.self, from: data)).article
                    DispatchQueue.main.async {
                        
                        self.newsTableView.reloadData()
                    }
                   
                } catch {
                    
                }
            }
            
        }.resume()
       
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsCell()
        cell.fill(model: model[indexPath.row])
        return cell
    }
}


