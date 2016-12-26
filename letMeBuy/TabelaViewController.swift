//
//  TabelaViewController.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import UIKit

class TabelaViewController: UITableViewController {

    var nomefichtxt = ""
    var nomefichserial = ""
    
    var ordemElementos : Int = 0
    var listas : [ListaCompra] = [ListaCompra]()
    
    func onEscreverSerializacao()
    {
        if NSKeyedArchiver.archiveRootObject(listas, toFile: nomefichserial )
        {
            print("Gravado com sucesso")
        }
        else
        {
            print("Erro a gravar")
        }
    }
    
    func onLerSerializacao()
    {
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
    
    func alterarOrdem(ordem : Int)
    {
        ordemElementos = ordem
        
        //do some shit!
        
        tableView.reloadData()
    }
    
    func adicionarLista(lista : ListaCompra)
    {
        listas.append(lista)
        tableView.reloadData()
        onEscreverSerializacao()
        print("N de itens \(listas.count)")
    }
    
    func atualizarLista(lista_original : ListaCompra, lista_atualizada : ListaCompra)
    {
        let index = listas.index(of: lista_original)
        if(index != nil)
        {
            listas.remove(at: index!)
            listas.insert(lista_atualizada, at: index!)
            tableView.reloadData()
            onEscreverSerializacao()
        }
    }
    
    func getDocumentsFilename(filename : String) -> String {
        let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask ).first!
        let filepath = DocumentsDirectory.appendingPathComponent(filename)
        return filepath.path
    }
    
    @IBAction func onEdit(_ sender: Any)
    {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomefichserial = getDocumentsFilename(filename: "meufich.dat")
        
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
        return listas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaTipo", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        
        cell.textLabel?.text = listas[row].nome
        cell.detailTextLabel?.text = "\(listas[row].itens.count)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lista = listas[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "editarLista") as! TabelaListaViewController
        
        vc.lista_original = lista
        vc.base = self
        
        navigationController?.show(vc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let row1 = fromIndexPath.row
        let row2 = to.row
        
        let temp = listas[row1]
        listas[row1] = listas[row2]
        listas[row2] = temp
        
        tableView.reloadData()
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "segueLista")
        {
            let vc = segue.destination as! TabelaListaViewController
            vc.base = self
        }
    }

}
