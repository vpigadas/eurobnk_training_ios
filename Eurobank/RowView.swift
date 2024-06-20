//
//  RowView.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import SwiftUI

struct RowView: View {
    var data: RowStruct
    
    var body: some View {
        HStack{
            Image("dummy").resizable().frame(width: 80, height: 80)
            Text(data.name)
            Spacer()
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        let listData: [RowStruct]=[RowStruct(name:"Vassilis"), RowStruct(name:"Markos"), RowStruct(name:"Orfeas"), RowStruct(name:"Maria"), RowStruct(name:"Thalia")]
        
        List(listData){ item in
            RowView(data: item)
        }
        
    }
}
