//
//  ContentView.swift
//  Passbox
//
//  Created by AI Agent on 2026-03-29.
//

import SwiftUI

struct ContentView: View {
    @State private var isLocked = true
    @State private var showUnlockSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLocked {
                    VStack(spacing: 30) {
                        Image(systemName: "lock.shield.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        Text("Passbox")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("安全存储重要信息")
                            .foregroundColor(.secondary)
                        
                        Button(action: { showUnlockSheet = true }) {
                            Label("解锁", systemImage: "lock.open")
                                .font(.headline)
                                .padding()
                                .frame(width: 200)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                } else {
                    List {
                        PasswordRow(title: "Apple ID", username: "example@icloud.com")
                        PasswordRow(title: "微信", username: "微信号")
                        PasswordRow(title: "支付宝", username: "支付宝账号")
                    }
                    
                    Button(action: { }) {
                        Label("添加密码", systemImage: "plus")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationTitle("数字遗产")
            .sheet(isPresented: $showUnlockSheet) {
                Text("Face ID / Touch ID 解锁功能待实现")
                    .padding()
            }
        }
    }
}

struct PasswordRow: View {
    let title: String
    let username: String
    
    var body: some View {
        HStack {
            Image(systemName: "key.fill")
                .font(.title)
                .foregroundColor(.orange)
                .frame(width: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(username)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
