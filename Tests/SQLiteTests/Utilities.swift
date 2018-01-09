import Async
import Service
import Dispatch
import XCTest
@testable import SQLite

extension SQLiteConnection {
    static func makeTestConnection(queue: DispatchEventLoop) -> SQLiteConnection? {
        do {
            let sqlite = SQLiteDatabase(storage: .memory)
            return try sqlite.makeConnection(on: queue).blockingAwait()
        } catch {
            XCTFail()
        }
        return nil
    }
}
