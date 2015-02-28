//
//  ViewController.swift
//  SWoolenCount
//
//  Created by Jidong Liu on 15/2/26.
//  Copyright (c) 2015年 Hollo.cn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var btnOK:UIButton?
    
    @IBOutlet var edtEast:UITextField?
    @IBOutlet var edtSouth:UITextField?
    @IBOutlet var edtWest:UITextField?
    @IBOutlet var edtNorth:UITextField?
    
    @IBOutlet var sgcEast:UISegmentedControl?
    @IBOutlet var sgcSouth:UISegmentedControl?
    @IBOutlet var sgcWest:UISegmentedControl?
    @IBOutlet var sgcNorth:UISegmentedControl?
    
    var deal =  WCDeal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateCount(){
        let eastRaw:Int? = edtEast?.text.toInt()
        var eastCount=0
        if((eastRaw) != nil)
        {
            eastCount = ((sgcEast?.selectedSegmentIndex)!*(-2)+1)*(eastRaw)!
        }
        deal.count["east"] = eastCount
        
        let westRaw:Int? = edtWest?.text?.toInt()
        var westCount = 0
        if((westRaw) != nil)
        {
            westCount = ((sgcWest?.selectedSegmentIndex)!*(-2)+1)*(westRaw)!
        }
        deal.count["west"] = westCount
        
        let southRaw:Int? = edtSouth?.text?.toInt()
        var southCount = 0
        if((southRaw) != nil){
            southCount = ((sgcSouth?.selectedSegmentIndex)!*(-2)+1)*(edtSouth?.text?.toInt())!
        }
        deal.count["south"] = southCount
        
        
        
        let northRaw:Int? = edtNorth?.text?.toInt()
        var northCount = 0
        if((northRaw) != nil){
            northCount = ((sgcNorth?.selectedSegmentIndex)!*(-2)+1)*(northRaw)!
        }
        deal.count["north"] = northCount
    }
    
    
    func checkShow()->Bool{

        updateCount()
        return deal.balance()  == 0
        
    }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let players = appDelegate.currentPlayers;
    }
    
    @IBAction func viewPressed(sender: AnyObject){
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func valueChanged(sender:AnyObject){
        if (sender is UITextField)
        {
          println( "text change: \((sender as UITextField).text)")
        }
        else
        {
          println ("change value: \(sender.selectedSegmentIndex) oooo?")
        }
        
        var isCompleted:Bool = checkShow()
        if(isCompleted)
        {
            btnOK?.hidden = false
        }
        else
        {
            btnOK?.hidden = true
        }
        println("canshow:\(isCompleted)")
        
    }
    

    
    
    
}



