//
//  FirstViewController.swift
//  Books
//
//  Created by Muhammad Usman on 28/03/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  

    //MARK:- Outlets
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderColheight: NSLayoutConstraint!
    @IBOutlet weak var catgoryColview: UICollectionView!
    @IBOutlet weak var yearcollectionView: UICollectionView!
    
    @IBOutlet weak var bestCol: UICollectionView!
    
  //MARK:- Variable.
    lazy var imagesListArray = [UIImage]()
    lazy var MyCollectionViewCellId: String = "BookCollectionViewCell"
    var scrollingTimer: Timer? // To keep track of the Auto Scrolling Timer
    lazy var dummyCount = 10 //To make the slider looks like infnite
    lazy var sliderCollectionViewDataSource: Array = [UIImage]()
    var temp:CGPoint!
    lazy var selectedPage = 0 //For keeping track of the selected page in slider
    
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Branch Code"
        
        service.instance.categoryArraySetup ()
        service.instance.yearArraySetup()
        service.instance.bestBookArraySetUp()
        
       setupViews()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        sliderColheight.constant = super.view.frame.width / 2
        
//        let itemSize = UIScreen.main.bounds.width/2
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20,left: 0,bottom: 10,right: 0)
//        layout.itemSize = CGSize(width: itemSize, height: itemSize)
//        layout.minimumInteritemSpacing = 3
//        layout.minimumLineSpacing = 3
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
//            if let layout = self.sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                var itemHeight = CGFloat()
//                if UIDevice.current.model.contains("iPhone") {
//                    itemHeight = 350
//                }
//                else if UIDevice.current.model.contains("iPad") {
//                    itemHeight =  400
//                }
//                layout.itemSize = CGSize(width: self.sliderCollectionView.frame.width, height: itemHeight)
//                layout.invalidateLayout()
//            }
//        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          startTimer()
          self.tabBarController?.tabBar.isHidden = false
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(true)
          stopTimer()
      }
    
    
    //MARK:- Private Function
    private func setupViews() {
        sliderCollectionViewDataSource = [UIImage (named: "one")!, UIImage (named: "two")!, UIImage (named: "three")!, UIImage (named: "four")!,UIImage (named: "five")!]
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        self.yearcollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        self.bestCol.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        catgoryColview.delegate = self
        catgoryColview.dataSource = self
        catgoryColview.reloadData()
        yearcollectionView.delegate = self
        yearcollectionView.dataSource = self
        yearcollectionView.reloadData()
        bestCol.delegate = self
        bestCol.dataSource = self
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.reloadData()
//        drawerView.shadowView()
//        drawerTableView.delegate = self
//        drawerTableView.dataSource = self
    }
    
}



