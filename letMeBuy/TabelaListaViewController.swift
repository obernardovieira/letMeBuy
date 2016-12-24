//
//  TabelaListaViewController.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import UIKit

class TabelaListaViewController: UITableViewController {

    var listaItens : [ItemLista] = []
    
    var base: TabelaViewController?
    var lista_original: ListaCompra?
    
    func adicionarItem(item : ItemLista)
    {
        listaItens.append(item)
        tableView.reloadData()
        print("N de itens \(listaItens.count)")
    }
    
    @IBAction func onSave(_ sender: Any)
    {
        if lista_original != nil
        {
            let lista_atualizada = ListaCompra(nome : navigationItem.title!, itens : listaItens)
            base?.atualizarLista(lista_original: lista_original!, lista_atualizada: lista_atualizada)
            navigationController!.popViewController(animated: true)
        }
        else
        {
            let nova_lista = ListaCompra(nome : navigationItem.title!, itens : listaItens)
            base?.adicionarLista(lista: nova_lista)
            navigationController!.popViewController(animated: true)
    
        }
    }
    
    @IBAction func onEdit(_ sender: Any)
    {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*let newItem = ItemLista(designacao : "Carne", marca : "Cara", quantidade : 1, unidade : 1, preco : 5.0, observacoes : "Barato")
        adicionarItem(item: newItem)
        let newItem2 = ItemLista(designacao : "CarneBoi", marca : "Barata", quantidade : 10, unidade : 1, preco : 15.0, observacoes : "Nem")
        adicionarItem(item: newItem2)*/
        
        if lista_original != nil
        {
            listaItens = (lista_original?.itens)!
            navigationItem.title = lista_original?.nome
            tableView.reloadData()
        }
        
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
        return listaItens.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "linhaItem", for: indexPath)
        
        // Configure the cell...
        
        let row = indexPath.row
        
        cell.textLabel?.text = listaItens[row].designacao
        cell.detailTextLabel?.text = "\(listaItens[row].preco)"

        return cell
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
            listaItens.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let row1 = fromIndexPath.row
        let row2 = to.row
        
        let temp = listaItens[row1]
        listaItens[row1] = listaItens[row2]
        listaItens[row2] = temp
        
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
        
        if(segue.identifier == "segueItem")
        {
            let vc = segue.destination as! ViewController
            vc.base = self
        }
        
        if(segue.identifier == "segueNomeLista")
        {
            let vc = segue.destination as! EditNovaListaViewController
            vc.base = self
        }
    }
 

}
