import Foundation

extension ProcessInfo {
    
    public var uptime: TimeInterval {
        return Date().timeIntervalSince(startTime)
    }
    
    public var startTime: Date {
        return processStartTime(for: processIdentifier)
    }
}

public func processStartTime(for pid: Int32) -> Date {
    var mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, pid]
    var proc = kinfo_proc()
    var size = MemoryLayout.size(ofValue: proc)
    mib.withUnsafeMutableBufferPointer { p in
        _ = sysctl(p.baseAddress, 4, &proc, &size, nil, 0)
    }
    
    let time = proc.kp_proc.p_starttime
    let seconds = Double(time.tv_sec) + Double(time.tv_usec) / Double(NSEC_PER_SEC)
    
    return Date(timeIntervalSince1970: seconds)
}
