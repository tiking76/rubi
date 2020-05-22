//
// Created by 舘佳紀 on 2020/05/18.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation
import Alamofire

struct HiraganaData : Codable {
    var converted : String
    let outputType : String
    var requestID : String

    enum CodingKeys: String, CodingKey {
        case converted
        case outputType = "output_type"
        case requestID = "request_id"
    }
}

struct Params: Codable {
    var appID : String
    var requestID : String
    var sentence : String
    var outputType: String

    enum CodingKeys: String, CodingKey {
        case appID = "app_id"
        case requestID = "request_id"
        case sentence
        case outputType = "output_type"
    }
}

class APIClient {
    private(set) var postHiragana : String = ""
    private(set) var params : [String: String]?
    private var url: String = "https://labs.goo.ne.jp/api/hiragana"
    private var hiragana : HiraganaData?

    func createParams() {

    }

    func postData() {
        AF.request(url, method: .post, parameters: params , encoding: JSONEncoding.default)
                .responseJSON
                { (response) in
                    switch response.result {
                            //成功時に実行する内容
                    case .success:
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        //ここでデコードしている
                        guard let hiragana = try? decoder.decode(HiraganaData.self, from: data) else { return }
                        print(hiragana)
                            //エラー処理
                    case let .failure(error):
                        print(error)
                    }
                }
        }
}