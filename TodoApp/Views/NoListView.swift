//
//  NoListView.swift
//  TodoApp
//
//  Created by Lucas Pereira on 10/06/23.
//

import SwiftUI

struct NoListView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no tasks..")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Be more productive and add some ToDo's to finish them on time :)")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add Task 😀")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("bgAddTask") : Color("AccentColor"))
                        .cornerRadius(10)
                }).padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? Color("bgAddTask").opacity(0.7) : Color("AccentColor").opacity(0.7),
                        radius: animate ? 30 : 30,
                        x: 0,
                        y: animate ? 30 : 50)
                    .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()) {
                    animate.toggle()
                }
        }
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
