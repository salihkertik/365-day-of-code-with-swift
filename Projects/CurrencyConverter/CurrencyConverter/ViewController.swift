//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Salih Kertik on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var waveGraphView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        
        // Step One
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=0dbb66d034e603cc711529f6cbfd438d")
        
        let session = URLSession.shared
        //Closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                // Step Two
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                            //ASYNC
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                               // print(rates)
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                    createWaveGraph(for: turkish)
                                }
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                            }
                        }
                        
                    } catch{
                        print("Error")
                    }
                   
                }
            }
        }
        
        task.resume()
        
        func createWaveGraph(for value: Double) {
            let graphHeight: CGFloat = 30.0 // Grafik yüksekliği
            let graphWidth = waveGraphView.frame.width // Grafik genişliği (waveGraphView genişliği)

            // Dalga efekti için CAShapeLayer oluşturulması
            let waveLayer = CAShapeLayer()
            waveLayer.fillColor = UIColor.clear.cgColor
            waveLayer.strokeColor = UIColor.green.cgColor
            waveLayer.lineWidth = 3.0
            
            let wavePath = UIBezierPath()
            wavePath.move(to: CGPoint(x: 0, y: graphHeight))

            // Dalga oluşturma (örnek bir dalga fonksiyonu)
            for x in 0...Int(graphWidth) {
                let y = graphHeight + sin(CGFloat(x) * 0.15) * 10 // Dalga formülüne göre y hesaplaması
                wavePath.addLine(to: CGPoint(x: CGFloat(x), y: y))
            }

            waveLayer.path = wavePath.cgPath
            waveGraphView.layer.addSublayer(waveLayer)
        }

    }
    
}

