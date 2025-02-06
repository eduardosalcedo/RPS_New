import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var appSignLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(state: .start)
    }

    
    func updateUI(state: GameState) {
        statusLabel.text = state.status
        
        switch state {
            case .start:
                view.backgroundColor = .gray
                
                appSignLabel.text = "🤖"
                playAgainButton.isHidden = true
                
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
                
                rockButton.isEnabled = true
                paperButton.isEnabled = true
                scissorsButton.isEnabled = true
                
            case .win:
                view.backgroundColor = .green
            case .lose:
                view.backgroundColor = .red
            case .draw:
                view.backgroundColor = .lightGray
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.compare(computerSign)
        updateUI(state: gameState)
        
        appSignLabel.text = computerSign.emoji
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        playAgainButton.isHidden = false
        
        switch userSign {
            case .rock:
                rockButton.isHidden = false
            case .paper:
                paperButton.isHidden = false
            case .scissors:
                scissorsButton.isHidden = false
        }
        
        
    }
    
    @IBAction func rockSelected(_ sender: UIButton) {
        play(userSign: .rock)
    }
    
    @IBAction func paperSelected(_ sender: UIButton) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsSelected(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    
    @IBAction func playAgainSelected(_ sender: UIButton) {
        updateUI(state: .start)
    }
    
}

