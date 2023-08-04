import UIKit

protocol Garden {
    func prepareSoil()
    func prepareSeeds()
    func preparePlants()
    func prepareGarden()
}

extension Garden {
    func prepareGarden() {
        prepareSoil()
        prepareSeeds()
        preparePlants()
    }
}

class RoseGarden: Garden {
    func prepare() {
        prepareGarden()
    }
    
    func prepareSoil() {
        print("prepare soil")
    }
    
    func prepareSeeds() {
        print("prepare seeds")
    }
    
    func preparePlants() {
        print("prepare plants")
    }
}

let roseGarden = RoseGarden()
roseGarden.prepare()
