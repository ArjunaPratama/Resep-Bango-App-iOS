//
//  ViewController.swift
//  Resep Bango App iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var etnama: UILabel!
    @IBOutlet weak var etgado: UILabel!
    
    @IBOutlet weak var etcara: UILabel!
    @IBOutlet weak var etbahan: UILabel!
    
    
    var passnama:String?
    var passwaktu:String?
    var passorang:String?
    var passaharga:String?
    var passbahan:String?
    var passcara:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        etnama.text = passnama!
        etgado.text = passwaktu! + passorang! + passaharga!
//        etgado.text = passorang!
//        etgado.text = passaharga!
        etbahan.text = passbahan!
        etcara.text = passcara!
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

