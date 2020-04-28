//
//  SecondViewController.swift
//  Books
//
//  Created by Muhammad Usman on 28/03/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var catgoryTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

extension SecondViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.instance.CategoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! catgoryTableViewCell
        let instance = service.instance.CategoryArray[indexPath.row]
        cell.catgoryImagy.image = instance.Image
        cell.catgoryLabel.text = instance.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let vc = storyboard?.instantiateViewController(withIdentifier: "moremoreViewController") as! moremoreViewController
                   vc.name = service.instance.CategoryArray[indexPath.row].name ?? ""
                   vc.ProductArray = service.instance.bussinessArray
                   self.navigationController?.pushViewController(vc, animated: true)
    }
}
