//
//  ViewController.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 20/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etDesignacao: UITextField!
    @IBOutlet weak var etMarca: UITextField!
    @IBOutlet weak var etQuantidade: UITextField!
    @IBOutlet weak var btUnidade: UIButton!
    @IBOutlet weak var etPreco: UITextField!
    @IBOutlet weak var etObservacoes: UITextField!
    
    var base: TabelaListaViewController?
    var item_original: ItemLista?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func alterarUnidade(unidade : String)
    {
        btUnidade.setTitle(unidade, for: UIControlState.normal)
    }
    
    @IBAction func onSave(_ sender: Any) {
        
        guard let designacao = etDesignacao.text else{ return }
        guard let marca = etMarca.text else{ return }
        guard let quantidade = etQuantidade.text else{ return }
        guard let preco = etPreco.text else{ return }
        guard let observacoes = etObservacoes.text else{ return }
        
        if(designacao.characters.count < 1){
            etDesignacao.becomeFirstResponder()
            return
        }
        
        if(quantidade.characters.count < 1){
            etQuantidade.becomeFirstResponder()
            return
        }
        
        if(observacoes.characters.count < 1){
            etObservacoes.becomeFirstResponder()
            return
        }
        
        if item_original == nil {
            
            let novo_item = ItemLista(designacao : designacao, marca : ((marca.characters.count < 1) ? ("SemMarca") : (marca)), quantidade : Int(quantidade)!, unidade : 1, preco : ((preco.characters.count < 1) ? (0.0) : Float(preco)!), observacoes : observacoes)
            
            base?.adicionarItem(item: novo_item)
            
        } else {
            
            item_original!.designacao = designacao
            
            base?.tableView.reloadData() //devia estar numa funcao a parte para fazer o update
            
        }
        
        navigationController!.popViewController(animated: true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "segueUnidade")
        {
            let vc = segue.destination as! PickerViewController
            vc.base = self
        }
    }}

