//
//  AppDelegate.swift
//  Time-ato
//
//  Created by pablo borquez on 10/09/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var menuManager: MenuManager?
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var startStopMenuItem: NSMenuItem!
    @IBOutlet weak var launchOnLoginMenuItem: NSMenuItem!
    
    func updateMenu(title: String, icon: String, taskIsRunning: Bool) {
        self.statusItem?.button?.image = NSImage(systemSymbolName: icon,
                                                 accessibilityDescription: title)
        self.updateMenuItemTitles(taskIsRunning: taskIsRunning)
    }
    
    func updateMenuItemTitles(taskIsRunning: Bool) {
        if taskIsRunning {
            self.startStopMenuItem.title = "Mark Task as Complete"
        } else {
            self.startStopMenuItem.title = "Start Next Task"
        }
        
        if self.menuManager?.menuIsOpen == true {
            self.menuManager?.updateMenuItems()
        }
    }
    
    // MARK: - NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        self.statusItem?.menu = self.statusMenu
        
        self.statusItem?.button?.title = "Time-ato"
        self.statusItem?.button?.imagePosition = .imageLeading
        self.statusItem?.button?.image = NSImage(systemSymbolName: "timer",
                                                 accessibilityDescription: "Time-ato")
        
        self.statusItem?.button?.font = NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize,
                                                                    weight: .regular)
        
        self.menuManager = MenuManager(statusMenu: self.statusMenu)
        self.statusMenu.delegate = self.menuManager
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    // MARK: - IBAction
    
    @IBAction func startStopTask(_ sender: Any) {
        self.menuManager?.taskManager.toggleTask()
    }
    
    @IBAction func showEditTaskWindow(_ sender: Any) {
    }
    
    @IBAction func toggleLaunchOnLogin(_ sender: Any) {
    }
}

