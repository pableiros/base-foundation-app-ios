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
        
        if taskIndex < self.tasks.count - 1 {
            self.startBreak(after: taskIndex)
        }
    }
    
    func checkTimings() {
        let taskIsRunning = self.timerState.activeTaskIndex != nil
        
        switch timerState {
        case .runningTask(let taskIndex):
            checkForTaskFinish(activeTaskIndex: taskIndex)
        case
                .takingShortBreak(let startTime),
                .takingLongBreak(let startTime):
            if let breakDuration = timerState.breakDuration {
                checkForBreakFinish(
                    startTime: startTime,
                    duration: breakDuration)
            }
        default:
            break
        }
        
        if taskIsRunning == true {
            print("a")
        }
        
        if let appDelegate = NSApp.delegate as? AppDelegate {
            let (title, icon) = self.menuTitleAndIcon
            appDelegate.updateMenu(title: title, icon: icon, taskIsRunning: taskIsRunning)
        }
    }
    
    func checkForTaskFinish(activeTaskIndex: Int) {
        let activeTask = self.tasks[activeTaskIndex]
        
        guard activeTask.progressPercent >= 100 else { return }
        
        // tell user task has finished
        
        self.stopRunningTask(at: activeTaskIndex)
    }
    
    func checkForBreakFinish(startTime: Date, duration: TimeInterval) {
        let elapsedTime = -startTime.timeIntervalSinceNow
        if elapsedTime >= duration {
            
            self.timerState = .waiting
        }
        
        // tell user break has finished
    }
    
    func startBreak(after index: Int) {
        let oneSecondFromNow = Date(timeIntervalSinceNow: 1)
        
        if (index + 1).isMultiple(of: 4) {
            self.timerState = .takingLongBreak(startTime: oneSecondFromNow)
        } else {
            self.timerState = .takingShortBreak(startTime: oneSecondFromNow)
        }
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

