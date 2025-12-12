

//
//  TelaInicial.swift
//  finalfrogget
//
//  Created by user on 09/12/25.
//

import SwiftUI

struct TelaInicial: View {
    var body: some View {
        VStack(spacing: 0) {
            Header()
            
            ScrollView {
                VStack(spacing: 20) {
                    PostCard()
                    PostCard()
                    PostCard()
                }
                .padding(.top, 10)
            }
            
            TabBar()
        }
        .background(Color(hex: "#172525"))
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

//
// MARK: - Header
//
struct Header: View {
    var body: some View {
        ZStack {
            Color(hex: "172525")
            
            HStack {
                Spacer()
                
                HStack(spacing: 5) {
                    Image(systemName: "tortoise.fill") // Coloque seu logo depois
                    Text("Frogget?")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color(hex: "#CDE79F"))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundColor(Color(hex: "#CDE79F"))
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
    }
}

//
// MARK: - Post Card
//
struct PostCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Linha do avatar
            HStack(alignment: .top) {
                Circle()
                    .fill(Color.black.opacity(0.8))
                    .frame(width: 32, height: 32)
                
                Spacer()
            }
            .padding(.top, 8)
            
            // Texto do post
            Text("Texto.")
                .foregroundColor(.black)
                .font(.body)
                .padding(.leading, 4)
                .padding(.bottom, 8)
            
            // Ações (coração + balão)
            HStack(spacing: 20) {
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
            }
            .foregroundColor(Color.black.opacity(0.7))
            .padding(.leading, 4)
            .padding(.bottom, 10)
            
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "#CDE79F"))
        .cornerRadius(22)
        .padding(.horizontal, 10)
    }
}


//
// MARK: - Tab Bar
//
struct TabBar: View {
    var body: some View {
        HStack {
            TabItem(icon: "house", title: "Início")
            TabItem(icon: "person.2", title: "Comunidades")
            TabItem(icon: "heart", title: "Notificações")
            TabItem(icon: "person", title: "Perfil")
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Color(hex: "#172525"))
    }
}

struct TabItem: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(title)
                .font(.caption)
        }
        .foregroundColor(Color(hex: "#CDE79F"))
        .frame(maxWidth: .infinity)
    }
}

//
// MARK: - Hex Color Extension
//
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}


    struct TelaInicial_Previews: PreviewProvider {
        static var previews: some View {
            TelaInicial()
        }
    }

#Preview {
    TelaInicial()
}
