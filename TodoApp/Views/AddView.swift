//
//  AddView.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import SwiftUI

struct AddView: View {
    
    //dismiss a view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.0, brightness: 0.916))
                    .cornerRadius(10)
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color("bgAddTask"))
                        .cornerRadius(10)
                })
            }.padding(16)
        }.navigationTitle("Add a Task")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped() {
        if (textIsValid()) {
            listviewmodel.addTask(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if (textFieldText.count < 3) {
            alertTitle = "Your ToDo task should contain at least 3 characters 😟"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            AddView()
        }
    }
}
