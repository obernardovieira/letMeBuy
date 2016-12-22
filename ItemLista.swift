//
//  ItemLista.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import Foundation

class ItemLista
{
    var designacao : String
    var marca : String
    var quantidade : Int
    var unidade : Int
    var preco : Float
    var observacoes : String
    
    init(designacao : String, marca : String, quantidade : Int, unidade : Int, preco : Float, observacoes : String)
    {
        self.designacao = designacao
        self.marca = marca
        self.quantidade = quantidade
        self.unidade = unidade
        self.preco = preco
        self.observacoes = observacoes
    }
    
    convenience init(designacao : String, quantidade : Int, unidade : Int, observacoes : String)
    {
        self.init(designacao : designacao, marca : "", quantidade : quantidade, unidade : unidade, preco : 0.0, observacoes : observacoes)
    }
}
