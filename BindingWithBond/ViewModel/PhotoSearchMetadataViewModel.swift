//
//  PhotoSearchMetadataViewModel.swift
//  BindingWithBond
//
//  Created by Colin Eberhardt on 10/12/2015.
//  Copyright © 2015 Razeware. All rights reserved.
//

import Foundation
import ReactiveKit

class PhotoSearchMetadataViewModel {
  
  let creativeCommons = Property<Bool>(false)
  let dateFilter = Property<Bool>(false)
  
  let minUploadDate = Property<NSDate>(NSDate())
  let maxUploadDate = Property<NSDate>(NSDate())
  
  init() {
    maxUploadDate.observeNext { [unowned self] maxDate in
      if maxDate.timeIntervalSinceDate(self.minUploadDate.value) < 0 {
        self.minUploadDate.value = maxDate
      }
    }
    
    minUploadDate.observeNext { [unowned self] minDate in
      if minDate.timeIntervalSinceDate(self.maxUploadDate.value) > 0 {
        self.maxUploadDate.value = minDate
      }
    }
  }
  
}
