//
//  OrdemViewController.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 26/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import UIKit

class OrdemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerOrdem: UIPickerView!
    
    var pickerData: [String] = [String]()
    var base: TabelaViewController?
    var selectIndex: Int = 0
    
    @IBAction func onSave(_ sender: Any) {
        
        base?.alterarOrdem(ordem: selectIndex)
        
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Connect data:
        self.pickerOrdem.delegate = self
        self.pickerOrdem.dataSource = self
        
        // Input data into the Array:
        pickerData = ["nome", "marca"]
        
        self.pickerOrdem.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectIndex = row
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
