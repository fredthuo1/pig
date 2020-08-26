import UIKit
import ObjectLibrary

final class PigViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var activePlayer: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var pointRolledLabel: UILabel!
    @IBOutlet weak var actualPoint: UILabel!
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var holdButton: UIButton!
    
    
    private var pigModel: PigModel!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        pigModel = PigModel(delegate: self)
        view.backgroundColor = UIColor.yellow
        resetButton.backgroundColor = UIColor.red
        rollButton.backgroundColor = UIColor.blue
        holdButton.backgroundColor = UIColor.green
        pointRolledLabel.textColor = UIColor.blue
        header.textColor = UIColor.blue
        player1.textColor = UIColor.blue
        player2.textColor = UIColor.blue
        
        resetButton.layer.cornerRadius = 35
        rollButton.layer.cornerRadius = 50
        holdButton.layer.cornerRadius = 35
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        pigModel.beginNewGame()
        diceImage.image = UIImage(named: "icon")
        player1Score.text = "0"
        player2Score.text = "0"
        actualPoint.text = "0"
    }
    

    
    @IBAction func rollButton(_ sender: UIButton) {
        pigModel.roll()
    }
    
    @IBAction func holdButton(_ sender: UIButton) {
        pigModel.hold()
        diceImage.image = UIImage(named: "icon")
    }
    
}

extension PigViewController: PigModelDelegate   {
    
    func updateUI(die: String) {
        if die == nil {
            diceImage.image = UIImage(named: "icon")
        } else {
            diceImage.image = UIImage(named: die )
        }
    }
    
    
    func willChange(player: Player) {
    }
    
    func update(_ pointsRolled: Int) {
        actualPoint.text = "\(pointsRolled)"
    }
    
    func updateScore(for player: Player) {
        
        if player.name == "Player One" {
            
            player1Score.text = "\(player.totalPoints)"
                        
            diceImage.tintColor = UIColor.red
            
            player1Score.textColor = UIColor.red
            
            actualPoint.textColor = UIColor.red
            
        } else if player.name == "Player Two"  {
            
            player2Score.text = "\(player.totalPoints)"
            
            diceImage.tintColor = UIColor.magenta
            
            player2Score.textColor = UIColor.magenta
            
            actualPoint.textColor = UIColor.magenta
        }
    }
    
    func updateGameLog(text: String) {
        header.text = text
    }
    
    func notifyWinner(alerTitle: String, message: String, actionTitle: String) {
        
        view.backgroundColor = UIColor.darkGray
        
        resetButton.isEnabled = false
        rollButton.isEnabled = false
        holdButton.isEnabled = false

        let alert = UIAlertController(title: alerTitle, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK!", style: .default, handler: {(action) in
            self.pigModel.beginNewGame()
        }))
        
        self.present(alert, animated: true)
        view.backgroundColor = UIColor.yellow
        resetButton.isEnabled = true
        rollButton.isEnabled = true
        holdButton.isEnabled = true
        
    }
        
}
