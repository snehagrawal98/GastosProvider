//
//  PrivacyPolicy.swift
//  GastosProvider
//
//  Created by Sai Kumar Kasireddi's MacBook on 19/01/22.
//

import SwiftUI

struct PrivacyPolicy: View {
  @Environment(\.dismiss) var dismiss
    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          // Navigation Bar
          HStack {
            Button(action: {
              dismiss()
            }, label: {
              Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.primary)
            })

            Spacer()

            SettingsTitleView(title: "Privacy Policy")

            Spacer()
          } //: HSTACK
          .padding()

          VStack {
            Text("Privacy Policy")
              .font(.subheadline.weight(.bold))
              .frame(width: UIScreen.screenWidth - 16, alignment: .leading)
            .padding(.horizontal)

            Text("""
              Welcome to Gastos (“Company”, “we”, “our”, “us”)!
              These Terms of Service (“Terms”, “Terms of Service”) govern your use of our website located at gastos.in (together or individually “Service”) operated by Gastos.
              Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our Gastos application and web pages.
              Your agreement with us includes these Terms and our Privacy Policy (“Agreements”). You acknowledge that you have read and understood Agreements, and agree to be bound of them.
              If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at help@gastos.in so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.
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

              This page is used to inform visitors regarding our policies with the collection, use and disclosure of Personal Information if anyone decided to use our Service.
              If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.
              The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at GASTOS PROVIDER unless otherwise defined in this Privacy Policy.

              Information Collection and Use
              For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.
              The app does use third party services that may collect information used to identify you.

              Log Data
              We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.
              Cookies
              Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.
              This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.
              Service Providers
              We may employ third-party companies and individuals due to the following reasons:
              •  To facilitate our Service;
              •  To provide the Service on our behalf;
              •  To perform Service-related services; or
              •  To assist us in analysing how our Service is used.
              We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.
              Security
              We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.
              Links to Other Sites
              This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.
              Children’s Privacy
              These Services do not address anyone under the age of 18. We do not knowingly collect personally identifiable information from children under 18. In the case we discover that a child under 18 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.
              Changes to This Privacy Policy
              We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.
              This policy is effective as of 1st September 2021.
              Contact Us
              If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at help@gastos.in.



              Terms & Conditions

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
              .padding(.horizontal)
              .padding(.vertical, 8)
            .font(.subheadline)
          }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
    }
}

struct PrivacyPolicy_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicy()
    }
}
