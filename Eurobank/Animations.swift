//
//  Animations.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import SwiftUI

struct Animations: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("dummy")
                    
//                    VStack{
                        VStack {
                            Text("Hello, World!")
                                .foregroundColor(Color.white)
                                .padding()
                        }.background(Color.black)
                        VStack {
                        Text("Hello, World!!!")
                            .foregroundColor(Color.white)
                            .padding()
                        }.background(Color.blue)
                    }
//                }
                
            }
        }
        
    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
