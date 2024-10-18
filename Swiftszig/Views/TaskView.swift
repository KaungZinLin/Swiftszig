//
//  ContentView.swift
//  Swiftszig (a.k.a Home View)
//
//  Created by Kaung Zin Lin on 9/30/24.
//

import SwiftUI
import FirebaseFirestore

struct TaskView: View {
    @StateObject var viewModel: TaskViewModel
    
    @State private var isShowingAIChatView: Bool = false
    @State private var isShowingSyncView: Bool = false
    @State private var isShowingSettingsView: Bool = false
    @State private var isShowingAddTaskView: Bool = false
    @FirestoreQuery var items: [TaskItem]
    
    @State private var filteredItems: [TaskItem] = []
    @State private var search: String = ""
    
    private var today: Date { Calendar.current.startOfDay(for: Date()) }
    
    private func dateFromTimeInterval(_ interval: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: interval)
    }
    
    private var todayTasks: [TaskItem] {
        itemsForFilter.filter { Calendar.current.isDateInToday(dateFromTimeInterval($0.endDate)) }
    }
    
    private var futureTasks: [TaskItem] {
        itemsForFilter.filter { dateFromTimeInterval($0.endDate) > today }
    }
    
    private var pastTasks: [TaskItem] {
        itemsForFilter.filter { dateFromTimeInterval($0.endDate) < today }
    }
    
    private func performSearch(keyword: String) {
        filteredItems = items.filter { item in
            item.taskName.contains(keyword)
        }
    }
    
    private var itemsForFilter: [TaskItem] {
        filteredItems.isEmpty ? items : filteredItems
    }
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        
        self._viewModel = StateObject(wrappedValue: TaskViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Form {
                    ForEach(todayTasks) { item in
                        TaskItemView(item: item, doesNeedDate: false)
                            .swipeActions {
                                Button {
                                    viewModel.delete(id: item.id)
                                } label: {
                                    Image(systemName: "trash.fill")
                                        .tint(Color.red)
                                }
                            }
                            
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    
                    Section(header: Text("Today (\(viewModel.fullDate))")) {
                        
                        if !todayTasks.isEmpty {
                            ForEach(todayTasks) { item in
                                TaskItemView(item: item, doesNeedDate: false)
                                    .swipeActions {
                                        Button {
                                            viewModel.delete(id: item.id)
                                        } label: {
                                            Image(systemName: "trash.fill")
                                                .tint(Color.red)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                        
                        if todayTasks.isEmpty {
                            VStack(alignment: .center) {
                                Image(systemName: "tray.fill")
                                    .font(.system(size: 59))
                                    .bold()
                                    .foregroundStyle(.blue)
                                
                                Text("No Tasks")
                                    .font(.title)
                                    .fontDesign(.rounded)
                                    .bold()
                                
                                Text("Enjoy your day!")
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    if !pastTasks.isEmpty {
                        Section("Previous") {
                            ForEach(pastTasks) { item in
                                TaskItemView(item: item, doesNeedDate: true)
                                    .swipeActions {
                                        Button {
                                            viewModel.delete(id: item.id)
                                        } label: {
                                            Image(systemName: "trash.fill")
                                                .tint(Color.red)
                                        }
                                    }
                            }
                        }
                    }
                }
                .onChange(of: search, perform: performSearch)
                .searchable(text: $search)
                .frame(maxWidth: 500)

                Button(action: {
                    isShowingAddTaskView = true
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding()
            }
            .navigationTitle("\(viewModel.monthName) 2024")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingAIChatView = true
                    }) {
                        Image(systemName: "phone")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        isShowingSettingsView = true
                    }) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $isShowingSettingsView) {
                SettingsView()
            }
            .sheet(isPresented: $isShowingAddTaskView) {
                AddTaskView()
            }
        }
    }
}

#Preview {
    TaskView(userId: "vbsfEAhMKLeSg3FkPHCtDeoo4262")
}
