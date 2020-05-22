//
// Created by 舘佳紀 on 2020/05/18.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    let appID = "a6a8f8325d8cfe3bd703db817d1a07cba86c76e7bcd4d6cbf906bafaa88bc61e"
    var postHiragana : String = ""
    var outputType = "hiragana"
    private var url: String = "https://labs.goo.ne.jp/api/hiragana"
    private var hiragana : HiraganaData?


    func postData() {
        let params : [String: String] = ["app_id": appID, "sentence": postHiragana, "output_type": outputType]
        AF.request(url, method: .post, parameters: params , encoding: JSONEncoding.default, headers: nil)
                .responseJSON
                { (response) in
                    switch response.result {
                            //成功時に実行する内容
                    case .success:
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        //ここでデコードしている
                        guard let hiragana = try? decoder.decode(HiraganaData.self, from: data) else { return }
                        print(hiragana.converted)
                            //エラー処理
                    case let .failure(error):
                        print(error)
                    }
                }
        }
}