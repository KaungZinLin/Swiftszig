//
//  TaskItemView.swift
//  Zig3
//
//  Created by Kaung Zin Lin on 9/29/24.
//

import SwiftUI

struct TaskItemView: View {
    let item: TaskItem
    let doesNeedDate: Bool
    @StateObject var viewModel = TaskItemViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if item.taskPripority.isEmpty {
                // No priority
                EachTaskView(item: item, showPriority: false)
            } else {
                // Priority exists
                EachTaskView(item: item, showPriority: true)
            }
        }
    }
}

struct EachTaskView: View {
    let item: TaskItem
    let showPriority: Bool
    @StateObject var viewModel = TaskItemViewModel()

    var body: some View {
        Rectangle()
            .fill(getColor(for: item.taskColor))
            .cornerRadius(20)
            .frame(width: .infinity, height: 100)
            //.frame(width: .infinity, height: 100)
            .overlay {
                HStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 50)
                        .overlay {
                            Image(systemName: "list.bullet")
                                .foregroundStyle(getColor(for: item.taskColor))
                        }
                        .padding(.trailing, 8)
                    
                    VStack(alignment: .leading) {
                        Text(item.taskName)
                            .font(.system(size: 20))
                            .bold()
                            .fontDesign(.rounded)
                            .foregroundStyle(.white)
                        

                        Text("From \(Date(timeIntervalSince1970: item.startDateAndTime).formatted(date: .abbreviated, time: .shortened)) to \(Date(timeIntervalSince1970: item.endDate).formatted(date: .omitted, time: .shortened))")
                            .font(.footnote)
                            .foregroundStyle(.white)

                        if showPriority {
                            Text("Priority: \(item.taskPripority)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.toggleIsDone(item: item)
                    } label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(.white)
                    }
                }
                .padding()
            }
    }

    // Helper to return the correct color
    func getColor(for taskColor: String) -> Color {
        switch taskColor {
        case "Blue": return .blue
        case "Red": return .red
        case "Indigo": return .indigo
        case "Mint": return .mint
        case "Purple": return .purple
        case "Orange": return .orange
        case "Cyan": return .cyan
        default: return .gray
        }
    }
}
#Preview {
    TaskItemView(item: .init(id: "PRHZtmlGK0WK3gCdAl5iQFc4eiu2", taskName: "Eat China", isMainTask: false, taskPripority: "10", startDateAndTime: Date().timeIntervalSince1970, endDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, iconName: "checkmark", taskColor: "Blue", isDone: false), doesNeedDate: true)
}
