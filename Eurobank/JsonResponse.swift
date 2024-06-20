//
//  JsonResponse.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import Foundation


struct JsonResponse : Decodable,Identifiable {
    var id:Int
    var status:String
}
