//
//  File.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/11/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseModel{
  var attr: [String]?
  
  var dataSource: JSON?
  
  required init(dataSource: JSON?){
    self.dataSource = dataSource
  }
  
  static func findAll<T: BaseModel>(sourceUrl: String?, modelName: String, callback: ([T])->()){
    Alamofire.request(.GET, sourceUrl!).response{ request, response, data, error in
      let Ts = JSON(data: data!)[modelName].array!.map{ ele in
        return T(dataSource: ele)
      }
      callback(Ts)
    }
  }
  
  subscript(attrName: String) -> Any?{
    get {
      if let modelArray = dataSource?[attrName].array{
        //当是一对多的时候返回数组
        return modelArray
      } else if let column = dataSource?[attrName].string{
        //当是一个属性的时候返回一个字符串
        return column
      }else if let model = dataSource?[attrName]{
        //当是一对一的时候返回一个JSON对象
        return model
      }
      return nil
    }
  }
  
}
