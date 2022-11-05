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
    
    @State var goButtonEnabled : Bool = false
        
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
                            goButtonEnabled = filterValidator()
                        }
                    
                    DatePicker("To Date: ", selection: $selected_toDate, displayedComponents: [.date])
                        .onChange(of: selected_toDate) { _ in
                            goButtonEnabled = filterValidator()
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
                        goButtonEnabled = filterValidator()
                    }
                     Spacer()
                }.padding(5)
                
                HStack{
                    Text("Subject:")
                    TextField("", text: $subject){
                        print("Subject entered!")
                        goButtonEnabled = filterValidator()
                    }
                    Spacer()
                    Button(action: {
                        print("GO button pressed!")
                        sendNewsNetworkRequest()
                    }){
                        Text("GO!")
                            .padding(.trailing)
                            
                    }
                    .disabled(!goButtonEnabled)
                    
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


                
                .navigationTitle("News Feed App")
                
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
    
    func filterValidator() -> Bool{
        if selected_toDate - selected_fromDate >= 1 &&
            !subject.isEmpty{
            print("True")
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
