//
//  ListView.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        ZStack {
            if listviewmodel.tasks.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listviewmodel.tasks) { task in
                        ListRowView(task: task)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listviewmodel.update(task: task)
                                }
                            }
                    }
                    .onDelete(perform: listviewmodel.delete)
                    .onMove(perform: listviewmodel.moveTask)
                    
                }
            }
        }
        .navigationTitle("ToDo List 📌")
        .navigationBarItems(leading: EditButton().foregroundColor(.blue), trailing: NavigationLink("Add", destination: AddView()).foregroundColor(.blue))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
    }
}
