import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    // MARK: --- Function setup to set slides data e.g images, title, description
    func setup(_ slide : OnboardingSlide)
    {
        slideImageView.image = slide.image ?? nil
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}