//MARK:- Stub Collection Views
extension FirstViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == sliderCollectionView {
            return sliderCollectionViewDataSource.count * dummyCount
        }
        else if collectionView == catgoryColview
        {
            print(service.instance.CategoryArray.count)
            return service.instance.CategoryArray.count
            
       }
        else if collectionView == yearcollectionView {
            return service.instance.yearArray.count
        }
        else{
            return service.instance.bestArray.count
        }
        
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sliderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
            let imageIndex = indexPath.item % sliderCollectionViewDataSource.count
            var image = UIImage()
            image = sliderCollectionViewDataSource[imageIndex]
            cell.sliderimage.image = image
            return cell
        }
        
        else if collectionView == catgoryColview
        {
            
            let cell = catgoryColview.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as! CatCollectionViewCell
            cell.catImage.image = service.instance.CategoryArray[indexPath.row].Image
            cell.catlabel.text = service.instance.CategoryArray[indexPath.row].name
           
            return cell
        }
        else if collectionView == yearcollectionView
        {
            let cell = yearcollectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! BookCollectionViewCell
            cell.itemImg.image = service.instance.yearArray[indexPath.row].image
            cell.nameLbl.text = service.instance.yearArray[indexPath.row].name
            cell.descriptionLbl.text = service.instance.yearArray[indexPath.row].KeyPoint
            return cell
        }
        else {
            let cell = bestCol.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! BookCollectionViewCell
            cell.itemImg.image = service.instance.bestArray[indexPath.row].image
            cell.nameLbl.text = service.instance.bestArray[indexPath.row].name
            cell.descriptionLbl.text = service.instance.bestArray[indexPath.row].KeyPoint
            return cell
        }
        
        
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == categoryColView {
//           print("Categories")
//            if indexPath.row == 0 {
//                print("Bussiness")
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.bussinessArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 1 {
//                print("Biography")
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.biographyArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 2 {
//                print("Health")
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.healthArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 3 {
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.leaderShipArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 4 {
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.philoshphyArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 5 {
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.psychlogyArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 6 {
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.selfHelpArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            else if indexPath.row == 7 {
//                let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
//                vc.name = homeService.instance.CategoryArray[indexPath.row].name ?? ""
//                vc.ProductArray = homeService.instance.writingArray
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
//        else if collectionView == yearColView {
//            let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
//            vc.product = homeService.instance.yearArray[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: true)
//        }else if collectionView == bestColView {
//            let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
//            vc.product = homeService.instance.bestArray[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView {
            return sliderCollectionView.bounds.size
            
        }
        else if collectionView == catgoryColview
        {
            let cgSize = CGSize(width: 105, height: 105)
            return cgSize
        }
        else if collectionView == yearcollectionView {
            let size = CGSize(width: 200, height: 250)
            return size
        }
        else {
            let size = CGSize(width: 200, height: 250)
            return size
        }
        
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    //MARK:- Scroll view Function
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView) {
            if temp == nil{
                return
            }
            else {
                self.centerIfNeeded(animationTypeAuto: false, offSetBegin: temp!)
                self.startTimer()
            }
        }
    }
    
    
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        DispatchQueue.main.async() {
            self.stopTimer()
            self.sliderCollectionView.reloadData()
            self.sliderCollectionView.setContentOffset( CGPoint.zero, animated: true)
            self.startTimer()
        }
        print("changed orientation")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView == self.sliderCollectionView) {
            stopTimer()
        }
    }
    
    // start animating the slider
    func startTimer() {
        
        if sliderCollectionViewDataSource.count > 1 && scrollingTimer == nil {
            let timeInterval = 3.0;
            scrollingTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.rotate), userInfo: nil, repeats: true)
            scrollingTimer!.fireDate = Date().addingTimeInterval(timeInterval)
        }
    }
    
    
    func stopTimer() {
        scrollingTimer?.invalidate()
        scrollingTimer = nil
    }
    
    
    
    @objc func rotate() {
        
        let offset = CGPoint(x:self.sliderCollectionView.contentOffset.x + cellWidth, y: self.sliderCollectionView.contentOffset.y)
        var animated = true
        if (offset.equalTo(CGPoint.zero) || offset.equalTo(CGPoint(x: totalContentWidth, y: offset.y))){
            animated = false
        }
        self.sliderCollectionView.setContentOffset(offset, animated: animated)
        print("\n")
    }
    
    
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView) {
            self.centerIfNeeded(animationTypeAuto: true, offSetBegin: CGPoint.zero)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == self.sliderCollectionView){
            if(scrollView.panGestureRecognizer.state == .began){
                stopTimer()
            }else if( scrollView.panGestureRecognizer.state == .possible){
                startTimer()
            }
        }
    }
    
    
    
    func centerIfNeeded(animationTypeAuto:Bool, offSetBegin:CGPoint) {
        let currentOffset = self.sliderCollectionView.contentOffset
        let contentWidth = self.totalContentWidth
        let width = contentWidth / CGFloat(dummyCount)
        if currentOffset.x < 0{
            self.sliderCollectionView.contentOffset = CGPoint(x: width - currentOffset.x, y: currentOffset.y)
        } else if (currentOffset.x + cellWidth) >= contentWidth {
            let  point = CGPoint.zero
            var tempCGPoint = point
            tempCGPoint.x = tempCGPoint.x + cellWidth
            print("center if need set offset to \( tempCGPoint)")
            self.sliderCollectionView.contentOffset = point
        }
    }
    
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView)
        {
            print("\(scrollView.contentOffset)")
            self.temp = scrollView.contentOffset
            self.stopTimer()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == self.sliderCollectionView){
            var page:Int =  Int(collectionView.contentOffset.x / collectionView.frame.size.width)
            page = page % sliderCollectionViewDataSource.count
            pageController.currentPage = Int (page)
        }
    }
    
    
    func updatePageControl(){
        var updatedPage = selectedPage + 1
        let totalItems = sliderCollectionViewDataSource.count
        updatedPage = updatedPage % totalItems
        print("updatedPage: \(updatedPage)")
        selectedPage  = updatedPage
        self.pageController.currentPage = updatedPage
    }
    
    var totalContentWidth: CGFloat {
        return CGFloat(sliderCollectionViewDataSource.count * dummyCount) * cellWidth
    }
    
    var cellWidth: CGFloat {
        return self.sliderCollectionView.frame.width
    }
    
    
}

