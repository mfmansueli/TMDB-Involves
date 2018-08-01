//
//  Logger.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case error = "‼️ ERROR"
    case info = "ℹ️ INFO"
    case debug = "💬 DEBUG"
    case verbose = "🔬 VERBOSE"
    case warning = "⚠️ WARNING"
    case severe = "🔥 SEVERE"
}

final class Logger {
    static var dateFormat = "dd-MM-yyyy hh:mm:ss"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    class func log(
        _ message: String,
        event: LogEvent,
        fileName: String = #file,
        line: Int = #line,
        funcName: String = #function
        ) {
        #if DEBUG
            // swiftlint:disable:next line_length
            print("\(Date().toString()) \(event.rawValue) [\(sourceFileName(filePath: fileName))]:\(line) \(funcName) -> \(message)")
        #endif
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.last ?? ""
    }
}

private extension Date {
    func toString() -> String {
        return Logger.dateFormatter.string(from: self)
    }
}
