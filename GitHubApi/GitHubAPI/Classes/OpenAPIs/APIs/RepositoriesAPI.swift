//
// RepositoriesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class RepositoriesAPI {
    /**
     Search Repositories
     
     - parameter q: (query) Search key 
     - parameter l: (query) language (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func searchRepositories(q: String, l: String? = nil, completion: @escaping ((_ data: RepositoriesList?,_ error: Error?) -> Void)) {
        searchRepositoriesWithRequestBuilder(q: q, l: l).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Search Repositories
     - GET /search/repositories
     - parameter q: (query) Search key 
     - parameter l: (query) language (optional)
     - returns: RequestBuilder<RepositoriesList> 
     */
    open class func searchRepositoriesWithRequestBuilder(q: String, l: String? = nil) -> RequestBuilder<RepositoriesList> {
        let path = "/search/repositories"
        let URLString = GitHubAPIAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": q.encodeToJSON(), 
            "l": l?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<RepositoriesList>.Type = GitHubAPIAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}