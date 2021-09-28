//
//  SearchSourcesManager.swift
//  KagiSearch Extension
//
//  Created by Eriond on 28/9/21.
//  Copyright © 2021 Marco Cebrián Muiño. All rights reserved.
//

import Foundation

struct SearchSource
{
    var host:String
    var uniqueText:String
    var queryParameter:String
}

class SearchSourcesManager
{
    var sources:[SearchSource] = [SearchSource(host: "www.google.", uniqueText: "ie=", queryParameter: "q"),
                                  SearchSource(host: "www.bing.", uniqueText: "PC=", queryParameter: "q"),
                                  SearchSource(host: "search.yahoo.", uniqueText: "fr=aaplw", queryParameter: "p"),
                                  SearchSource(host: "duckduckgo.", uniqueText: "t=osx", queryParameter: "q"),
                                  SearchSource(host: "www.ecosia.", uniqueText: "tts=st", queryParameter: "q")]
    
    let customSearchEngineQueryLink = "https://kagi.com/search?q="

    static let shared = SearchSourcesManager()

    private init()
    {
        
    }
    
    func newSearchURLFor(url:URL)->URL?{
        guard let host = url.host,
              let source = sources.first(where: {(source) in host.contains(source.host)}),
              let query = url.query else {return nil}
        
        let uniqueText = source.uniqueText
        if query.contains(uniqueText){
            let textQuery = url.valueOf(source.queryParameter) ?? ""
            return URL(string: customSearchEngineQueryLink+textQuery)
        }
        return nil
        
    }

}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
