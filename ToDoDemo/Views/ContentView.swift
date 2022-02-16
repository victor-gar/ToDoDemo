//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Victor Garitskyu on 27.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskView()
                .environmentObject(realManager)
            
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realManager)
        }
        .frame(maxWidth: .infinity,  maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
