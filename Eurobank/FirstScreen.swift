//
//  FirstScreen.swift
//  Eurobank
//
//  Created by Vasileios Pigadas on 19/6/24.
//

import SwiftUI

struct FirstScreen: View {

    @State private var text = ""

    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: SecondScreen(title:"Second Screen from Params", subTitle: $text)){
                    Text("Navigate to Second Screen")
                }
                
                Text(text)
                AsyncImage(url: URL(string: "https://cloudinary-marketing-res.cloudinary.com/images/w_1000,c_scale/v1679921049/Image_URL_header/Image_URL_header-png?_i=AA")){ image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 120, height: 120)
//                ScrollView {
//                    LazyVStack {
//                        ForEach(1...10000, id: \.self) {
//                            value in
//                            Text ("Row is \(value)")
//                        }
//                    }
//                }
            }
        }
        .navigationBarHidden(false)
        .navigationTitle(Text("Menu"))
    }
}

struct SecondScreen: View {
    let title:String
    
    @Binding var subTitle:String
    @State private var showingAlert = false
    @State private var showingBottomSheet = false
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: ThirdScree()){
                    Text(title)
                }
                
                TextField("Enter a message", text: $subTitle)
                Button("Show Alert"){
                    showingAlert = true
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text("Oops!!!"), message: Text("I have a message for you!!!"), dismissButton: .default(Text("DONE")))
                }
                
                Button("Show Bottom Sheet") {
                    showingBottomSheet.toggle()
                }.sheet(isPresented: $showingBottomSheet){
                    Text("This is a bottomShet dialog from our application")
                }
            }
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)

    }
}

struct ThirdScree : View {
    
    var body: some View {
        Button {
            Task {
                let (data, _ ) = try await URLSession.shared.data(from: URL(string: "https://petstore.swagger.io/v2/pet/findByStatus?status=available")!)
                let decodeResponse = try? JSONDecoder().decode([JsonResponse].self, from: data)
                print(decodeResponse)
            }
        } label: {
            Text ("Fetch Data")
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
