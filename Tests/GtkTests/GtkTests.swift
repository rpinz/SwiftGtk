import CGtk
@testable import Gtk
import XCTest

class GtkTests: XCTestCase {
    func testMajorVersion() { XCTAssertEqual(getMajorVersion(), gtk_get_major_version()) }
    func testMinorVersion() { XCTAssertEqual(getMinorVersion(), gtk_get_minor_version()) }
    func testMicroVersion() { XCTAssertEqual(getMicroVersion(), gtk_get_micro_version()) }
    func testInterfaceAge() { XCTAssertEqual(getInterfaceAge(), gtk_get_interface_age()) }
    func testBinaryAge() { XCTAssertEqual(getBinaryAge(), gtk_get_binary_age()) }

    /// test that we can run and quit an app
    func testApp() {
        let application: Application! = Application()
        XCTAssertNotNil(application)
        var appWasRunning = false
        var appDidStart = false
        let status = application.run(startupHandler: { _ in
            XCTAssertFalse(appDidStart)
            appDidStart = true
            XCTAssertFalse(appWasRunning)
        }, activationHandler: { app in
            appWasRunning = true
            app.quit()
        })
        XCTAssertEqual(status, 0)
        XCTAssertTrue(appWasRunning)
    }

    /// text text buffers
    func testTextBuffer() {
        guard var buffer = TextBuffer() else { XCTFail() ; return }
        let text = "Hello, world!\n"
        buffer.text = text
        XCTAssertEqual(buffer.text, text)
    }
}

extension GtkTests {
    static var allTests: [(String, (GtkTests) -> () throws -> Void)] {
        return [
            ("testApp", testApp),
            ("testTextBuffer", testTextBuffer),
            ("testMajorVersion", testMajorVersion),
            ("testMinorVersion", testMinorVersion),
            ("testMicroVersion", testMicroVersion),
            ("testInterfaceAge", testInterfaceAge),
            ("testBinaryAge", testBinaryAge)
        ]
    }
}
