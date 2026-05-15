//
//  UIImagePickerControllerSourceTypeExtension.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIImagePickerController.SourceType {
    static var allCases: [UIImagePickerController.SourceType] {
        [.camera, .savedPhotosAlbum, .photoLibrary].filter { sourceType in
            UIImagePickerController.isSourceTypeAvailable(sourceType)
        }
    }

    var localizedText: LocalizedStringResource {
        return switch self {
            case .camera:
                .sourceCamera
            case .savedPhotosAlbum:
                .sourceSavedAlbum
            case .photoLibrary:
                .sourceLibrary
            default: // Since the available type will be now filtered, this will not trigger.
                ""
        }
    }
}
