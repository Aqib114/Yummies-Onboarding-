
import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: --- Making Outlets for collection view
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
  
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }
            else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    var slides = [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "slide1")),
        OnboardingSlide(title: "World Class Chef's", description: "Our Dishes are prepared by only best Chef's.", image: UIImage(named: "slide2")),
        OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your Order will be delivered instantly irrespective of your location around the world", image: UIImage(named: "slide3"))
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentOffset = .zero
      
        // collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
        customizeButton()
    }
    // MARK: --- Action perfomed on Next Button Pressed
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1
        {
            print("Go to the next screen")
        }
        else
        {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    // MARK: --- Adding custom to Next Buttton
    func customizeButton(){
        self.nextBtn.layer.cornerRadius = 10.0
    }
}

// MARK: --- Collection View Delegates and Data Source and FlowLayout
extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // MARK: --- Number of Items in Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    // MARK: --- Dequeuing custom cell in Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let slide = slides[indexPath.row]
        
        cell.setup(slide)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: floor(collectionView.frame.width), height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
