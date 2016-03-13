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
  
  init(dataSource: JSON?){
    self.dataSource = dataSource
  }
  
  //看看能不能将类转化为参数传入，让它在basemodel中直接转化为子类
  static func all(sourceUrl: String?, modelName: String, callback: ([JSON])->()){
    Alamofire.request(.GET, sourceUrl!).response{ request, response, data, error in
      callback(JSON(data: data!)[modelName].array!)
    }
  }
  
  subscript(attrName: String) -> Any?{
    get {
      if let modelArray = dataSource?[attrName].array{
        //当是一对多的时候返回数组
        return modelArray
      } else if let column = dataSource?[attrName].string{
        //当是一个属性的时候返回一个数组
        return column
      }else if let model = dataSource?[attrName]{
        //当是一对一的时候返回一个JSON对象
        return model
      }
      return nil
    }
  }
  
}
