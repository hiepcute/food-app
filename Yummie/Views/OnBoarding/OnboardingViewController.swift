//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by MACBOOK on 04/08/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collecctionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
        pageControl.currentPage = currentPage
         if   currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
         } else {
             nextBtn.setTitle("Next", for: .normal)
         }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collecctionView.delegate = self
        collecctionView.dataSource = self
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "slide1")!),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best..", image: UIImage(named: "slide2")!),
            OnboardingSlide(title: "Delicious Dishes", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")!)
                    
                    
                    
                ]
    }
    


    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let homeViewController  = storyboard?.instantiateViewController(identifier: "HomeVC") as!
            UINavigationController
            homeViewController.modalPresentationStyle = .fullScreen
            homeViewController.modalTransitionStyle = .flipHorizontal
            present(homeViewController, animated: true)
            
        } else {
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            collecctionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        
    }
    
    
}
