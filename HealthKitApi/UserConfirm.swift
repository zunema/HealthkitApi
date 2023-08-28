//
//  UserConfirm.swift
//  HealthKitApi
//
//  Created by 飯尾悠也 on 2023/08/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseFirestore

struct UserConfirm: View {
    
    @State var uidText = "ここにIDが表示される"
    @State var testInputText = ""
    @State var fetchText = ""
    @State var sleepDoqument = "夢のドキュメント"
    @State var sleepStr = ""
    
    let userID = Auth.auth().currentUser!.uid
    
    var body: some View {
        VStack {
            Text(userID)
        }
        
        VStack {
            TextField(text: $testInputText) {
                Text("登録する内容...")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            TextField(text: $sleepStr) {
                Text("夢の保存用...")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
            Button {
                Firestore.firestore().collection("users").document(userID)
                    .setData(
                        ["userID": userID,
                         "testText": testInputText]
                    )
            } label: {
                Text("ユーザ情報の登録。")
            }
            Button {
                Firestore.firestore().collection("sleepContents").document(sleepDoqument)
                    .setData(
                        ["sleep": sleepStr]
                    )
            } label: {
                Text("夢の登録。")
            }
        }
    }
}