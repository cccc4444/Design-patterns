import UIKit

//The abstract factory pattern is used to provide a client with a set of related or dependant objects. The "family" of objects created by the factory are determined at run-time.

protocol BurgerDescribing {
    var ingredients: [String] { get }
}

protocol BurgerMaking {
    func make() -> BurgerDescribing
}

struct Burger: BurgerDescribing {
    var ingredients: [String]
}

class BigMac: BurgerMaking {
    func make() -> BurgerDescribing {
        return Burger(ingredients: ["bread"])
    }
}

class ChicFilla: BurgerMaking {
    func make() -> BurgerDescribing {
        return Burger(ingredients: ["tomato, bread"])
    }
}

enum BurgerFactory: BurgerMaking {
    case bigmac
    case chicFilla
    
    func make() -> BurgerDescribing {
        switch self {
        case .bigmac:
            return BigMac().make()
        case .chicFilla:
            return ChicFilla().make()
        }
    }
}

let bigMac = BurgerFactory.bigmac.make()
