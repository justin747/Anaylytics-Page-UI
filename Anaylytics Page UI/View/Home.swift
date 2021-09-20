//
//  Home.swift
//  Home
//
//  Created by Justin747 on 9/19/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title2)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("cmpunk2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            .padding()
            .foregroundColor(.blue)
            
            VStack(spacing: 10) {
                Text("Total Balance")
                    .fontWeight(.bold)
                
                Text("$51,200")
                    .font(.system(size: 38, weight: .bold))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
