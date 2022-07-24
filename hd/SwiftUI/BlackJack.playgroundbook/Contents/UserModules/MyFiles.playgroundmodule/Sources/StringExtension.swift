import UIKit

public extension String {
    
    /// /*#-localizable-zone(stringExtension1)*/Returns a UIImage from a string. This can be used to generate an image based on an emoji string./*#-end-localizable-zone*/
    func image() -> UIImage {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 85)])
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return image
            
        } else {
            return UIImage()
        }
    }
}
