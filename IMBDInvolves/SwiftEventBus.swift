//
//  SwiftEventBus.swift
//  IMDBInvolves
//
//  https://github.com/cesarferreira/SwiftEventBus
//  Created by Cesar Ferreira on 25/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class SwiftEventBus {
    
    struct Static {
        static let instance = SwiftEventBus()
        static let queue = DispatchQueue(label: Bundle.main.bundleIdentifier!, attributes: [])
    }
    
    struct NamedObserver {
        let observer: NSObjectProtocol
        let name: String
    }
    
    var cache = [UInt: [NamedObserver]]()
    
    ////////////////////////////////////
    // Publish
    ////////////////////////////////////
    
    static func post(_ name: String, sender: Any? = nil) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender)
    }
    
    static func post(_ name: String, sender: NSObject?) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender)
    }
    
    static func post(_ name: String, sender: Any? = nil, userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender, userInfo: userInfo)
    }
    
    static func postToMainThread(_ name: String, sender: Any? = nil) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender)
        }
    }
    
    static func postToMainThread(_ name: String, sender: NSObject?) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender)
        }
    }
    
    static func postToMainThread(_ name: String, sender: Any? = nil, userInfo: [AnyHashable: Any]?) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: sender, userInfo: userInfo)
        }
    }
    
    ////////////////////////////////////
    // Subscribe
    ////////////////////////////////////
    @discardableResult
    static func on(
        _ target: AnyObject,
        name: String,
        sender: Any? = nil,
        queue: OperationQueue?,
        handler: @escaping ((Notification!) -> Void)
        ) -> NSObjectProtocol {
        let id = UInt(bitPattern: ObjectIdentifier(target))
        let observer = NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: name),
            object: sender,
            queue: queue,
            using: handler
        )
        let namedObserver = NamedObserver(observer: observer, name: name)
        
        Static.queue.sync {
            if let namedObservers = Static.instance.cache[id] {
                Static.instance.cache[id] = namedObservers + [namedObserver]
            } else {
                Static.instance.cache[id] = [namedObserver]
            }
        }
        
        return observer
    }
    
    @discardableResult
    static func onMainThread(
        _ target: AnyObject,
        name: String,
        sender: Any? = nil,
        handler: @escaping ((Notification!) -> Void)
        ) -> NSObjectProtocol {
        return SwiftEventBus.on(target, name: name, sender: sender, queue: OperationQueue.main, handler: handler)
    }
    
    @discardableResult
    static func onBackgroundThread(
        _ target: AnyObject,
        name: String,
        sender: Any? = nil,
        handler: @escaping ((Notification!) -> Void)
        ) -> NSObjectProtocol {
        return SwiftEventBus.on(target, name: name, sender: sender, queue: OperationQueue(), handler: handler)
    }
    
    ////////////////////////////////////
    // Unregister
    ////////////////////////////////////
    static func unregister(_ target: AnyObject) {
        let id = UInt(bitPattern: ObjectIdentifier(target))
        let center = NotificationCenter.default
        
        Static.queue.sync {
            if let namedObservers = Static.instance.cache.removeValue(forKey: id) {
                for namedObserver in namedObservers {
                    center.removeObserver(namedObserver.observer)
                }
            }
        }
    }
    
    static func unregister(_ target: AnyObject, name: String) {
        let id = UInt(bitPattern: ObjectIdentifier(target))
        let center = NotificationCenter.default
        
        Static.queue.sync {
            if let namedObservers = Static.instance.cache[id] {
                Static.instance.cache[id] = namedObservers.filter({ (namedObserver: NamedObserver) -> Bool in
                    if namedObserver.name == name {
                        center.removeObserver(namedObserver.observer)
                        return false
                    } else {
                        return true
                    }
                })
            }
        }
    }
}
