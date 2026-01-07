//
//  ListaSelecao.swift
//  finalfrogget
//
//  Created by User on 07/01/26.
//

import SwiftUI

struct ListaSelecao: View {
    
    var titulo: String
    var itens: [String]
    var onSelect: (String) -> Void
    
    var body: some View {
        NavigationView {
            List(itens, id: \.self) { item in
                Button(action: {
                    onSelect(item)
                }) {
                    Text(item)
                }
            }
            .navigationTitle(titulo)
        }
    }
}
