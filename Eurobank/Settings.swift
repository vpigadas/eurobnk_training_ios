//
//  Settings.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 20/6/24.
//

import SwiftUI

struct Settings: View {
    
    @State private var isToggleSelected = false
    @State private var selectedItemPicker = "5"
    @State private var isSection2Visible = false
    let values = ["1","2","3","4","5","6","7"]
    
    
    var body: some View {
    
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Form {
            Section(header: Text("First Section")){
                Toggle("Handle Toggle Button", isOn: $isToggleSelected)
                Toggle("Show Section 2", isOn: $isSection2Visible)
                Toggle("Handle Toggle Button", isOn: $isToggleSelected)
                Toggle("Handle Toggle Button", isOn: $isToggleSelected)
                Picker("Select A value", selection: $selectedItemPicker){
                    ForEach(values, id: \.self){
                        item in
                        Text(item)
                    }
                }.pickerStyle(.wheel)
            }
            
            if isSection2Visible{
                Section(header: Text("Results"),footer: Text("End")){
                    Button("Cancel"){}
                    Button("Save"){}
                }
            }
            
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
