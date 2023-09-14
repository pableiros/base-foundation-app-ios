//
//  TaskManager.swift
//  Time-ato
//
//  Created by pablo borquez on 12/09/23.
//

import AppKit
import Combine

class TaskManager {
    var tasks: [Task] = Task.sampleTasks
    var timerCancellable: AnyCancellable?
    var timerState = TimerState.waiting
    
    init() {
        self.startTimer()
    }
    
    func startTimer() {
        self.timerCancellable = Timer
            .publish(every: 1,
                     tolerance: 0.5,
                     on: .current,
                     in: .common)
            .autoconnect()
            .sink { _ in
                self.checkTimings()
            }
    }
    
    func toggleTask() {
        if let activeTaskIndex = self.timerState.activeTaskIndex {
            self.stopRunningTask(at: activeTaskIndex)
        } else {
            self.startNextTask()
        }
    }
    
    func startNextTask() {
        let nextTaskIndex = self.tasks.firstIndex { $0.status == .notStarted }
        
        if let nextTaskIndex {
            self.tasks[nextTaskIndex].start()
            self.timerState = .runningTask(taskIndex: nextTaskIndex)
        }
    }
    
    func stopRunningTask(at taskIndex: Int) {
        self.tasks[taskIndex].complete()
        self.timerState = .waiting
    }
    
    func checkTimings() {
        let taskIsRunning = self.timerState.activeTaskIndex != nil
        
        guard let appDelegate = NSApp.delegate as? AppDelegate else { return }
        
        let (title, icon) = self.menuTitleAndIcon
        appDelegate.updateMenu(title: title, icon: icon, taskIsRunning: taskIsRunning)
    }
}

extension TaskManager {
    var menuTitleAndIcon: (title: String, icon: String) {
        switch timerState {
        case .runningTask(let taskIndex):
            let task = tasks[taskIndex]
            if let startTime = task.startTime {
                let remainingTime = differenceToHourMinFormat(
                    start: startTime,
                    duration: TaskTimes.taskTime)
                return ("\(task.title) - \(remainingTime)", task.status.iconName)
            } else {
                return ("Time-ato", "timer")
            }
        case .takingShortBreak(let startTime):
            let remainingTime = differenceToHourMinFormat(
                start: startTime,
                duration: TaskTimes.shortBreakTime)
            return ("Short Break - \(remainingTime)", "cup.and.saucer")
        case .takingLongBreak(let startTime):
            let remainingTime = differenceToHourMinFormat(
                start: startTime,
                duration: TaskTimes.longBreakTime)
            return ("Long Break - \(remainingTime)", "figure.walk")
        case .waiting:
            return ("Time-ato", "timer")
        }
    }
    
    func differenceToHourMinFormat(start: Date, duration: TimeInterval) -> String {
        let endTime = start.addingTimeInterval(duration)
        let remainingTime = endTime.timeIntervalSince(Date())
        if let difference = dateFormatter.string(from: remainingTime) {
            return difference
        }
        return ""
    }
}

var dateFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.zeroFormattingBehavior = .pad
    return formatter
}()

