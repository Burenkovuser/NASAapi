//
//  DetailViewController.swift
//  NASAapi
//
//  Created by Vasilii on 25/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
   @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    var detailSpaiceObject: SpaceObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = UIImage(named: detailSpaiceObject?.url ?? "")
        detailTextView.text = detailSpaiceObject?.explanation
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
