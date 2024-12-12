//
//  APIManager.swift
//
//  Copyright © 2023 Sk Azad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//import PKHUD


/*
struct APIManager
{
    
    let loggedinUser = UserModel(from: JSON())
    var finalHeader = HTTPHeaders()
    
    static func post(urlString strUrl: String, withParams params:[String:Any]? = nil, andHeaders header:[String:Any]? = nil, method: HTTPMethod = .post, onCompletion: @escaping (_ responseModel: ResponseModel , _ status_code : Int) -> Void)
    {
        let headerTemp = getHttpHeader(headers: header)
        
        AF.request(URL(string: strUrl)!, method: method, parameters: params, encoding: URLEncoding.default, headers: headerTemp).responseJSON
            { (response) in
                
                self.handleResponse_Temp(response: response) { responseModel in
                    let status_code = response.response?.statusCode ?? 0
                    onCompletion(responseModel , status_code)
                }
            }
    }
    
    static func callWith(method: HTTPMethod = .post, urlString strUrl: String, withParams params:[String:Any]? = nil, onCompletion: @escaping (_ respM: ResponseModel) -> Void)
    {
        let headerTemp: HTTPHeaders = getHttpHeader()
        if loggedinUser.access_token.count == 0 {
          //  headerTemp = HTTPHeaders()
        }
        finalHeader = headerTemp
        AF.request(strUrl, method: method, parameters: params, encoding: JSONEncoding.default, headers: headerTemp)
            .validate()
            .responseData { response in
                print(response)
                self.handleResponse(response: response, urlString: strUrl, onCompletion: onCompletion)
            }
    }
    
    static func postMultipartData(urlString strUrl: String, withParams params: [String: Any]? = nil, imageFile image: UIImage, strImageName: String  , onCompletion: @escaping (_ respM: ResponseModel) -> Void) {
        var headerTemp: HTTPHeaders = getHttpHeader()
        if loggedinUser.access_token.count > 0 {
            headerTemp = HTTPHeaders()
        }
        finalHeader = headerTemp 
        AF.upload(multipartFormData: { multipartFormData in
            if let imageData = image.jpegData(compressionQuality: 0.4) {
                multipartFormData.append(imageData, withName: strImageName, fileName: "\(strImageName).jpeg", mimeType: "image/png")
            }
            
            if let params = params {
                for (key, value) in params {
                    multipartFormData.append(Data("\(value)".utf8), withName: key)
                }
            }
        }, to: strUrl, method: .post, headers:  getHttpHeader())
        .validate()
        .responseData { response in
            self.handleResponse(response: response, urlString: strUrl, onCompletion: onCompletion)
        }
    }
    
    static func putMultipartDataWithMultipleImage(urlString strUrl: String, withParams params:[String:Any]? = nil, imageFiles arrImages: [UIImage], arrImageNames: [String], onCompletion: @escaping (_ responseModel: ResponseModel) -> Void)
        {
            
            AF.upload(multipartFormData: { multipartFormData in
                if arrImages.count>0 {
                    for index in 0...(arrImages.count - 1)
                    {
                        let strName = arrImageNames[index]
                        let image = arrImages[index]
                        let strFileName = strName.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                        
                        if let imageData = image.jpegData(compressionQuality: 0.4) {
                            multipartFormData.append(imageData, withName: strName, fileName: "\(strFileName).jpeg", mimeType: "image/png")
                        }
                    }
                }
                if params != nil
                {
                    for (key, value) in params! {
                        multipartFormData.append(Data("\(value)".utf8), withName: key)
                    }
                }
            }, to: URL(string: strUrl)!, method: .post  , headers: getHttpHeader())
            .validate()
            .responseData { response in
                self.handleResponse(response: response , urlString: strUrl , onCompletion: onCompletion)
            }
        }
    
    static func postMultipartDataWithMultipleImage(urlString strUrl: String, withParams params:[String:Any]? = nil, imageFiles arrImages: [UIImage], arrImageNames: [String], onCompletion: @escaping (_ respM: ResponseModel) -> Void)
    {
       
        AF.upload(multipartFormData: { multipartFormData in
            for index in 0...(arrImages.count - 1)
            {
                let strName = arrImageNames[index]
                let image = arrImages[index]
                let strFileName = strName.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                
                if let imageData = image.jpegData(compressionQuality: 1) {
                    multipartFormData.append(imageData, withName: strName, fileName: "\(strFileName).jpeg", mimeType: "image/png")
                }
            }
            
            if params != nil
            {
                for (key, value) in params! {
                    multipartFormData.append(Data("\(value)".utf8), withName: key)
                }
            }
        } , to: URL(string: strUrl)!, method: .post, headers: getHttpHeader())
        .validate()
        .responseData { response in
            self.handleResponse(response: response, urlString: strUrl, onCompletion: onCompletion)
        }
    }
    
    static func postMultipartWithMultipleData(urlString strUrl: String, withParams params:[String:Any]? = nil, datas arrDatas: [Data], names arrNames: [String], mimeTypes arrMimes: [String], onCompletion: @escaping (_ respM: ResponseModel) -> Void)
    {
        var headerTemp: HTTPHeaders = [.authorization(bearerToken: loggedinUser.access_token)]
        if loggedinUser.access_token.count > 0 {
            headerTemp = HTTPHeaders()
        }
        finalHeader = headerTemp
        AF.upload(multipartFormData: { multipartFormData in
            for index in 0..<arrNames.count
            {
                let strName = arrNames[index]
                let data = arrDatas[index]
                let mime = arrMimes[index]
                let arr = mime.components(separatedBy: "/")
                let strFileName = strName.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                multipartFormData.append(data, withName: strName, fileName: "\(strFileName).\(arr.last ?? "")", mimeType: mime)
            }
            
            for (key, value) in params! {
                multipartFormData.append(Data("\(value)".utf8), withName: key)
            }
        }, to: URL(string: strUrl)!, method: .post, headers: headerTemp)
        .validate()
        .responseData { response in
            self.handleResponse(response: response, urlString: strUrl, onCompletion: onCompletion)
        }
    }
    
    static private func handleResponse(response: AFDataResponse<Data>, urlString: String, onCompletion: @escaping (_ respM: ResponseModel) -> Void) {
        let responseModel = ResponseModel()
        
        switch response.result {
        case .success(let data):
            do {
                let json = try JSON(data: data)
                responseModel.completeJsonResp = json
                responseModel.rawData = data
                
                responseModel.intResCode = json["status"].intValue
                responseModel.strResMsg = json["message"].stringValue
                responseModel.strAuth = json["auth"].stringValue
                
                responseModel.jsonResp = json["data"]
            } catch {
                print("Error parsing JSON response: \(error)")
            }
            
            responseModel.isSuccess = responseModel.intResCode == 1
        
        case .failure(let error):
            var message = error.localizedDescription
            
            print("Error message \(message)")
            if let httpStatusCode = response.response?.statusCode {
                message = "\("Error code"): \(httpStatusCode)"
            }
            responseModel.strResMsg = message
            print("APIManager failure block: \(message)")
        }
        
        print("\nHeader content:\n", response.request?.allHTTPHeaderFields ?? "")
//        let formattedDate = Date().toString(format: "dd/MMM/yyyy HH:mm:ss") ?? ""
        print("Requested url:\n\(urlString)") //\n@ -> \(formattedDate)
        
        if responseModel.strAuth == "Failed" {
            print("Auth failure and logged out")
        }
        if responseModel.strResMsg.lowercased().contains("urlsessiontask") {
            responseModel.strResMsg = "Please check your internet connection."
        }
        print("APIManager complete response:\n\(responseModel.completeJsonResp)")
        onCompletion(responseModel)
    }

    
    static private func getHttpHeader(headers: [String: Any]? = nil) -> HTTPHeaders {
        var headerTemp = HTTPHeaders()
        
        // Taking the header here as it's mandatory for all API except Registration/Login/Forgot Pass/OTP
        let headerOne = getHeader()
        
        for (key, value) in headerOne {
            let header = HTTPHeader(name: key, value: value)
            headerTemp.add(header)
        }
        
        if let headers = headers {
            for (key, value) in headers {
                if let stringValue = value as? String {
                    let header = HTTPHeader(name: key, value: stringValue)
                    headerTemp.add(header)
                }
            }
        }
        print(headerTemp.description) 
        return headerTemp
    }
    
    //MARK: - Handle the response and parse in ResponseModel before sending through block to the target controller
    static func handleResponse_Temp(response: AFDataResponse<Any>, onCompletion: @escaping (_ responseModel: ResponseModel) -> Void)
    {
        let responseM = ResponseModel.init()
        do {
            let json = try JSON(data: response.data ?? Data())
            responseM.completeJsonResp = json
            responseM.rawData = response.data!
            responseM.intResCode = response.response?.statusCode ?? 0
            responseM.strResMsg = json["message"].stringValue
//                responseM.strAuth = json["auth"].stringValue
            responseM.isSuccess = json["success"].boolValue
            responseM.jsonResp = json["data"]
            responseM.intResCode = responseM.isSuccess ? 1 : 0
        } catch  {
        }
        onCompletion(responseM)
    }
}

func getHeader() -> [String : String]
{
    let dict = [ "sdk-key" : "sk_test_UdHpsvSHaenCvmr6J7GomerDP9oCAFmqRaQ4Ycno_1",
                 "Authorization" : "Bearer \(loggedinUser.access_token)"
    ]
    
    return dict
}

func showHud(_ strMsg: String = "")
{
   // HUD.show(HUDContentType.systemActivity)
}

func hideHud()
{
  //  HUD.hide(animated: true)
}
*/
