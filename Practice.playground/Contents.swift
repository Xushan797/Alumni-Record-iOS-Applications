import UIKit
import PlaygroundSupport
// This playground is here just for you to practice different Swift operations.
// Once you have a function working the way you want, you can copy it in to HW1.playground to start testing with your User Interface.
// The contents of this playground is not graded, so you don't have to use and you can even delete it if you want.





let defaultimage = UIImage(named: "XushanQing.jpg")
let smallpicture = defaultimage?.copy()

func stringFromImage(_
    imagePic : UIImage) ->
    String {
    let picImageData: Data =
        imagePic
        .jpegData(compressionQuality: 10)!
    let picBase64 = picImageData.base64EncodedString()
    return picBase64
}
let imagestring = stringFromImage(defaultimage!)
print(imagestring)

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}
public extension UIImage {
    func copy(newSize: CGSize, retina: Bool = true) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            /* size: */ newSize,
            /* opaque: */ false,
            /* scale: */ retina ? 0 : 1
        )
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

class playViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        let image = imagestring.toImage()
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 70, y: 50, width: 100, height: 100)
        view.addSubview(imageView)
    }
}
PlaygroundPage.current.liveView = playViewController()
// let smallImage = image.copy(newSize: CGSize(width: 144, height: 144))





