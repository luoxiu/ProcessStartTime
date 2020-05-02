# ProcessStartTime

## Usage

```swift
let info = ProcessInfo.processInfo
info.startDate // Date: 2020-05-02 10:09:27.549
info.uptime // TimeInterval: 1.5885499715805054

let pid: Int32 = 88852
let startTime = processStartTime(for: 88852) // Date: 2020-05-02 10:10:19.501
```