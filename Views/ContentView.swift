//
//  ContentView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.scenePhase) var scenePhase
    @StateObject var network = NetworkManager()
    @State var selected_fromDate = Date()
    @State var selected_toDate = Date()
    @State var selectedLangIndex = 0
    
    @State var subject : String = ""
        
    private var eligibleDates: ClosedRange<Date> {
      let today = Calendar.current.date(byAdding: .minute, value: -1, to: Date())!
        let thirty = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
      return thirty...today
    }
    
    var body: some View {
    
        NavigationView {
            
            VStack{
                HStack{
                    DatePicker("From Date:", selection: $selected_fromDate, in: eligibleDates, displayedComponents: [.date])
                        .onChange(of: selected_fromDate) { _ in
                            sendNewsNetworkRequest()
                        }
                    
                    DatePicker("To Date: ", selection: $selected_toDate, displayedComponents: [.date])
                        .onChange(of: selected_toDate) { _ in
                            sendNewsNetworkRequest()
                        }
                }.padding(5)
                    
                HStack {
                    Text("Language: ")
                    Picker("Select Language", selection: $selectedLangIndex, content: {
                            ForEach(0..<Constants.languages.count, content: { index in
                                Text(Constants.languages[index])
                            })
                        })
                    .onChange(of: selectedLangIndex){ _ in
                        sendNewsNetworkRequest()
                    }
                     Spacer()
                }.padding(5)
                
                HStack{
                    Text("Subject:")
                    TextField("", text: $subject){
                        print("Subject entered!")
                        sendNewsNetworkRequest()
                    }
                    Spacer()
                    
                }.padding(5)
                
                
                
                List{
                    
                    ForEach(network.articles, id: \.self){ article in
                        NavigationLink (destination: ArticleDetailsView(article: article)){
                        ArticleView(article: article)
                        }
                    }
                }
                .refreshable {
                    sendNewsNetworkRequest()
                }


                
                .navigationTitle("Fido's News Feed")
                .onAppear{
                    sendNewsNetworkRequest()
                }
            
            }
        }
    }//body
    
    func sendNewsNetworkRequest(){
        
        let SelectedLanguage = Constants.languagesValues[Constants.languages[selectedLangIndex]] ?? "en"
        
        let filters = Filters(fromDate: selected_fromDate, toDate: selected_toDate, language: SelectedLanguage, subject: subject)
        
        network.sendGetRequestForNews(filters: filters)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
