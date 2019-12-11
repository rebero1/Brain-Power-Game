//
//  EditItemVC.swift
//  Project 3
//
 
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
//

import UIKit

protocol EditItemDelegate: class {
    func addedMediaItem()
}

class EditItemVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
 
    let color = ["White","Black"]
    
    let difficulity = ["Easy","Medium","Hard"]
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var ratingField: UITextField!
    @IBOutlet weak var ratingStepper: UIStepper!

    @IBOutlet weak var imageView: UIImageView!
    var inputTitle: String?
    var inputArtist: String?
    
    weak var delegate: EditItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        imageView.layer.borderWidth = 6
        imageView.layer.cornerRadius = 2
         

       updatedRating()
    }
    
    func updatedRating() {
        ratingField.text = Int(ratingStepper.value).description
    }
    // MARK: - Actions
    
    @IBAction func onTitleChange(_ sender: UITextField) {
        if let newValue = sender.text {
            inputTitle = newValue
        }
    }
    
    @IBAction func onArtistChange(_ sender: UITextField) {
        if let newValue = sender.text {
            inputArtist = newValue
        }
    }

    @IBAction func onRatingChanged(_ sender: UIStepper) {
        updatedRating()
    }

    @IBAction func onCanel(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }

    @IBAction func onGaalleryButton(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage  {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        
        let imageData = (imageView.image!.pngData() as NSData?)!
        
         if let title = inputTitle, let artist = inputArtist {
            CoreDataStack.shared.saveItem(title: title,
                                          name: artist,
                                          age: color [yearPicker.selectedRow(inComponent: 0)],
                                          color: Int16(ratingStepper.value),
                                          type: Int16(typePicker.selectedRow(inComponent: 0)),
                                          image: imageData)
            delegate?.addedMediaItem()
        }
        presentingViewController?.dismiss(animated: true)
    }
}






extension EditItemVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
           return  color.count
        } else {
            
             return difficulity.count
        }
    }
}
extension EditItemVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return  color[row]
        } else {
            return difficulity[row]
        }
    }
}





    // MARK: - Actions
    
    
    


