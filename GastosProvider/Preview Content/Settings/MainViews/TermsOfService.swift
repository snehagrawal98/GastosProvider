//
//  TermsOfService.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct TermsOfService: View {
    var body: some View {
      ScrollView(.vertical) {

        // Navigation Bar
        HStack {
          Button(action: {
            // back
          }, label: {
            Image(systemName: "arrow.left")
              .resizable()
              .frame(width: 24, height: 24)
              .foregroundColor(.primary)
          })

          Spacer()

          SettingsTitleView(title: "Terms Of Service")

          Spacer()
        } //: HSTACK
        .padding()

        VStack {
          Text("Terms & Conditions")
            .font(.subheadline.weight(.bold))
            .frame(width: UIScreen.screenWidth - 16, alignment: .leading)
          .padding(.horizontal)

          Text("""
            By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to GASTOS.

            Any user signing up on this will be considered as GASTOS PROVIDER and he/she agrees to offer a commission Percentage, given text field in shop profile, according to his/her own comfort of business so that we can use it as a discount on every billed amount of the GASTOS customer.

            We hereby declare that the payment of the billed amount after discounting will be directly reflected in the PROVIDER’s account as of which we don’t keep any money in-between the transaction.
            The received amount will be only X% less (X = value of percentage commission given by the provider) as of the bill created by the PROVIDER.
            The PROVIDER’s UPI address and payment receivable information will be asked and will not disclosed or shared to anyone or anywhere.
            The information which will be visible in our main application and before the users are mentioned below along with their purpose:
            •  Images – All images posted by the provider will be shown in his profile page in the user application (their cover photo of the shop and other images related to their businesses)
            •  Owner Name – At Shop profile page so that user can know about the Provider
            •  Shop Address – At shop profile to help user to get clear idea about the shop address and can reach there
            •  Shop Co-ordinates – At shop profile so that user can directly navigate to the shop location saved by the Provider
            •  Commission Percentage – At shop profile in user app as well as in other pages inside user application so that user can see how much discount the shop is giving, as we are not keeping money in between the transaction so the entered Commission value will be depending on their business and how much they want to offer and grow.
            •  Contact Number – At shop profile page in GASTOS user application so that a communication can be done between the both for services related to their business or order delivery (if they provide) or order pickup (if they provide)

            GASTOS is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.
            The GASTOS PROVIDER app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the GASTOS PROVIDER app won’t work properly or at all.

            You should be aware that there are certain things that GASTOS will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but GASTOS cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.
            If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.
            Along the same lines, GASTOS cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, GASTOS cannot accept responsibility.
            With respect to GASTOS’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. GASTOS accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.
            At some point, we may wish to update the app. The app is currently available on Android – the requirements for system (and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. GASTOS does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.
            Changes to This Terms and Conditions
            We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.
            These terms and conditions are effective as of 1st September 2021.
            Contact Us
            If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at help@gastos.in.
          """)
        }
      }
    }
}

struct TermsOfService_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfService()
    }
}
