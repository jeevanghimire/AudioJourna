import SwiftUI

struct LoginOrSignUpPage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 243/255, green: 241/255, blue: 205/255)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Logo Image
                    Image("logo-color")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 100)
                
                   Spacer()
                    VStack{
                            Text("A u d i o  J o u r n a")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.red.opacity(0.6))
                        Text("Capture Your Day, One Voice at a time")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    HStack {
                        Spacer() // Push Login button to the left
                        
                        // NavigationLink for Login Button
                        NavigationLink(destination: LoginInPage()) {
                            Text("Login")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 180, height: 50)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        
                        Spacer() // Add space between Login and Sign Up buttons
                        
                        // NavigationLink for Sign Up Button
                        NavigationLink(destination: SignUpPage()) {
                            Text("Sign Up")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 180, height: 50)
                                .background(Color.brown)
                                .cornerRadius(5)
                        }
                        
                        Spacer() // Push Sign Up button to the right
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                }
            }
        }
    }
}



#Preview {
    LoginOrSignUpPage()
}

