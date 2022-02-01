//
//  OnbordingViewController.swift
//  Food
//
//  Created by Abdelnasser on 14/09/2021.
//

import UIKit

class OnbordingViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    

    var slide : [OnborderSlide] = []

    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slide.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self


        slide = [
            OnborderSlide(titel: "Delicious Dishes", dscribtion: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnborderSlide(titel: "World-Class Chefs", dscribtion: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnborderSlide(titel: "Instant World-Wide Delivery", dscribtion: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
           
        ]

        pageControl.numberOfPages = slide.count

    }

    @IBAction func nextBtu(_ sender: UIButton) {

        if currentPage == slide.count - 1 {
            let vc = storyboard?.instantiateViewController(identifier: "Home")as!UINavigationController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnborded = true
                present(vc, animated: true, completion: nil)
            }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }



}


extension OnbordingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! OnborderSingleCollectionViewCell
        cell.setUp(slide[indexPath.row])

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }


    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)

    }

}
