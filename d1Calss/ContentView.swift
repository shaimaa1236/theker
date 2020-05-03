//
//  ContentView.swift
//  d1Calss
//
//  Created by Shaimaa on 5/2/20.
//  Copyright © 2020 Shaimaa. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var theker = athkar.randomElement()!
    @State var counter = 0
    @State var newTheker = ""
    var placeHolder = "ادخل الذكر الجديد"
    var body: some View {
        
        ZStack{
            ramadanBackGround()
            VStack (alignment: .center, spacing: 20, content: {
                Text("اكتب الذكر المراد إزفاقه الى قائمة الأذكار الموجودة")
                .font(.custom("Arial", size: 20))
                .foregroundColor(.white)
                .offset(y: -60)
                .multilineTextAlignment(.trailing)
                HStack{
                    Button(action: {
                        athkar.append(self.newTheker)
                        self.newTheker = ""
                    }) {
                        Text("موافق")
                    }
                    .foregroundColor(.black)
                    .padding(10)
                      .font(.custom("Arial", size: 20))
                     .background(RoundedRectangle(cornerRadius: 10))
                     .foregroundColor(Color(#colorLiteral(red: 0.5950418115, green: 0.9450836778, blue: 0.7505430579, alpha: 1)).opacity(0.7))
                     .frame(width: 80, height: 50)
                    
                TextField(placeHolder, text: $newTheker)
                .foregroundColor(.black)
               .padding(10)
                .font(.custom("Arial", size: 20))
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(Color.white)
                .frame(width: 250, height: 50)
            .multilineTextAlignment(.trailing)
                } .offset(y: -50)
                
                VStack{
                Text(theker)
                .font(.custom("Arial", size: 30))
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                    .padding(.horizontal, 30)
                
            Text("\(counter)").modifier(modTheker1())
                .padding(.horizontal, 40)
                .padding(.vertical, 5)
                .background(Color(#colorLiteral(red: 0.5950418115, green: 0.9450836778, blue: 0.7505430579, alpha: 1)).opacity(0.4))
                .clipShape(Capsule())
        } .onTapGesture {
            self.counter = self.counter + 1
            }
        .onLongPressGesture {
            print(athkar)
            self.theker = athkar.randomElement()!
            self.counter = 0
        }
        .animation(.easeInOut)
        })
        }
        
    }
}


struct ramadanBackGround: View {
    var body: some View {
        ZStack{
//            Color.red
//            edgesIgnoringSafeArea(.all)
            Image("BACKGROUND")
                .resizable()
                .opacity(0.8)
            VStack{
                Image("Header")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.scaledToFit()   its same to the previous one
                Spacer()
                Image("Mosque")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


// the below like a function for design the text . and then use it many times
struct modTheker1: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.largeTitle)
        .foregroundColor(.white)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
