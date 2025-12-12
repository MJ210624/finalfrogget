//
//  TelaPostar.swift
//  finalfrogget
//
//  Created by User on 12/12/25.
//

//
//  telaPostar.swift
//  finalfrogget
//
//  Created by User on 09/12/25.
//
import SwiftUI

struct TelaPostar: View {
    @State private var texto: String = ""
    
    @State private var mostrarTopicos = false
    @State private var mostrarComunidades = false
    
    // Mantido o tópico selecionado para replicar o estado da Imagem 2
    @State private var topicoSelecionado: String? = "humor"
    @State private var comunidadeSelecionada: String? = nil
    
    
    var body: some View {
        // 1. O VStack principal precisa ocupar toda a tela.
        VStack(spacing: 0) {
            
            // --- Cabeçalho (Cancelar | Publicar) ---
            HStack {
                Button("Cancelar") { }
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Publicar") { }
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color(red: 0.10, green: 0.16, blue: 0.15)) // parte do cancelar e publicar, cor ok
            
            // --- Área de Postagem ---
            ScrollView {
    
                VStack(alignment: .leading, spacing: 16){
                    
                    // --- ÁREA DE ESCRITA E PLACEHOLDER ---
                    // Eliminamos o HStack anterior que envolvia o avatar
                    VStack(alignment: .leading) {
                        
                        // Caixa de texto e Tópico (Agora ocupando a largura total)
                        ZStack(alignment: .topLeading) {
                            
                            // Placeholder e Tópico
                            VStack(alignment: .leading, spacing: 0) {
                                // Tópico Selecionado (no topo da área de escrita)
                                if let topico = topicoSelecionado {
                                    Text("#\(topico)")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color(red: 0.10, green: 0.16, blue: 0.15).opacity(0.8)) // Cor escura para o texto
                                        .padding(.leading, 4)
                                        .padding(.top, 4)
                                }
                                
                                // Placeholder "Escreva aqui."
                                if texto.isEmpty {
                                    Text("Escreva aqui.")
                                        .foregroundColor(.black.opacity(0.5))
                                        .padding(.top, topicoSelecionado == nil ? 8 : 0) // Ajuste se houver tópico
                                        .padding(.leading, 4)
                                }
                            }
                            
                            // O TextEditor
                            TextEditor(text: $texto)
                                .frame(minHeight: 120)
                                .scrollContentBackground(.hidden) // Remove o fundo do TextEditor
                                .padding(4)
                                // Deslocamento para começar abaixo do Tópico, se houver
                                .padding(.top, topicoSelecionado != nil ? 20 : 0)
                                // Faz o TextEditor quase invisível quando vazio, expondo o placeholder
                                .opacity(texto.isEmpty ? 0.01 : 1)
                            
                        }
                    }
                    .padding(.top) // Padding para o topo do cartão
                    .padding(.horizontal)
                
                    HStack(spacing: 12) {
                        
                        Button(action: { mostrarTopicos = true }) {
                            HStack {
                                if let topico = topicoSelecionado {
                                    Text("#\(topico)")
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(Color(red: 0.87, green: 0.93, blue: 0.73))
                                        .cornerRadius(10)
                                } else {
                                    Text("+ adicionar tópico")
                                }
                            }
                            .foregroundColor(.black)
                        }
                        
                        Button(action: { mostrarComunidades = true }) {
                            HStack {
                            
                                if let comunidade = comunidadeSelecionada {
                                    Text(comunidade)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(Color(red: 0.87, green: 0.93, blue: 0.73))
                                        .cornerRadius(10)
                                } else {
                                    Text("+ adicionar comunidade")
                                }
                            }
                            .foregroundColor(.black)
                        }
                        
                        Spacer()
                    }
                    
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                    
                }
                .background(Color(red: 0.87, green: 0.93, blue: 0.73))
                .cornerRadius(16) // Arredondamento
                .padding(.horizontal) // Padding nas laterais da tela
                .padding(.top, 8) // Pequeno padding após o header
                
            }

            .background(Color(red: 0.10, green: 0.16, blue: 0.15)) // Fundo verde claro
        }
        
        .background(
            Color(red: 0.10, green: 0.16, blue: 0.15)
                 .ignoresSafeArea(.all, edges: .all)
        )
        
        .ignoresSafeArea(.keyboard)
        
     
        
        // Sheet de tópicos
        .sheet(isPresented: $mostrarTopicos) {
            ListaSelecao(
                titulo: "Escolher Tópico",
                opcoes: ["vôlei", "estudo", "humor", "reclamações"],
                selecionado: $topicoSelecionado
            )
        }
        
        // Sheet de comunidades
        .sheet(isPresented: $mostrarComunidades) {
            ListaSelecao(
                titulo: "Escolher Comunidade",
                opcoes: ["amantes de história", "grupo de estudos", "jogadores de basquete", "clubinho de RPG"],
                selecionado: $comunidadeSelecionada
            )
        }
    }
    
    // (A estrutura ListaSelecao permanece a mesma)
    struct ListaSelecao: View {
        @Environment(\.dismiss) var dismiss
        let titulo: String
        let opcoes: [String]
        @Binding var selecionado: String?
        
        var body: some View {
            NavigationView {
                List(opcoes, id: \.self) { item in
                    Button(action: {
                        selecionado = item
                        dismiss()
                    }) {
                        HStack {
                            Text(item)
                            Spacer()
                            if selecionado == item {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
                .navigationTitle(titulo)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

