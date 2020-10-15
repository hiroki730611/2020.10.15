//
//  RisultViewController.swift
//  SlideshowApp
//
//  Created by 中村弘樹 on 2020/10/08.
//  Copyright © 2020 hiroki.nakamura. All rights reserved.
//

import UIKit

class RisultViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = self.image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
