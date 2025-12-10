//
//  SwiftUIView.swift
//  finalfrogget
//
//  Created by found on 09/12/25.
//

import SwiftUI

struct NotificationsScreen: View {
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "frogIcon")
                        .font(.system(size: 26))
                        .foregroundColor(Color(red: 0.84, green: 1.0, blue: 0.72))
                    Text("Frogget?")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(Color(red: 0.84, green: 1.0, blue: 0.72))
                    Spacer()
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 28))
                        .foregroundColor(Color(red: 0.84, green: 1.0, blue: 0.72))
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color(red: 0.84, green: 1.0, blue: 0.72))
                    .frame(height: 1)
                    .padding(.top, 8)
            }
            .padding(.top, 40)
            
            // MARK: - SCROLL CONTENT
            ScrollView {
                VStack(spacing: 22) {
                    ForEach(0..<5) { _ in
                        NotificationCard()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 80)
            }
            
            // MARK: - CUSTOM TAB BAR
            FrogTabBar()
        }
        .background(Color(red: 0.07, green: 0.11, blue: 0.12).ignoresSafeArea())
    }
}


// MARK: - COMPONENT: Notification Card
struct NotificationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("fulaninho curtiu seu post:")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            
            Text("tenho depressão e meu namorado fez uma coisa imperdoável...")
                .font(.system(size: 15))
                .foregroundColor(.black)
            
            Text("732 likes")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.black)
                .padding(.top, 4)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.84, green: 1.0, blue: 0.72))
        .cornerRadius(28)
    }
}


// MARK: - COMPONENT: Tab Bar
struct FrogTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 4) {
                Image(systemName: "house.fill")
                Text("Início").font(.caption2)
            }.foregroundColor(.white)
            
            Spacer()
            VStack(spacing: 4) {
                Image(systemName: "person.2.fill")
                Text("Comunidades").font(.caption2)
            }.foregroundColor(.white)
            
            Spacer()
            VStack(spacing: 4) {
                Image(systemName: "heart.fill")
                Text("Notificações").font(.caption2)
            }.foregroundColor(.white)
            
            Spacer()
            VStack(spacing: 4) {
                Image(systemName: "person.crop.circle")
                Text("Perfil").font(.caption2)
            }.foregroundColor(.white)
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color(red: 0.07, green: 0.11, blue: 0.12))
        .overlay(
            Rectangle()
                .fill(Color.white.opacity(0.15))
                .frame(height: 0.5)
                .offset(y: -25),
            alignment: .top
        )
    }
}


// MARK: - PREVIEW
#Preview {
    NotificationsScreen()
}
