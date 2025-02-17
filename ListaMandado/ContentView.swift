//
//  ContentView.swift
//  ListaMandado
//
//  Created by Luis Roberto Martinez on 11/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.itemList) { item in
                    Text(item.name)
                }
                .onDelete(perform: vm.delete)
                .onMove(perform: vm.move)
            }
            .animation(.default, value: vm.itemList)
            .navigationTitle("Lista de compras")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) { EditButton() }
            }
            .safeAreaInset(edge: .bottom) {
                addItemsGroup
            }
        }
    }
    
    var addItemsGroup: some View {
        VStack {
            TextField("add a new item", text: $vm.txt)
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            Button {
                vm.add()
            } label: {
                Text("ADD")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
        }.padding()
    }
    
}

#Preview {
    ContentView()
}
