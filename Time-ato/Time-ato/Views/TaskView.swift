/// Copyright (c) 2022 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Cocoa

class TaskView: NSView {
    var task: Task?
    
    var imageView: NSImageView
    var titleTextField: NSTextField
    var infoTextField: NSTextField
    var progressBar: NSProgressIndicator
    
    override init(frame frameRect: NSRect) {
        let imageFrame = NSRect(x: 10, y: 10, width: 20, height: 20)
        imageView = NSImageView(frame: imageFrame)
        imageView.imageScaling = .scaleProportionallyUpOrDown
        
        let titleFrame = NSRect(x: 40, y: 20, width: 220, height: 16)
        titleTextField = NSTextField(frame: titleFrame)
        
        let infoProgressFrame = NSRect(x: 40, y: 4, width: 220, height: 14)
        infoTextField = NSTextField(frame: infoProgressFrame)
        
        progressBar = NSProgressIndicator(frame: infoProgressFrame)
        progressBar.minValue = 0
        progressBar.maxValue = 100
        progressBar.isIndeterminate = false
        
        titleTextField = NSTextField(frame: titleFrame)
        titleTextField.backgroundColor = .clear
        titleTextField.isBezeled = false
        titleTextField.isEditable = false
        titleTextField.font = NSFont.systemFont(ofSize: 14)
        titleTextField.lineBreakMode = .byTruncatingTail
        
        infoTextField = NSTextField(frame: infoProgressFrame)
        infoTextField.backgroundColor = .clear
        infoTextField.isBezeled = false
        infoTextField.isEditable = false
        infoTextField.font = NSFont.systemFont(ofSize: 11)
        
        super.init(frame: frameRect)
        
        self.addSubview(self.imageView)
        self.addSubview(self.titleTextField)
        self.addSubview(self.infoTextField)
        self.addSubview(self.progressBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if let task = task {
            let color = task.status.textColor
            
            self.imageView.image = NSImage(systemSymbolName: task.status.iconName,
                                           accessibilityDescription: task.status.statusText)
            self.imageView.contentTintColor = color
            
            self.titleTextField.stringValue = task.title
            self.titleTextField.textColor = color
            
            self.infoTextField.stringValue = task.status.statusText
            self.infoTextField.textColor = color
            
            switch task.status {
            case .notStarted:
                self.progressBar.isHidden = true
            case .inProgress:
                self.progressBar.doubleValue = task.progressPercent
                self.progressBar.isHidden = false
            case .complete:
                self.progressBar.isHidden = true
            }
        }
    }
}
