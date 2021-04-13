//
//  ContentView.swift
//  Shared
//
//  Created by Alejo Acosta on 6/25/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store : SandwichStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell2(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
//            .toolbar {
//                #if os(iOS)
//                EditButton()
//                Button("Add") {
//                    makeSandwich()
//                }
//                #endif
            .navigationBarItems(leading:
                                    EditButton(),
                                trailing: Button("Add") { makeSandwich()}
            )
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Caprese", ingredientCount: 3))
        }
    }

    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches (offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich : Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            Image(sandwich.thumbnailName)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SandwichCell2: View {
    var sandwich: Sandwich      // passed in just ONE sandwich
    
    var body: some View {
        NavigationLink( destination: SandwichDetail(sandwich: sandwich)) {
            
            Image(sandwich.thumbnailName)
                .resizable()        // our thumbnails are not all the same size
                .aspectRatio(contentMode: .fit )
                .cornerRadius(8)
                .frame(width: 50, height: 50 )
            
            
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
