import UIKit

public typealias TableCellAnimation = (UITableViewCell, IndexPath, UITableView) -> Void

public final class TableViewAnimator {
    private let animation: TableCellAnimation
    
    public init(animation: @escaping TableCellAnimation) {
        self.animation = animation
    }
    
    public func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        animation(cell, indexPath, tableView)
    }
}

public enum TableAnimationFactory {
    
    public static func makeFadeAnimation(duration: TimeInterval,
                                         delayFactor: TimeInterval) -> TableCellAnimation {
        return { cell, indexPath, _ in
            cell.alpha = 0
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           animations: {
                            cell.alpha = 1
                           })
        }
    }
    
    public static func makeMoveUpWithFadeAnimation(rowHeight: CGFloat,
                                                   duration: TimeInterval,
                                                   delayFactor: TimeInterval) -> TableCellAnimation {
        return { cell, indexPath, _ in
            cell.transform = CGAffineTransform(translationX: 0, y:
                rowHeight * 1.4)
            cell.alpha = 0
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                            cell.alpha = 1
                           })
        }
    }

    public static func makeMoveUpAnimation(rowHeight: CGFloat,
                                           duration: TimeInterval,
                                           delayFactor: TimeInterval) -> TableCellAnimation {
        return { cell, indexPath, _ in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight * 1.4)
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                           })
        }
    }
    
    public static func makeMoveDownBounceAnimation(rowHeight: CGFloat,
                                                   duration: TimeInterval,
                                                   delayFactor: Double) -> TableCellAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: -rowHeight, y:
                0)
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0.1,
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                           })
        }
    }
    
    public static func makeMoveUpBounceAnimation(rowHeight: CGFloat,
                                                 duration: TimeInterval,
                                                 delayFactor: Double) -> TableCellAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0.1,
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                           })
        }
    }
    
    public static func makeMoveLeftBounceAnimation(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> TableCellAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: -rowHeight, y:
                0)
            UIView.animate(withDuration: duration,
                           delay: delayFactor * Double(indexPath.row),
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0.1,
                           options: [.curveEaseInOut],
                           animations: {
                            cell.transform = CGAffineTransform(translationX: 0, y: 0)
                           })
        }
    }
}
