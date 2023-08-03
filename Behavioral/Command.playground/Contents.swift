import UIKit

//The command pattern is used to express a request, including the call to be made and all of its required parameters, in a command object. The command may then be executed immediately or held for later use.
//


protocol DoorCommand {
    func execute() -> String
}

class OpenCommand: DoorCommand {
    private let doors: String
    
    init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
}

class CloseCommand: DoorCommand {
    private let doors: String
    
    init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

class DoorOperations {
    private let openCommand: OpenCommand
    private let closeCommand: CloseCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    
    func close() -> String {
        closeCommand.execute()
    }
    
    func open() -> String {
        openCommand.execute()
    }
}

let doors = "Vault doors"
let doorModule = DoorOperations(doors: doors)

doorModule.open()
doorModule.close()
