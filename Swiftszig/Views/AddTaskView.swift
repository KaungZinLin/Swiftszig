//
//  CreateTaskView.swift
//  Swiftszig
//
//  Created by Kaung Zin Lin on 10/1/24.
//

import SwiftUI
import SFSymbolsPicker

struct AddTaskView: View {
    @StateObject private var viewModel = AddTaskViewModel()
    @State private var isShowingIconPicker: Bool = false
    @State private var icon = "star.fill"
    @State private var isShowingErrorView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("What?") {
                        TextField("e.g. Clean the house", text: $viewModel.taskName)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Button {
                                        hideInputKeyboard()
                                    } label: {
                                        Image(systemName: "keyboard.chevron.compact.down")
                                    }
                                }
                            }
                        
                        Button("Select Icon (optional)") {
                            isShowingIconPicker = true
                        }
                        
                        Picker("Task Color", selection: $viewModel.selectedColor) {
                            ForEach(viewModel.colorSelection, id: \.self) { color in
                                Text(color)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                        Toggle(isOn: $viewModel.isMainTask) {
                            Text("Is it the main task?")
                        }
                    }
                    
                    Section("When?") {
                        VStack(alignment: .leading) {
                            DatePicker("From", selection: $viewModel.startDateAndTime)
                                .datePickerStyle(DefaultDatePickerStyle())
                            
                            Divider()

                            DatePicker("To", selection: $viewModel.endTime)
                                .datePickerStyle(DefaultDatePickerStyle())
                        }
                    }
                    
                    Section("Priority (Optional)") {
                        TextField("e.g. 8", text: $viewModel.taskPriority)
                            .keyboardType(.numberPad)
                    }
                    
                    Section {
                        Button("Add Task") {
                            if viewModel.canSave {
                                viewModel.save()
                                dismiss()
                            } else {
                                viewModel.isShowingAlert = true
                            }
                        }
                        .frame(width: 300, height: 25)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(25)
                    }
                }
            }
            .navigationTitle("Add a Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
            .alert(isPresented: $viewModel.isShowingAlert) {
                Alert(
                    title: Text("Invalid Entry"),
                    message: Text("Please ensure all fields are filled in with valid dates and times and priority number must not exceed 10.")
                )
            }
            .sheet(isPresented: $isShowingIconPicker, content: {
                SymbolsPicker(selection: $icon, title: "Pick an Icon", autoDismiss: true)
    
            })
        }
    }
}

#Preview {
    AddTaskView()
}
