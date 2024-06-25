//
//  SwiftUIView.swift
//  BMIadvisor
//
//  Created by simon palmer on 22/06/2021.
//



import SwiftUI

struct SecondView: View {
    @Binding var weight: String
    @Binding var height: String
    @Binding var target: String
    @Binding var BMI: String 
    @Binding var bmiint: Float
    @Binding var wtnewbmi: Float
    @Binding var wtloss: Float
    @Binding var weekcalc: String
    @Binding var wtlossweek: Float
    
    func bmi(weight:String ,height:String ) -> Float{
        return  (Float (weight) ?? 1) / (Float (height) ?? 1) / (Float (height) ?? 1 )
        }
    func wtnewbmi(target:String ,height:String ) -> Float{
        return  (Float (target) ?? 1) * ((Float (height) ?? 1) * (Float (height) ?? 1 ))
        }
    func wtloss(weight:String ,wtnewbmi:Float ) -> Float{
        return  (Float (weight) ?? 1) - ( Float (wtnewbmi)  )
        }
    func wtlossweek(wtloss:Float ,weekcal:String ) -> Float{
        return  (Float (wtloss) ) / ( Float (weekcalc) ?? 1 )
        }
    
        
    var body: some View {
        
        
            ZStack{
            
                     Image("background2")
                              .resizable()
                              .ignoresSafeArea()
                              .aspectRatio(contentMode: .fill)
            VStack{
                Spacer()
            Text("current Weight is \(weight)kg")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color.blue)
            .padding(.bottom)
            
            
            let wtnewbmi = wtnewbmi(target: target, height: height)
                
            Text("target Weight is \(Int(wtnewbmi))kg")
                   
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                    
                    
                    
              //  Spacer()
            Text("your target BMI is \(target)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
                
                
            
            let bmiint = bmi(weight: weight, height: height)
            
            Text("your current BMI is \(Int(bmiint))")
           
            .font(.largeTitle)
            .fontWeight(.medium)
                .foregroundColor(Color.blue)
                Spacer()
            
            let wtloss = wtloss(weight: weight, wtnewbmi: wtnewbmi)
            
            Text("Total Weight loss \(Int(wtloss))kg")
                   
                    .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
                .padding(.bottom, 100.0)
                
            let wtlossweek = wtlossweek(wtloss: wtloss, weekcal: weekcalc)
            let newwtlossweek = String (format: "%.1f",wtlossweek)
                
            Text("Weight loss/week  \(String(newwtlossweek))kg")
                       
                              .font(.system(size: 30))
                    .fontWeight(.medium)
                    .foregroundColor(Color.yellow)
                    .padding(.bottom, 30.0)
                    
                    
                    
                
                      Link("NHS weight loss advice", destination: URL(string: "https://www.nhs.uk/better-health/lose-weight/")!)
                                .font(.title2)
                          .foregroundColor(.white)
                          .background(Color.blue)
                          .cornerRadius(10)
                          .padding(.all, 10.0)
                      
                              
                
           Spacer()
                
                
                
    }
}
    }
struct SecondView_Previews: PreviewProvider {
    
    @State static var weight: String = ""
    @State static var height: String = ""
    @State static var target: String = ""
    @State static var BMI: String = ""
    @State static var bmiint: Float = 0
    @State static var wtnewbmi: Float = 0
    @State static var wtloss: Float = 0
    @State static var wtlossweek: Float = 0
    @State static var weekcalc: String = ""
    static var previews: some View {
        SecondView( weight:$weight, height: $height, target:$target, BMI:$BMI, bmiint:$bmiint, wtnewbmi:$wtnewbmi, wtloss: $wtloss, weekcalc: $weekcalc, wtlossweek: $wtlossweek)
    }
}


}



