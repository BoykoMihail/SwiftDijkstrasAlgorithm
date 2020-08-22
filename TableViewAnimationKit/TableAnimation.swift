import UIKit

/// Enum provider for providing the animationTitle and an animation method from the factory
public enum TableAnimation {
    case fadeIn(duration: TimeInterval, delay: TimeInterval)
    case moveUp(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    case moveUpWithFade(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    case moveUpBounce(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    case moveDownBounce(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    case moveLeftBounce(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    case moveRightBounce(rowHeight: CGFloat, duration: TimeInterval, delay: TimeInterval)
    
    // provides an animation with duration and delay associated with the case
    public func getAnimation() -> TableCellAnimation {
        switch self {
        case .fadeIn(let duration, let delay):
            return TableAnimationFactory.makeFadeAnimation(duration: duration, delayFactor: delay)
        case .moveUp(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveUpAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        case .moveUpWithFade(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveUpWithFadeAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        case .moveUpBounce(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveUpBounceAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        case .moveDownBounce(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveDownBounceAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        case .moveLeftBounce(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveLeftBounceAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        case .moveRightBounce(let rowHeight, let duration, let delay):
            return TableAnimationFactory.makeMoveRightBounceAnimation(rowHeight: rowHeight, duration: duration, delayFactor: delay)
        }
    }
}
