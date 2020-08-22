import UIKit
import TableViewAnimationKit
import SnapKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    
    var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03)
//    var currentTableAnimation: TableAnimation = .moveUpBounce(rowHeight: 64, duration: 1.55, delay: 0.9)
//    var currentTableAnimation: TableAnimation = .moveUpWithFade(rowHeight: 32, duration: 0.55, delay: 0)
//    var currentTableAnimation: TableAnimation = .moveUp(rowHeight: 32, duration: 0.55, delay: 0.03)
//    var currentTableAnimation: TableAnimation = .moveRightBounce(rowHeight: 64, duration: 1.55, delay: 0.9)
//    var currentTableAnimation: TableAnimation = .moveDownBounce(rowHeight: 64, duration: 1.55, delay: 0.9)
//    var currentTableAnimation: TableAnimation = .moveRightBounce(rowHeight: 64, duration: 1.55, delay: 0.9)
//    var currentTableAnimation: TableAnimation = .moveLeftBounce(rowHeight: 64, duration: 1.55, delay: 0.9)
    
    let cellSpacingHeight: CGFloat = 12
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RoundedTableViewCell()
        
        cell.configure(color: .random())
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        120
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(red:   CGFloat.random(),
                       green: CGFloat.random(),
                       blue:  CGFloat.random(),
                       alpha: 1.0)
    }
}
