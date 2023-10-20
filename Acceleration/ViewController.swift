//
//  ViewController.swift
//  Acceleration
//
//  Created by liucl on 2023/10/20.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var xStr: String = "", yStr: String = "", zStr: String = "";
    @IBAction func btnClick(_ sender: UIButton) {
        if sender.currentTitle == "开始" {
            sender.setTitle("结束", for: .normal)
            manager.accelerometerUpdateInterval = 0.1
            manager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {
                (data, error) in
                let acc = data?.acceleration
                self.xLbl.text = acc?.x.description
                self.yLbl.text = acc?.y.description
                self.zLbl.text = acc?.z.description
                self.xStr = self.xStr.appendingFormat("%@\n", acc?.x.description ?? "0")
                self.yStr = self.yStr.appendingFormat("%@\n", acc?.y.description ?? "0")
                self.zStr = self.zStr.appendingFormat("%@\n", acc?.z.description ?? "0")
                
                print("x = \(acc?.x ?? 0) y = \(acc?.y ?? 0) z = \(acc?.z ?? 0)")
            })
        } else {
            sender.setTitle("开始", for: .normal)
            manager.stopAccelerometerUpdates()
            
            print("x轴 == \(xStr)")
            print("y轴 == \(yStr)")
            print("z轴 == \(zStr)")
        }
        
    }
    
    lazy var manager: CMMotionManager = {
        let man = CMMotionManager()
        
        return man
    }()

}

