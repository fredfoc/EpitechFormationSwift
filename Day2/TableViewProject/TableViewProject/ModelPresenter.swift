//
//  ModelPresenter.swift
//  TableViewProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation
import Alamofire

let jsonStr = """
{
"results": [{
"gender": "male",
"name": {
"title": "mr",
"first": "karl",
"last": "long"
},
"location": {
"street": "9117 dane st",
"city": "cary",
"state": "georgia",
"postcode": 36027,
"coordinates": {
"latitude": "63.2691",
"longitude": "-59.0228"
},
"timezone": {
"offset": "+5:30",
"description": "Bombay, Calcutta, Madras, New Delhi"
}
},
"email": "karl.long@example.com",
"login": {
"uuid": "98be2234-e674-4a83-b78f-0065c9a58f61",
"username": "lazywolf124",
"password": "julie",
"salt": "5yDqPFl7",
"md5": "87ee87f20238c78ae43e7bdc63728250",
"sha1": "73030ae37b0a233b8b723837231035adffae5b4c",
"sha256": "01fb51e813eddb8578f8be86b6c70dcec17389f46f94879040fccfe6edac65a6"
},
"dob": {
"date": "1945-02-22T05:16:39Z",
"age": 73
},
"registered": {
"date": "2008-07-23T01:32:13Z",
"age": 10
},
"phone": "(756)-359-4115",
"cell": "(346)-863-7276",
"id": {
"name": "SSN",
"value": "505-37-5203"
},
"picture": {
"large": "https://randomuser.me/api/portraits/men/35.jpg",
"medium": "https://randomuser.me/api/portraits/med/men/35.jpg",
"thumbnail": "https://randomuser.me/api/portraits/thumb/men/35.jpg"
},
"nat": "US"
}, {
"gender": "female",
"name": {
"title": "miss",
"first": "harper",
"last": "simpson"
},
"location": {
"street": "1492 thornridge cir",
"city": "daly city",
"state": "utah",
"postcode": 21698,
"coordinates": {
"latitude": "-58.3944",
"longitude": "18.9644"
},
"timezone": {
"offset": "-10:00",
"description": "Hawaii"
}
},
"email": "harper.simpson@example.com",
"login": {
"uuid": "56ad96c3-ba90-495c-9314-d86d112d3d23",
"username": "angrypanda151",
"password": "transit",
"salt": "muE1yrtO",
"md5": "1a4cf492f275a9df63eb400f7c1e5040",
"sha1": "82b0c4cfdef4d828639c71d883bcc77d1811cc6c",
"sha256": "6b6b15580f18ebe32001b9220c1dcfb18fd31a20aef08e6ec6ee61ba6a44380c"
},
"dob": {
"date": "1966-04-15T02:40:32Z",
"age": 52
},
"registered": {
"date": "2003-02-21T01:34:45Z",
"age": 15
},
"phone": "(055)-542-8682",
"cell": "(494)-528-8220",
"id": {
"name": "SSN",
"value": "114-73-8455"
},
"picture": {
"large": "https://randomuser.me/api/portraits/women/9.jpg",
"medium": "https://randomuser.me/api/portraits/med/women/9.jpg",
"thumbnail": "https://randomuser.me/api/portraits/thumb/women/9.jpg"
},
"nat": "US"
}, {
"gender": "female",
"name": {
"title": "miss",
"first": "bessie",
"last": "medina"
},
"location": {
"street": "192 woodland st",
"city": "miami",
"state": "minnesota",
"postcode": 97012,
"coordinates": {
"latitude": "-29.4987",
"longitude": "-4.8255"
},
"timezone": {
"offset": "+9:30",
"description": "Adelaide, Darwin"
}
},
"email": "bessie.medina@example.com",
"login": {
"uuid": "d644ae0b-0601-4188-874d-ac37f784ed34",
"username": "bigfrog882",
"password": "mephisto",
"salt": "InYRggG4",
"md5": "5ea43e0fa84e1561376c801369c21f51",
"sha1": "34a43c94b26cc460528b89b3d7bd4ca013dc62ce",
"sha256": "7a2e1137b8ebf486783e3a3f67680675ea3dffbf4c25dc055197b3ec104e9cca"
},
"dob": {
"date": "1979-11-20T19:15:10Z",
"age": 38
},
"registered": {
"date": "2013-05-28T05:08:15Z",
"age": 5
},
"phone": "(353)-465-4722",
"cell": "(756)-152-0504",
"id": {
"name": "SSN",
"value": "062-87-3886"
},
"picture": {
"large": "https://randomuser.me/api/portraits/women/0.jpg",
"medium": "https://randomuser.me/api/portraits/med/women/0.jpg",
"thumbnail": "https://randomuser.me/api/portraits/thumb/women/0.jpg"
},
"nat": "US"
}, {
"gender": "female",
"name": {
"title": "mrs",
"first": "terra",
"last": "andrews"
},
"location": {
"street": "260 railroad st",
"city": "boston",
"state": "tennessee",
"postcode": 38496,
"coordinates": {
"latitude": "-88.5325",
"longitude": "-110.2525"
},
"timezone": {
"offset": "+9:00",
"description": "Tokyo, Seoul, Osaka, Sapporo, Yakutsk"
}
},
"email": "terra.andrews@example.com",
"login": {
"uuid": "26c5d688-5819-43e0-b87f-83cb118e915d",
"username": "brownladybug857",
"password": "ppppp",
"salt": "zFXqbk2V",
"md5": "53a2c773eab06d8058fa2082db44a93c",
"sha1": "351dd3e94cf9fce65ff6247257ddc9d925c550c7",
"sha256": "1db2e93bd619df4450bd5ad0c16caaf80e190ce5af82e5fde2c86054277eaca2"
},
"dob": {
"date": "1967-05-20T16:17:15Z",
"age": 51
},
"registered": {
"date": "2010-02-19T01:50:21Z",
"age": 8
},
"phone": "(112)-568-5928",
"cell": "(545)-407-2306",
"id": {
"name": "SSN",
"value": "566-57-6517"
},
"picture": {
"large": "https://randomuser.me/api/portraits/women/55.jpg",
"medium": "https://randomuser.me/api/portraits/med/women/55.jpg",
"thumbnail": "https://randomuser.me/api/portraits/thumb/women/55.jpg"
},
"nat": "US"
}, {
"gender": "female",
"name": {
"title": "miss",
"first": "lorraine",
"last": "powell"
},
"location": {
"street": "6355 camden ave",
"city": "topeka",
"state": "north dakota",
"postcode": 84769,
"coordinates": {
"latitude": "30.0703",
"longitude": "67.9537"
},
"timezone": {
"offset": "-8:00",
"description": "Pacific Time (US & Canada)"
}
},
"email": "lorraine.powell@example.com",
"login": {
"uuid": "05957a87-b43b-49a1-9308-070b4db6dea9",
"username": "beautifulgoose994",
"password": "please1",
"salt": "2n3q5B4X",
"md5": "93ab6cbf926e4146ed0d5a8608d239a9",
"sha1": "4d73ece6062c616b0113ca167eba0034868dd9f8",
"sha256": "7cd7e4b516bdf85b8d73e5d735bdd81086a1a349938fec095a1532f7a1736198"
},
"dob": {
"date": "1975-11-15T00:41:18Z",
"age": 42
},
"registered": {
"date": "2013-05-17T17:34:20Z",
"age": 5
},
"phone": "(482)-584-8788",
"cell": "(153)-908-0597",
"id": {
"name": "SSN",
"value": "741-95-9331"
},
"picture": {
"large": "https://randomuser.me/api/portraits/women/34.jpg",
"medium": "https://randomuser.me/api/portraits/med/women/34.jpg",
"thumbnail": "https://randomuser.me/api/portraits/thumb/women/34.jpg"
},
"nat": "US"
}],
"info": {
"seed": "9f813640fec569cd",
"results": 5,
"page": 1,
"version": "1.2"
}
}
"""

struct ModelPresenter {
    func getModel(completion: @escaping (ResultAPI?) -> Void) {
        Alamofire.request("https://api.randomuser.me/?nat=US&results=5").responseData { (response) in
            switch response.result {
            case .success(let value):
                completion(try? JSONDecoder().decode(ResultAPI.self,
                                                     from: value))
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
