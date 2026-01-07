import SwiftUI

struct TelaPostagem: View {
    
    @State private var texto = ""
    
    @State private var topicos = ["Tecnologia", "Estudos", "Jogos", "Artes"]
    @State private var comunidades = ["iOS Dev", "Swift Brasil", "Design UI", "Programação Geral"]
    
    @State private var topicoSelecionado: String? = nil
    @State private var comunidadeSelecionada: String? = nil
    
    @State private var mostrarTopicos = false
    @State private var mostrarComunidades = false
    
    var body: some View {
        ZStack {
            Color(hex: "#1E2A28")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // Topo
                HStack {
                    Button("Cancelar") {}
                        .foregroundColor(Color(hex: "#CFE2A8"))
                    
                    Spacer()
                    
                    Button("Publicar") {}
                        .foregroundColor(Color(hex: "#CFE2A8"))
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Card principal
                VStack(alignment: .leading, spacing: 14) {
                    
                    HStack(alignment: .top) {
                        Circle()
                            .fill(Color(hex: "#1E2A28"))
                            .frame(width: 24, height: 24)
                        
                        ZStack(alignment: .topLeading) {
                            if texto.isEmpty {
                                Text("Escreva aqui.")
                                    .foregroundColor(.black.opacity(0.7))
                                    .padding(.top, 6)
                            }
                            
                            TextEditor(text: $texto)
                                .frame(height: 100)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                        }
                    }
                    
                    HStack(spacing: 20) {
                        
                        // TOPICO
                        Button {
                            mostrarTopicos.toggle()
                        } label: {
                            Text(topicoSelecionado == nil ? "+ adicionar tópico" : topicoSelecionado!)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                        }
                        
                        // COMUNIDADE
                        Button {
                            mostrarComunidades.toggle()
                        } label: {
                            Text(comunidadeSelecionada == nil ? "+ adicionar comunidade" : comunidadeSelecionada!)
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                        }
                    }
                    
                }
                .padding()
                .background(Color(hex: "#D8E7B7"))
                .cornerRadius(22)
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .sheet(isPresented: $mostrarTopicos) {
            ListaSelecao(titulo: "Escolha um tópico", itens: topicos) { item in
                topicoSelecionado = item
                mostrarTopicos = false
            }
        }
        .sheet(isPresented: $mostrarComunidades) {
            ListaSelecao(titulo: "Escolha uma comunidade", itens: comunidades) { item in
                comunidadeSelecionada = item
                mostrarComunidades = false
            }
        }
    }
}
