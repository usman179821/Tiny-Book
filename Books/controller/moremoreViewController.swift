//
//  moremoreViewController.swift
//  Books
//
//  Created by Muhammad Usman on 01/04/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class moremoreViewController: UIViewController {
    @IBOutlet weak var moreTableView: UITableView!
    
    var ProductArray = [BookSummaryModel]()
          var name = ""
          lazy var MyTableViewCellId: String = "myTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tvCell = UINib(nibName: MyTableViewCellId, bundle: nil)
               self.moreTableView.register(tvCell, forCellReuseIdentifier: MyTableViewCellId)
        moreTableView.reloadData()
        moreTableView.delegate = self
        moreTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    


}
extension moremoreViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = moreTableView.dequeueReusableCell(withIdentifier: MyTableViewCellId, for: indexPath) as! myTableViewCell
                      let instance = ProductArray[indexPath.row]
                      cell.myImagetable.image = instance.image
                      cell.myTitle.text = instance.name
                      cell.descripLable.text = instance.KeyPoint
                      cell.selectionStyle = .none
                      return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "moremoreViewController") as! moremoreViewController
//        vc.name = service.instance.CategoryArray[indexPath.row].name ?? ""
//        vc.ProductArray = service.instance.bussinessArray
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
