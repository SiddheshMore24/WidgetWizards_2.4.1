import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,required this.emailId}) ;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
  final String emailId;
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  var template = ''' <html>
    <head>
        <title>Email OTP Template</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 20px auto;
                background-color: #E0F2F1; /* Teal accent color */
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }
            .header {
                background-color: #009688; /* Dark teal */
                color: #fff;
                text-align: center;
                padding: 20px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .content {
                padding: 20px;
            }
            p {
                font-size: 16px;
                color: #333;
                line-height: 1.5;
            }
            .otp {
                font-size: 36px;
                color: #FF5722;
                margin-bottom: 20px;
                font-weight: bold;
            }
            .footer {
                background-color: #f4f4f4;
                padding: 20px;
                text-align: center;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
            }
            .footer p {
                font-size: 12px;
                color: #666;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>{{app_name}}</h1>
            </div>
            <div class="content">
                <p>Dear User,</p>
                <p>Thank you for choosing {{app_name}}. Your One-Time Password (OTP) is:</p>
                <p class="otp">{{otp}}</p>
                <p>Please use this OTP to complete your authentication process.</p>
            </div>
            <div class="footer">
                <p>This email was sent by {{app_name}}. Please do not reply to this email.</p>
            </div>
        </div>
    </body>
    </html>''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Otp Will be send on your email Id : ${widget.emailId}")),
                    ElevatedButton(
                        onPressed: () async {
                          myauth.setConfig(
                              appEmail: "flutterteam2026@gmail.com",
                              appName: "Email OTP",
                              userEmail: email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly);
                          myauth.setTemplate(render: template);
                          myauth.setTheme(theme: "v3");
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: otp,
                          decoration:
                              const InputDecoration(hintText: "Enter OTP")),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        },
                        child: const Text("Verify")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
