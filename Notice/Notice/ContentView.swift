//
//  ContentView.swift
//  Notice
//
//  Created by Zr埋 on 2020/2/29.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                HStack {
                    Text("用户名")
                        .font(.system(size: 20, weight: .regular))
                    Spacer()
                    TextField("在此输入学工号", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 3)
                        .frame(width: 220)
                }
                .frame(width: screen.width - 100)
                
                HStack {
                    Text("密码")
                        .font(.system(size: 20, weight: .regular))
                    Spacer()
                    SecureField("在此输入密码", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 3)
                        .frame(width: 220)
                }
                .frame(width: screen.width - 100)
            }
            
            Button(action: {
                print(self.username, self.password)
            }) {
                Text("登录")
                    .frame(width: 100, height: 30)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(15)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
