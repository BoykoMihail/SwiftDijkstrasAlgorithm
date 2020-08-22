import UIKit
import SnapKit

class RoundedTableViewCell: UITableViewCell {
    func configure(color: UIColor) {
        let view = UIView()
        addSubview(view)
        view.snp.remakeConstraints{ make in
            make.edges.equalToSuperview().inset(8)
        }
        
        view.backgroundColor = color
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
    }
}
