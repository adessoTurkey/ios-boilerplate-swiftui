//
//  ImagePicker.swift
//  boilerplate_ios_swiftui
//
//  Created by Said on 15.09.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    var completion: (()-> Void)? = nil //Use for things after should picker has dismissed
    var compressQuality: CGFloat = 1.0 //Compress Quality
   
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePicker: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let imagePicker: ImagePicker
        
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                imagePicker.image = image
                if imagePicker.compressQuality < 1 && imagePicker.compressQuality > 0 {
                    if let data = image.jpegData(compressionQuality: imagePicker.compressQuality),
                       let compressImage = UIImage(data: data) {
                        imagePicker.image = compressImage
                    }
                }
            } else {
                //throw exception maybe?
            }
            picker.dismiss(animated: true, completion: imagePicker.completion)
        }
    }
    

}
