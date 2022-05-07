//
//  ViewController.swift
//  Seafood
//
//  Created by Miguel Solans on 06/05/2022.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imageView = UIImageView();
    
    let imagePicker = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setup();
        self.style();
        
    }
    
    func setup() {

        imagePicker.delegate = self;
#if targetEnvironment(simulator)
  // your simulator code
        imagePicker.sourceType = .photoLibrary
#else
  // your real device code
        imagePicker.sourceType = .camera;
        imagePicker.allowsEditing
#endif

        
    }
    
    func style() {
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(imageView);
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ]);
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePicker Delegate Method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            
            imageView.image = pickedImage
            
            guard let ciImage = CIImage(image: pickedImage) else {
                fatalError("Could not parse to CIImage");
            }
        
            self.detect(image: ciImage)
        }
        
        
        self.imagePicker.dismiss(animated: true, completion: nil);
        
    }
    
    // MARK: - CoreML Methods
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model Failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Failed to fetch results");
            }
            
            if let firstResult = results.first {
                if(firstResult.identifier.contains("hotdog")) {
                    self.navigationItem.title = "Hotdog!";
                } else {
                    self.navigationItem.title = "Not Hotdog!"
                }
            }
            print(results)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request]);
        } catch {
            print(error);
        }
    }

}

