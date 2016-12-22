//
//  ListaCompra.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import Foundation

class ListaCompra
{
    var nome : String
    var itens : [ItemLista]
    
    init(nome : String)
    {
        self.nome = nome
        self.itens = [ItemLista]()
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
