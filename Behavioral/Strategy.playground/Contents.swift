import UIKit

struct TestSubject {
    let pupilDiameter: Double
    let blushResponse: Double
    let isOrganic: Bool
}

protocol RealnessTesting {
    func test(_ testSubject: TestSubject) -> Bool
}

class TestType1: RealnessTesting {
    func test(_ testSubject: TestSubject) -> Bool {
        return testSubject.pupilDiameter < 30.0 || testSubject.blushResponse == 0.0
    }
}

class TestType2: RealnessTesting {
    func test(_ testSubject: TestSubject) -> Bool {
        return testSubject.isOrganic
    }
}

class BladeRunner {
    var strategy: RealnessTesting
    var testSubject: TestSubject
    
    init(strategy: RealnessTesting, testSubject: TestSubject) {
        self.strategy = strategy
        self.testSubject = testSubject
    }
    
    func isAndroid() -> Bool {
        strategy.test(testSubject)
    }
}

let bladerunner = BladeRunner(
    strategy: TestType1(),
    testSubject: TestSubject(pupilDiameter: 1, blushResponse: 1, isOrganic: false)
)

bladerunner.isAndroid()
