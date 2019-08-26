//
//  SpaceObject.swift
//  NASAapi
//
//  Created by Vasilii on 23/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

struct SpaceObject: Decodable {
    let title: String?
    let explanation: String?
    let url: String? //image
}
