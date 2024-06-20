//
//  ContentView.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import SwiftUI

struct DeviceRorationModifier : ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(
                for: UIDevice.orientationDidChangeNotification)
            ){ _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform : @escaping (UIDeviceOrientation)-> Void) -> some View {
        self.modifier(DeviceRorationModifier(action: perform))
    }
}

struct ContentView: View {

    @State var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        let listData: [RowStruct] = [RowStruct(name:"Vassilis"), RowStruct(name:"Markos"), RowStruct(name:"Orfeas"), RowStruct(name:"Maria"), RowStruct(name:"Thalia"), RowStruct(name:"Vassilis"), RowStruct(name:"Markos"), RowStruct(name:"Orfeas"), RowStruct(name:"Maria"), RowStruct(name:"Thalia")]
        
        Group {
            
        }.onRotate { newOrientation in
            orientation = newOrientation
            
        }
       
        
//        VStack {
//            CustomBgImageView().frame(height: 200)
//            CustomImageView().frame(width: 160, height: 160).offset(y: -80).padding(.bottom, -80)
//
//            VStack(alignment: .leading){
//                Text("Hello, world!!!")
//                    .padding()
//                Divider()
//                HStack{
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundColor(Color.green)
//                    //Spacer().frame(width: 10)
//                    Spacer()
//                    Text("Hello, world!!!")
//                        .foregroundColor(Color.blue)
//                        .font(.title)
//                        .padding()
//                }
//            }.padding()
//
//        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
