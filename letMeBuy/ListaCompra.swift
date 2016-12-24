//
//  ListaCompra.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import Foundation

class ListaCompra: NSObject,NSCoding
{
    var nome : String
    var itens : [ItemLista]
    
    init(nome : String, itens : [ItemLista])
    {
        self.nome = nome
        self.itens = itens
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let nome = aDecoder.decodeObject(forKey: "nome") as? String else {
            return nil
        }
        self.nome = nome
        
        let nbCounter = aDecoder.decodeInteger(forKey: "tamanho")
        self.itens = [ItemLista]()
        
        for _ in 0 ..< nbCounter {
            if let item = aDecoder.decodeObject() as? ItemLista {
                itens.append(item)
            }
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(itens.count, forKey: "tamanho")
        
        for index in 0 ..< itens.count {
            aCoder.encode( itens[ index ] )
        }
    }
    
    func adicionarItem(item : ItemLista)
    {
        self.itens.append(item)
    }
    
    func removerItem()
    {
        //
    }
    
    func editarItem()
    {
        //
    }
}
