//
//  TaskCellTests.swift
//  MovingHelper
//
//  Created by Tim Kelly on 9/24/15.
//  Copyright © 2015 FizzyArtwerks. All rights reserved.
//

import UIKit
import XCTest
import MovingHelper

class TaskCellTests: XCTestCase {
    
    func testCheckingCheckboxMarksTaskDone() {
        
        var testCell: TaskTableViewCell?
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let navVC = mainStoryboard.instantiateInitialViewController() as? UINavigationController,
            listVC = navVC.topViewController as? MasterViewController
        {
                let tasks = TaskLoader.loadStockTasks()
                listVC.createdMovingTasks(tasks)
                testCell = listVC.tableView(listVC.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0,
                    inSection: 0)) as? TaskTableViewCell
        } else {
            XCTFail("Could not get reference to list VC!")
        }
        
        if let cell = testCell {
            //1
            // Create an expectation for which to wait. Since the delegate is a separate object from the test, you may not hit the success block immediately.
            let expectation = expectationWithDescription("Task updated")
            
            //2
            // Create an inline struct, conforming to the test delegate, which allows you to check and see whether it was called or not. Since you want this struct to tell you when the expectation has been met, and do a check based on a value you pass it, you make it accept both the expectation and the expected values as parameters.
            struct TestDelegate: TaskUpdatedDelegate {
                let testExpectation: XCTestExpectation
                let expectedDone: Bool
                
                init(updatedExpectation: XCTestExpectation,
                    expectedDoneStateAfterToggle: Bool) {
                        testExpectation = updatedExpectation
                        expectedDone = expectedDoneStateAfterToggle
                }
                
                func taskUpdated(task: Task) {
                    XCTAssertEqual(expectedDone, task.done, "Task done state did not match expected!")
                    testExpectation.fulfill()
                }
            }
            
            //3
            // Set up the test task and verify its initial value, then configure the cell.
            let testTask = Task(aTitle: "TestTask", aDueDate: .OneMonthAfter)
            XCTAssertFalse(testTask.done, "Newly created task is already done!")
            cell.delegate = TestDelegate(updatedExpectation: expectation,
                expectedDoneStateAfterToggle: true)
            cell.configureForTask(testTask)
            
            //4
            // Make sure the checkbox has the proper starting value.
            XCTAssertFalse(cell.checkbox.isChecked, "Checkbox checked for not-done task!")
            
            //5
            // Fake a tap on the checkbox by sending the TouchUpInside event which would be called when a user tapped on it.
            cell.checkbox.sendActionsForControlEvents(.TouchUpInside)
            
            //6
            // Make sure everything gets updated – starting with the checkbox by verifying its state has updated, and then wait for the expectation to be fulfilled to make sure the delegate is updated with the new value.
            XCTAssertTrue(cell.checkbox.isChecked, "Checkbox not checked after tap!")
            waitForExpectationsWithTimeout(1, handler: nil)
        } else {
            XCTFail("Test cell was nil!")
        }
        
       
    }
    
    
}
