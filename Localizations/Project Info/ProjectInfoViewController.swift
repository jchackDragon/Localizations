//
//  ProjectInfoViewController.swift
//  Localizations
//
//  Created by Arnaud Thiercelin on 2/27/16.
//  Copyright © 2016 Arnaud Thiercelin. All rights reserved.
//

import Cocoa

class ProjectInfoViewController: NSViewController {

	let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
	
	@IBOutlet var projectName: NSTextField!
	@IBOutlet var rootPath: NSTextField!
	@IBOutlet var pbxprojPath: NSTextField!
	@IBOutlet var ibFiles: NSTextField!
	@IBOutlet var stringFiles: NSTextField!
	
	@IBOutlet var closeButton: NSButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.projectName.stringValue = "No Project"
		self.rootPath.stringValue = "Please choose a project root directory"
		self.pbxprojPath.stringValue = "None"
		self.ibFiles.stringValue = "0"
		self.stringFiles.stringValue = "0"
	}
	
	override func viewWillAppear() {
		guard self.appDelegate.chooseProjectViewController != nil &&
		self.appDelegate.chooseProjectViewController!.rootDirectory != nil else {
			return
		}
		self.projectName.stringValue = self.appDelegate.chooseProjectViewController!.rootDirectory.lastPathComponent!
		self.rootPath.stringValue = self.appDelegate.chooseProjectViewController!.rootDirectory.path!
		self.pbxprojPath.stringValue = self.appDelegate.chooseProjectViewController!.pbxprojPath
		self.ibFiles.stringValue = "\(self.appDelegate.chooseProjectViewController!.ibFiles.count)"
		self.stringFiles.stringValue = "\(self.appDelegate.chooseProjectViewController!.stringFiles.count)"
	}
    
}