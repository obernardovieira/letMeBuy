//
//  ItemLista.swift
//  letMeBuy
//
//  Created by Bernardo Vieira on 22/12/16.
//  Copyright © 2016 Bernardo Vieira. All rights reserved.
//

import Foundation

class ItemLista: NSObject,NSCoding
{
    var designacao : String
    var marca : String
    var quantidade : Int
    var unidade : String
    var preco : Float
    var observacoes : String
    var selecionado : Bool
    
    init(designacao : String, marca : String, quantidade : Int, unidade : String, preco : Float, observacoes : String)
    {
        self.designacao = designacao
        self.marca = marca
        self.quantidade = quantidade
        self.unidade = unidade
        self.preco = preco
        self.observacoes = observacoes
        self.selecionado = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        let designacao = aDecoder.decodeObject(forKey: "designacao") as? String
        self.designacao = designacao!
        
        let marca = aDecoder.decodeObject(forKey: "marca") as? String
        self.marca = marca!
        
        let quantidade = aDecoder.decodeInteger(forKey: "quantidade")
        self.quantidade = quantidade
        
        let unidade = aDecoder.decodeObject(forKey: "unidade") as? String
        self.unidade = unidade!
        
        let preco = aDecoder.decodeFloat(forKey: "preco")
        self.preco = preco
        
        let observacoes = aDecoder.decodeObject(forKey: "observacoes") as? String
        self.observacoes = observacoes!
        
        let selecionado = aDecoder.decodeBool(forKey: "selecionado")
        self.selecionado = selecionado
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(designacao, forKey: "designacao")
        aCoder.encode(marca, forKey: "marca")
        aCoder.encode(quantidade, forKey: "quantidade")
        aCoder.encode(unidade, forKey: "unidade")
        aCoder.encode(preco, forKey: "preco")
        aCoder.encode(observacoes, forKey: "observacoes")
        aCoder.encode(selecionado, forKey: "selecionado")
    }
}
