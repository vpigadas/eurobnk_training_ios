//
//  NetworkScreen.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 20/6/24.
//

import SwiftUI

struct NetworkScreen: View {
    @EnvironmentObject var network: Network
    

    var body: some View {

        VStack{
            Button {
                network.get()
            } label: {
                Text ("Fetch Data")
            }
            List{
                ForEach(network.responseData){ data in
                    Text("\(data.id)")
                }
            }
        }
        
    }
}

struct NetworkScreen_Previews: PreviewProvider {
    static var previews: some View {
        NetworkScreen().environmentObject(Network())
    }
}
