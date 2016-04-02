/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/


import Foundation
import UIKit
import ReactiveKit
import DatePickerCell


class SettingsViewController: UITableViewController {
  
  private let rowHeight: CGFloat = 44
  
  @IBOutlet weak var maxPickerCell: DatePickerCell!
  @IBOutlet weak var minPickerCell: DatePickerCell!
  @IBOutlet weak var creativeCommonsSwitch: UISwitch!
  @IBOutlet weak var filterDatesSwitch: UISwitch!
  
  var viewModel: PhotoSearchMetadataViewModel?
  
  @IBAction func doneButtonClicked(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil);
  }
  
  override func viewDidLoad() {
    tableView.estimatedRowHeight = rowHeight
    
    maxPickerCell.leftLabel.text = "Max Date"
    minPickerCell.leftLabel.text = "Min Date"
    
    bindViewModel()
  }
  
  func bindViewModel() {
    guard let viewModel = viewModel else { return }
    
    viewModel.creativeCommons.bindTo(creativeCommonsSwitch.rOn)
    creativeCommonsSwitch.rOn.bindTo(viewModel.creativeCommons)
    
    viewModel.dateFilter.bindTo(filterDatesSwitch.rOn)
    filterDatesSwitch.rOn.bindTo(viewModel.dateFilter)
    
    let opacity = viewModel.dateFilter.map { $0 ? CGFloat(1) : CGFloat(0.5) }
    opacity.bindTo(minPickerCell.leftLabel.rAlpha)
    opacity.bindTo(maxPickerCell.leftLabel.rAlpha)
    opacity.bindTo(minPickerCell.rightLabel.rAlpha)
    opacity.bindTo(maxPickerCell.rightLabel.rAlpha)
    
    bind(viewModel.minUploadDate, picker: minPickerCell)
    bind(viewModel.maxUploadDate, picker: maxPickerCell)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = tableView.cellForRowAtIndexPath(indexPath)
    guard let datePickerCell = cell as? DatePickerCell else {
      return
    }
    datePickerCell.selectedInTableView(tableView)
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let cell = tableView.cellForRowAtIndexPath(indexPath)
    guard let datePickerCell = cell as? DatePickerCell else {
      return rowHeight
    }
    return datePickerCell.datePickerHeight()
  }
  
  // The DatePickerCells don't support direct binding with bindTo as they don't implement
  // the BindableType protocol. This method implements 'manual' two-way binding by
  // observing both the model and the date picker.
  private func bind(modelDate: Observable<NSDate>, picker: DatePickerCell) {
    modelDate.observe { event in
      picker.date = event
    }
    
    picker.datePicker.rDate.observe { event in
      modelDate.value = event
    }
  }
  
}

