//
//  comunidade.swift
//  finalfrogget
//
//  Created by found on 09/12/25.
//

//import SwiftUI
//struct Comunidade: View {
//    var body: some View {
//        ZStack {
//            Color.black
//                .ignoresSafeArea()
//
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(spacing: 20) {
//                    ForEach(0..<50, id: \.self) { index in
//                        bloco(titulo: "Nome:\nDescrição:\nMembros: ")
//                    }
//                }
//                .frame(maxWidth: .infinity)
//                .padding()
//            }
//        }
//    }
//
//    func bloco(titulo: String) -> some View {
//        VStack(alignment: .leading) {
//            Text(titulo)
//                .foregroundColor(.white)
//                .lineLimit(nil)
//                .multilineTextAlignment(.leading)
//        }
//        .padding()
//        .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
//        .background(Color .green)
//        .cornerRadius(12)
//    }
//}
//#Preview {
//    Comunidade()
//}
//
import SwiftUI
struct Comunidade: View {
    var body: some View {
        ZStack {
            Color.verdeEscuro
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                        Text("Frogget?")
                            .ignoresSafeArea()
                            .bold(true)
                            .font(.largeTitle)
                            .padding(.top, 20)
                            .background(Color(.verdeEscuro))
                            .foregroundColor(.verdeClaro)
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "plus.circle")
                                .font(.title2)
                                .foregroundColor(Color(.verdeClaro))
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.top,20)
                    .padding(.horizontal)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color.verdeClaro)
                    .frame(maxWidth: .infinity)
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        ForEach(0..<50, id: \.self) { index in
                            bloco(titulo: "Nome:\nDescrição:\nMembros: ")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
               
                }
                TabBarView()
            }
        }
    }
    
    func bloco(titulo: String) -> some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .foregroundColor(.verdeEscuro)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .frame(maxWidth: 350, minHeight: 120, alignment: .leading)
        .background(Color.verdeClaro)
        .cornerRadius(12)
    }
}
struct TabBarView: View {
    var body: some View {
            
            HStack {
                TabItem(icon: "house", title: "Início")
                TabItem(icon: "person.2", title: "Comunidades")
                TabItem(icon: "heart", title: "Notificações")
                TabItem(icon: "person", title: "Perfil")
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .background(Color(hex: "#172525"))
        }
}
struct TabItemView: View {
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

#Preview {
    Comunidade()
}
