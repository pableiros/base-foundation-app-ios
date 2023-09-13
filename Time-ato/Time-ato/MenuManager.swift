//
//  MenuManager.swift
//  Time-ato
//
//  Created by pablo borquez on 11/09/23.
//

import AppKit

class MenuManager: NSObject, NSMenuDelegate {
    let statusMenu: NSMenu
    var menuIsOpen = false
    
    var tasks = Task.sampleTasksWithStatus
    
    let itemsBeforeTasks = 2
    let itemsAfterTasks = 6
    
    init(statusMenu: NSMenu) {
        self.statusMenu = statusMenu
        super.init()
    }
    
    func showTasksInMenu() {
        var index = self.itemsBeforeTasks
        var taskCounter = 0
        
        let itemFrame = NSRect(x: 0, y: 0, width: 270, height: 40)
        
        for task in self.tasks {
            let item = NSMenuItem()
            let view = TaskView(frame: itemFrame)
            
            view.task = task
            item.view = view
            
            self.statusMenu.insertItem(item, at: index)
            index += 1
            taskCounter += 1
            
            if taskCounter.isMultiple(of: 4) {
                self.statusMenu.insertItem(NSMenuItem.separator(), at: index)
                index += 1
            }
        }
    }
    
    func clearTasksFromMenu() {
        let stopAtIndex = self.statusMenu.items.count - self.itemsAfterTasks
        
        for _ in self.itemsBeforeTasks..<stopAtIndex {
            self.statusMenu.removeItem(at: self.itemsBeforeTasks)
        }
    }
    
    // MARK: - NSMenuDelegate
    
    func menuWillOpen(_ menu: NSMenu) {
        self.menuIsOpen = true
        self.showTasksInMenu()
    }
    
    func menuDidClose(_ menu: NSMenu) {
        self.menuIsOpen = false
        self.clearTasksFromMenu()
    }
}
