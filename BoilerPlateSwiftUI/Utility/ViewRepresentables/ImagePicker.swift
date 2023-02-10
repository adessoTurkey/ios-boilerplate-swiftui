//
//  ImagePicker.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController

    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var selectedImage: Image?
    @Environment(\.dismiss) var dismiss

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = context.coordinator

        return imagePickerController

    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

extension ImagePicker {

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.editedImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            parent.dismiss()
        }
    }
}
