import smtplib
server=smtplib.SMTP("smtp.gmail.com",587)
server.starttls()
server.login('bloodbankproject1123@gmail.com','123455432abi')
try:
    server.sendmail('bloodbankproject1123@gmail.com',
                'abhisheksingh7397@gmail.com',
                "Connection Created !!")

    print("E-Mail Sent Successfully !!")

except:
    print("UNsuccessfull")
