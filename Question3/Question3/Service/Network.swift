//
//  Network.swift
//  Question3
//
//  Created by Tarik Efe on 19.11.2022.
//

import Foundation

class Network {
    
    enum Endpoint {
        static let base = "https://programming-quotes-api.herokuapp.com"
        case quotesRandom
        var stringValue: String {
            switch self {
            case .quotesRandom:
                return Endpoint.base + "/Quotes/random"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    @discardableResult
    class func taskForGetRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
    class func getRandomQuotes(completion: @escaping (QuotesModel?, Error?) -> Void) {
        taskForGetRequest(url: Endpoint.quotesRandom.url, responseType: QuotesModel.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}

