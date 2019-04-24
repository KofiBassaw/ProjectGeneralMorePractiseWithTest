import Foundation
import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        // swiftlint:disable:next force_cast
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }
}
