//
//  Extensions.swift
//  Twitter Clone
//
//  Created by faishal on 23/05/22.
//

import UIKit

//MARK: - UIImage
extension UIImage {
    
    // Change image in string
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
    
}


//MARK: - UIImage
extension String {
    
    // Change string in image
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}
