//
//  FaceService.swift
//  MissingPersons
//
//  Created by Mengying Feng on 26/04/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import Foundation
import ProjectOxfordFace

class FaceService {
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "64ec8cc7a136474e9eac7154bf6b613e")
}