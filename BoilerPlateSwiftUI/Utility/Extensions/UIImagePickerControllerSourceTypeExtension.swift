//
//  UIImagePickerControllerSourceTypeExtension.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIImagePickerController.SourceType: CaseIterable {
    public static var allCases: [UIImagePickerController.SourceType] {
        [.camera, .photoLibrary, .savedPhotosAlbum]
    }

    func text() -> String {
        switch self.rawValue {
            case 0:
                return "source_library"
            case 1:
                return "source_camera"
            case 2:
                return "source_saved_album"
            default:
                return ""
        }
    }
}
