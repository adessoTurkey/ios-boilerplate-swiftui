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
        [.camera, .savedPhotosAlbum, .photoLibrary].filter { sourceType in
            UIImagePickerController.isSourceTypeAvailable(sourceType)
        }
    }

    func text() -> String {
        switch self {
            case .camera:
                return "source_camera"
            case .savedPhotosAlbum:
                return "source_saved_album"
            case .photoLibrary:
                return "source_library"
            default: // Since the available type will be now filtered, this will not trigger.
                return ""
        }
    }
}
