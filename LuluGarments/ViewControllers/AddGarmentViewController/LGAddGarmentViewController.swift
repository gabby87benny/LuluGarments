//
//  LGAddGarmentViewController.swift
//  LuluGarments
//
//  Created by Gabriel on 2/20/21.
//

import UIKit

protocol LGAddGarment_Protocol {
    func addGarment(name: String)
}

class LGAddGarmentViewController: UIViewController {
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtFieldEnterGarments: UITextField!
    var delegate: LGAddGarment_Protocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if txtFieldEnterGarments.text != "" {
            delegate?.addGarment(name: txtFieldEnterGarments.text!)
            dismiss(animated: true, completion: nil)
        }
    }
}
