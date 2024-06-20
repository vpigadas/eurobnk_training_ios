//
//  JsonResponse.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import Foundation


struct JsonResponse : Decodable {
    var id:Int
    var name:String
    var status:String
}
