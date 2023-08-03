import UIKit

//The observer pattern is used to allow an object to publish changes to its state. Other objects subscribe to be immediately notified of any changes.

protocol ObserverProtocol: AnyObject {
    func willChange(name: String, newValue: Any?)
    func didChange(name: String, oldValue: Any?)
}

class TestChambers {
    weak var observer: ObserverProtocol?
    
    private let name = "Some name"
    var numberOfChambers = 0 {
        willSet {
            observer?.willChange(name: name, newValue: newValue)
        }
        didSet {
            observer?.didChange(name: name, oldValue: oldValue)
        }
    }
    
}

class Observer: ObserverProtocol {
    func willChange(name: String, newValue: Any?) {
        if newValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }
    
    func didChange(name: String, oldValue: Any?) {
        if oldValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}

let testChamber = TestChambers()
let observer = Observer()
testChamber.observer = observer

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    testChamber.numberOfChambers += 1
}
