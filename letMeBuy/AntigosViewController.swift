//
//  AntigosViewController.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 25/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import UIKit

class AntigosViewController: UITableViewController {

    var listas : [ListaCompra] = [ListaCompra]()
    var ultimaLista : Int = 0
    var ultimoItem : Int = -1
    
    func getDocumentsFilename(filename : String) -> String {
        let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask ).first!
        let filepath = DocumentsDirectory.appendingPathComponent(filename)
        return filepath.path
    }
    
    func onLerSerializacao()
    {
        var nomefichserial = ""
        nomefichserial = getDocumentsFilename(filename: "meufich.dat")
        let tab = NSKeyedUnarchiver.unarchiveObject(withFile: nomefichserial) as? [ListaCompra]
        
        if tab == nil
        {
            print("Erro a ler")
        }
        else
        {
            print("Li \(tab!.count) pessoas")
        }
        listas = tab ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        onLerSerializacao()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var total = 0
        for lista in listas
        {
            total = total + lista.itens.count
        }
        return total
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "antigoItemLista", for: indexPath)
        
        // Configure the cell...
        
        if ultimoItem+1 == listas[ultimaLista].itens.count
        {
            ultimaLista = ultimaLista + 1
            ultimoItem = 0
        }
        else
        {
            ultimoItem = ultimoItem + 1
        }
        
        if ultimaLista % 2 == 0
        {
            cell.backgroundColor = UIColor.cyan
        }
        else
        {
            cell.backgroundColor = UIColor.white
        }
        cell.textLabel?.text = listas[ultimaLista].nome
        cell.detailTextLabel?.text = listas[ultimaLista].itens[ultimoItem].designacao
        
        //let row = indexPath.row
        //cell.textLabel?.text = listas[row].nome
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
