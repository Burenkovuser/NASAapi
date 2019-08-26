//
//  MainCell.swift
//  NASAapi
//
//  Created by Vasilii on 23/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var imageSpace: UIImageView!
    @IBOutlet weak var nameSpace: UILabel!
    
 
    func configur (with spaceObject: SpaceObject) {
        
        nameSpace.text = spaceObject.title
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: spaceObject.url!) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.imageSpace.image = UIImage(data: imageData)
            }
        }
    }

}
