//
//  ConsoleLogger.swift
//  MacSystemConsoleLogger
//

import Foundation
import os.log

internal class MacSystemConsoleLogger: GenericLogger {
    private let log: OSLog = {
        let subsystem = Bundle.main.bundleIdentifier ?? "TestTaskUltiself"
        let category = String(describing: MacSystemConsoleLogger.self)
        return OSLog(subsystem: subsystem, category: category)
    }()
    
    func log(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    func logDebug(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    func logInfo(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    func logWarning(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    func logError(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    func logFatal(_ value: Any) -> Void {
        printToConsole(value)
    }
    
    private func printToConsole(_ value: Any) -> Void {
        if let val = value as? CVarArg {
            if #available(iOS 12.0, *) {
                os_log(.info, log: log, "%{public}@", val)
            } else {
                os_log("%{public}@", log: log, type: .info, val)
            }
        }
    }
}
