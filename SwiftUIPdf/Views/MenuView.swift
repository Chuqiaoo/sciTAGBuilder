//
//  MenuView.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 23/02/2021.
//

import SwiftUI

struct MenuView : View {
    
    
    var body : some View {
        
        NavigationView {
            VStack{
            Spacer()
            Image("logo")
            Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("New labels")
                        .padding()
                        .padding([.leading, .trailing], 40)
                        .foregroundColor(.white)
                        .background(Color(red: 252 / 255, green: 81 / 255, blue: 133 / 255))
                        .cornerRadius(25)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            Spacer()
            
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
