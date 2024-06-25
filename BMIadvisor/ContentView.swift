//
//  ContentView.swift
//  BMIadvisor
//
//  Created by simon palmer on 20/06/2021.
//

import SwiftUI




struct ContentView: View {
    
    @State var weight = ""
    @State var height = ""
    @State var target = ""
    @State var weekcalc = ""
    @State var BMI = ""
    @State var bmiint: Float = 0
    @State var showDetails = false
    @State var wtnewbmi: Float = 0
    @State var wtloss: Float = 0
    @State var wtlossweek: Float = 0
    
        
 
    
    func bmi(weight:String ,height:String ) -> Float{
        return  (Float (weight) ?? 1) / (Float (height) ?? 1) / (Float (height) ?? 1 )
        
    
    }

    
    
    //let BMI = String (format: "%.2f",bmiint)
    
    var body: some View {

        
            NavigationView {
            
                
            
                ZStack {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
               
                
                VStack{
                    Spacer()
                    Text ("[BMI = Body Mass Index-click here for more information from the NHS]( https://www.nhs.uk/common-health-questions/lifestyle/what-is-the-body-mass-index-bmi/)")
                           
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color.pink)
                        .multilineTextAlignment(.center)
                        
                        .padding(.top, 10.0)
                        .frame(width:360, height: 120, alignment: .top)
                    
                    //Spacer()
                        
                    TextField("Enter Weight kg", text: $weight)
                        .padding(10)
                        .frame(width: 200, height: 50)
                        .font(.title2).foregroundColor(.purple)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .keyboardType(.decimalPad)
                        
                    TextField("Enter Height m", text: $height)
                        .padding(10)
                        .frame(width: 200, height: 50)
                        .font(.title2).foregroundColor(.purple)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .keyboardType(UIKeyboardType.default)
                    TextField("Enter Target BMI", text: $target)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .font(.title2).foregroundColor(.purple)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .keyboardType(UIKeyboardType.default)
                    TextField("duration of diet (weeks)", text: $weekcalc)
                        .padding(10)
                        .frame(width: 330, height: 50)
                        .font(.title2).foregroundColor(.purple)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .font(.title)
                        .keyboardType(UIKeyboardType.default)
                        
                    let bmiint = bmi(weight: weight, height: height)
                    
                    
                    let BMI = String (format: "%.2f",bmiint)
                    
                    
                        
                    Button( action: {
                        
                        print (bmiint)
                        print (BMI)
                        showDetails.toggle()
                        
                        
                    }, label: {
                        Text("Calculate BMI")
                    })
                    .padding(.all, 20.0)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    
                    if showDetails{
                        Text ("your BMI is  \(BMI) ")
                       
                    }
                    
                
                   
                    
                    NavigationLink(destination: SecondView(weight: $weight, height: $height, target: $target, BMI: self.$BMI, bmiint:self.$bmiint,wtnewbmi: self.$wtnewbmi, wtloss: self.$wtloss, weekcalc: $weekcalc, wtlossweek: $wtlossweek)
                                    //.onAppear(){self.bmi(weight: weight, height: height)}
                    )
                    {
                        Text("Click For Weight Loss  Advice")
                            .padding(.all, 20.0)
                            .background(Color.yellow)
                            .cornerRadius(10)
                        
                    }
                    
                    Spacer()
                    
                    
                    
                
            }
                    
        }
                .navigationBarTitle(Text("BMIADVISOR"))
                .navigationBarTitleDisplayMode(.inline)
                
                
                
                
            }.navigationViewStyle(StackNavigationViewStyle())
}
                    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
       
        ContentView()
    }
}
}
