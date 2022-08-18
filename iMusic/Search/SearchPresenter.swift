//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Danya Kukhar on 17.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
      
      switch response {
      case .some:
          print("presentor .some")
      case .presentTracks:
          print("presentor .presentTracks")
          viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
      }
  }
  
}
