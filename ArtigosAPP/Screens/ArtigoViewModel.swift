//
//  ArtigoViewModel.swift
//  ArtigosAPP
//
//  Created by Ezequias Santos on 30/11/22.
//

import Foundation
import UIKit

// MARK: - ArtigoViewModelProtocol

protocol ArtigoViewModelProtocol {
    var artigoArray: Observable<[Article]> { get }
}

final class ArtigoViewModel: ArtigoViewModelProtocol {
 
    // MARK: - Properties
    
    var artigoArray: Observable<[Article]>
       
    // MARK: - Initialization
    
    init () {
        self.artigoArray = Observable([])
        self.getArtigo()
    }
    
    // MARK: Helpers
    
    func getArtigo() {
        ArtigoService.sharedInstance.fetchArtigo { apiData in
            
                self.artigoArray.value.append(contentsOf: apiData.articles ?? [])
            
        }
    }
}
