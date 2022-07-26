//
//  OnboardingViewController.swift
//  Foodiezz
//
//  Created by Muskan on 27/06/22.
//

import UIKit

class OnboardingViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        
        didSet{
            if currentPage == slides.count  - 1{
                
                nextButton.setTitle("Get Started", for: .normal)
                
            }else{
                nextButton.setTitle(("Next"), for: .normal)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", desription: "Experience a variety of amazing dishes from diffrent cultures around the world.", image: UIImage.init(named: "food3")!),
            OnboardingSlide(title: "World-Class Chefs", desription: "Our dishes are prepared by only the best.", image: UIImage.init(named: "chef7")!),
            OnboardingSlide(title: "Instant World-Wide Delivery", desription: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage.init(named: "delivery1")!)
        ]
        
        pageControl.numberOfPages = slides.count
        
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        
        if currentPage == slides.count - 1{
            //view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
            print("Go to next page")
            self.performSegue(withIdentifier: "signUp", sender: self)
           // let controller = storyboard?.instantiateViewController(withIdentifier: "signUp") as! SignUpViewController
            
            //controller.modalPresentationStyle = .fullScreen
           // controller.modalTransitionStyle = .flipHorizontal
           // present(controller, animated: true, completion: nil)
        }else{
            if currentPage+1 == slides.count - 1{
               view.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
                
               collectionView.backgroundColor = UIColor(red: 0.91, green: 0.96, blue: 0.98, alpha: 1.00)
             
                currentPage += 1
                pageControl.currentPage = currentPage
                let indexPath = IndexPath(item: currentPage, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }else{
                currentPage += 1
               // collectionView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
               
               // view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                //collectionView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                pageControl.currentPage = currentPage
                let indexPath = IndexPath(item: currentPage, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }

    
   // MARK: - Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
