//
//  DetailViewControllerDelegateMock.swift
//  LuluLemonTests
//
//  Created by Apple on 3/7/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
@testable import LuluLemon

class DetailViewControllerDelegateMock: DetailViewControllerDelegate {
   
    private(set) var isDelegateCalled = false
    func addNewItem(addItem: String) {
        isDelegateCalled = true
    }
}
