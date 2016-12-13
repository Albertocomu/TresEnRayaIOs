import UIKit

class ViewController: UIViewController {
    
    var turno = 1
    var jugadas = 0
    var fila1 = 0
    var fila2 = 0
    var fila3 = 0
    var colum1 = 0
    var colum2 = 0
    var colum3 = 0
    var diago1 = 0
    var diago2 = 0
    var android = 0
    var apple = 0
    
    //IBoulets
    @IBOutlet weak var androidWin: UILabel!
    @IBOutlet weak var appleWin: UILabel!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var casilla1: UIButton!
    @IBOutlet weak var casilla2: UIButton!
    @IBOutlet weak var casilla3: UIButton!
    @IBOutlet weak var casilla4: UIButton!
    @IBOutlet weak var casilla5: UIButton!
    @IBOutlet weak var casilla6: UIButton!
    @IBOutlet weak var casilla7: UIButton!
    @IBOutlet weak var casilla8: UIButton!
    @IBOutlet weak var casilla9: UIButton!
    @IBOutlet weak var reset: UIButton!
    var botoncicos:[UIButton] = []
    
    @IBAction func resetear(_ sender: UIButton) {
        turno = 1
        jugadas = 0
        fila1 = 0
        fila2 = 0
        fila3 = 0
        colum1 = 0
        colum2 = 0
        colum3 = 0
        diago1 = 0
        diago2 = 0
        resultado.isHidden = true
        for item in botoncicos{
            item.setBackgroundImage(nil, for: .normal)
            item.tag = 1
        }
        enableBtn()
    }
    
    @IBAction func boton(_ sender: UIButton) {
        if(sender.tag == 1){
            if(turno == 1){
                sender.tag = 0;
                sender.setBackgroundImage(#imageLiteral(resourceName: "fichaAndroid.jpg"), for: .normal)
                if (sender == casilla1){
                    fila1 += 1
                    colum1 += 1
                    diago1 += 1
                }else if(sender == casilla2){
                    fila1 += 1
                    colum2 += 1
                }else if(sender == casilla3){
                    fila1 += 1
                    colum3 += 1
                    diago2 += 1
                }else if(sender == casilla4){
                    fila2 += 1
                    colum1 += 1
                }else if(sender == casilla5){
                    fila2 += 1
                    colum2 += 1
                    diago1 += 1
                    diago2 += 1
                }else if(sender == casilla6){
                    fila2 += 1
                    colum3 += 1
                }else if(sender == casilla7){
                    fila3 += 1
                    colum1 += 1
                    diago2 += 1
                }else if(sender == casilla8){
                    fila3 += 1
                    colum2 += 1
                }else if(sender == casilla9){
                    fila3 += 1
                    colum3 += 1
                    diago1 += 1
                }
                jugadas += 1
                if(fila1 == 3 || fila2 == 3 || fila3 == 3 || colum1 == 3 || colum2 == 3 || colum3 == 3 || diago1 == 3 || diago2 == 3){
                    resultado.text = "¡Gana Android!"
                    resultado.isHidden = false
                    android += 1
                    androidWin.text = String(android)
                    disableBtn()
                } else if (jugadas == 9){
                    resultado.text = "¡Empate!"
                    resultado.isHidden = false
                    disableBtn()
                }
                turno = 2
            } else{
                sender.tag = 0;
                sender.setBackgroundImage(#imageLiteral(resourceName: "fichaApple.png"), for: .normal)
                if (sender == casilla1){
                    fila1 += 4
                    colum1 += 4
                    diago1 += 4
                }else if(sender == casilla2){
                    fila1 += 4
                    colum2 += 4
                }else if(sender == casilla3){
                    fila1 += 4
                    colum3 += 4
                    diago2 += 4
                }else if(sender == casilla4){
                    fila2 += 4
                    colum1 += 4
                }else if(sender == casilla5){
                    fila2 += 4
                    colum2 += 4
                    diago1 += 4
                    diago2 += 4
                }else if(sender == casilla6){
                    fila2 += 4
                    colum3 += 4
                }else if(sender == casilla7){
                    fila3 += 4
                    colum1 += 4
                    diago2 += 4
                }else if(sender == casilla8){
                    fila3 += 4
                    colum2 += 4
                }else if(sender == casilla9){
                    fila3 += 4
                    colum3 += 4
                    diago1 += 4
                }
                jugadas += 1
                if(fila1 == 12 || fila2 == 12 || fila3 == 12 || colum1 == 12 || colum2 == 12 || colum3 == 12 || diago1 == 12 || diago2 == 12){
                    resultado.text = "¡Gana Apple!"
                    resultado.isHidden = false
                    apple += 1
                    appleWin.text = String(apple)
                    disableBtn()
                } else if (jugadas == 9){
                    resultado.text = "¡Empate!"
                    resultado.isHidden = false
                    disableBtn()
                }
                turno = 1
            }
        }
    }
    
    func disableBtn(){
        for item in botoncicos{
            item.isEnabled = false
        }
    }
    
    func enableBtn(){
        for item in botoncicos{
            item.isEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        botoncicos = [casilla1,casilla2,casilla3,casilla4,casilla5,casilla6,casilla7,casilla8,casilla9]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
