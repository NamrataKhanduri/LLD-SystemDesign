//
//  ViewController.swift
//  LLD
//
//  Created by Khanduri, Namrata on 31/10/25.
//

import UIKit

class ViewController: UIViewController {
    let game = TicTacToeGameEngine()
    @IBOutlet var buttonArray: [UIButton]!

    @IBAction func buttonClick(_ button: UIButton) {
        var player: Player?
        switch button.tag {
        case 1: player = makeMove(Move(0,0))
            
        case 2: player = makeMove(Move(0,1))
        case 3: player = makeMove(Move(0,2))
        case 4: player = makeMove(Move(1,0))
        case 5: player = makeMove(Move(1,1))
        case 6: player = makeMove(Move(1,2))
        case 7: player = makeMove(Move(2,0))
        case 8: player = makeMove(Move(2,1))
        case 9: player = makeMove(Move(2,2))
        default: break
        }
        if let player {
            button.setTitle(player.symbol.symbol, for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playGame()
    }

    func playGame() {
        
        let player1 = Player(name: "namrata")
        try? game.setPlayers(player1)
        let player2 = Player(name: "harjot")
        try? game.setPlayers(player2)
        try? game.start()
        
    }
    
    func makeMove(_ move: Move) -> Player? {
        do {
            let player = try game.makeMove(move)
            switch game.state {
            case .finished(let winner): alert(ms: "Player Won: \(winner.name)")
            case .draw: alert(ms: "It's a Tie")
            default: break
            }
            return player
        } catch let error as GameError {
            alert(ms: error.description)
        } catch {
            
        }
        return nil
    }
    
    func alert(ms: String) {
        let alert = UIAlertController(title: "Oops!", message: ms, preferredStyle: .alert)
        let oka = UIAlertAction(title: "ok", style: .default)
        let reset = UIAlertAction(title: "reset", style: .default) { _ in
            self.restart()
        }
        alert.addAction(oka)
        alert.addAction(reset)
        present(alert, animated: true)
    }
    
    func restart() {
        self.game.reset()
        self.buttonArray.forEach { $0.setTitle("", for: .normal) }
        playGame()
    }

}

