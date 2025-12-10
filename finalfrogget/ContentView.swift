//
//  ContentView.swift
//  finalfrogget
//
//  Created by user on 05/12/25.
//
import SwiftUIExtras
import SwiftUI

struct CardView: View {
    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading) { // Empilha itens verticalmente e alinha à esquerda
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding() // Adiciona espaço interno
        .frame(maxWidth: .infinity) // Permite que a view ocupe toda a largura disponível
        .background(Color.white) // Define o fundo do card
        .cornerRadius(10) // Arredonda os cantos
        .shadow(radius: 5) // Adiciona uma sombra suave
        .padding(.horizontal) // Adiciona espaço nas laterais da tela
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                
            }
        }
        ScrollView {
            VStack {
                CardView(title: "fui bulinado na sala", content: "xa")

            }
        }
    }
}
//        NavigationStack {
//            VStack{
//                NavigationLink("Perfil") {
//                    ProfileView()
//                }
//                SheetLink("Postar") {
//                    ProfileView()
//                }
//                FullScreenCoverLink("Perfil") {
//                    ProfileView()
//                }
//            }
//        }
        
struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Perfil")
            Button("Fechar") {
                dismiss()
            }
            
        }
    }
}
#Preview {
    ContentView()
}
