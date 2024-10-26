//
//  DeallocationTracking.swift
//  DocPad
//
//  Created by Abdullah on 08/08/2024.
//

import Foundation

//extension NSObject {
//    static let swizzleDeinit: Void = {
//        let originalSelector = #selector(NSObject.deinit)
//        let swizzledSelector = #selector(swizzled_deinit)
//        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
//              let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else {
//            return
//        }
//
//        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
//
//        if didAddMethod {
//            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod)
//        }
//    }()
//
//    @objc func swizzled_deinit() {
//        print("\(String(describing: self)) is being deallocated")
//        swizzled_deinit() // Call the original deinit
//    }
//}
//class AppInitializer {
//    static let shared = AppInitializer()
//
//    private init() {
//        NSObject.swizzleDeinit
//    }
//}


//class DeallocTracker: NSObject {
//    var onDealloc: (() -> Void)?
//
//    deinit {
//        onDealloc?()
//    }
//}
//
//extension NSObject {
//    func trackDeallocation(callback: @escaping () -> Void) {
//        let tracker = DeallocTracker()
//        tracker.onDealloc = callback
//        objc_setAssociatedObject(self, &AssociatedKeys.tracker, tracker, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
//}
//
//private struct AssociatedKeys {
//    static var tracker = "tracker"
//}
//class MyClass: NSObject {
//    override init() {
//        super.init()
//        self.trackDeallocation {
//            print("\(self) is being deallocated")
//        }
//    }
//}

import Foundation
import ObjectiveC

private var trackerKey: UInt8 = 0

class DeallocTracker: NSObject {
    var onDealloc: (() -> Void)?

    deinit {
        onDealloc?()
    }
}

extension NSObject {
    func trackDeallocation(callback: @escaping () -> Void) {
        // Create a DeallocTracker instance
        let tracker = DeallocTracker()
        tracker.onDealloc = callback
        
        // Associate the DeallocTracker instance with the current object
        objc_setAssociatedObject(self, &trackerKey, tracker, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}


