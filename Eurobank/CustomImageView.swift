//
//  CustomImageView.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import SwiftUI

struct CustomImageView: View {
    var body: some View {
        Image("dummy")
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 2))
            .shadow(radius: 7)
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView()
    }
}
