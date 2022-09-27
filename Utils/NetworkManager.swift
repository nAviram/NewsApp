//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation


public class NetworkManager : ObservableObject{
    
    static var requestCounter = 0
    
    @Published var articles: [Article] = []
    
    func sendGetRequestForNews(filters: Filters){

        // Create URL
        
        //for example:
//    https://newsapi.org/v2/top-headlines?apiKey=b2d9f0c85995458285ff4e597c4ae536&sortBy=popularity&from=2022-09-22&country=us
//    https://newsapi.org/v2/everything?apiKey=b2d9f0c85995458285ff4e597c4ae536&sortBy=popularity&language=en&from=2022-09-20&to=2022-09-23

//        let dateFormatter = ISO8601DateFormatter()
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let fromDateString = "from=" + dateFormatter.string(from:filters.fromDate)
        var toDateString =   "&to="   + dateFormatter.string(from:filters.toDate)
        
        let datesDiff = filters.toDate - filters.fromDate
        if datesDiff < 1
        {
            toDateString = ""
        }
        
        var urlString : String
        
        //if subject is empty - send request for top_headlines:
        if filters.subject.isEmpty{
            urlString = Constants.baseUrl
            + Constants.top_headlines + "?"
            + "apiKey=" + Constants.apiValue + "&"
            + "sortBy=" + Constants.sortByPopularity + "&"
            + "language=" + filters.language + "&"
            + fromDateString
            + toDateString
        }
        
        else{
            urlString = Constants.baseUrl
                    + Constants.everything + "?"
                    + "apiKey=" + Constants.apiValue + "&"
                    + "sortBy=" + Constants.sortByPublishedAt + "&"
                    + "language=" + filters.language + "&"
                    + "q=" + filters.subject + "&"
                    + fromDateString
                    + toDateString
        }
        
        NetworkManager.requestCounter += 1
        print("GET REQUEST #\(NetworkManager.requestCounter) : " + urlString)
        
        guard let urlEncodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{ fatalError("ERROR: Could not create URL Request!") }
        
        guard let requestUrl = URL(string: urlEncodedString) else{ fatalError("ERROR: Could not create URL Request!") }

        // Create URL Request
        var request = URLRequest(url: requestUrl)

        // Specify HTTP Method to use
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
    
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
        }
                     
            // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) {[weak self] (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
            if let response = response as? HTTPURLResponse {
                // Read all HTTP Response Headers
                print("All headers: \(response.allHeaderFields)")
                // Read a specific HTTP Response Header by name
                print("Specific header: \(response.value(forHTTPHeaderField: "Content-Type") ?? " header not found")")
            }
            
            //Convert to JSON:
            guard let data = data else { return }
            
            do {
                
                let returnValue = try JSONDecoder().decode(ResponseModel.self, from: data)
                
                DispatchQueue.main.async {
                    self?.articles = returnValue.articles
                }
                
            } catch {
                print("Error took place: \(error.localizedDescription).")
            }
            
        }
    
        task.resume()
    }
    

}//Network Manager
