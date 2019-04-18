import smtplib
from email.mime.multipart import \
    MIMEMultipart
from email.mime.text import MIMEText


def otpsend(otp,usermail):
    msg= MIMEMultipart()
    msg["From"] = 'bloodbankproject1123@gmail.com'
    msg["To"] = usermail
    msg["Subject"] = "otp"
    body =" Your One Time Password is = "+str(otp)
    msg.attach(MIMEText(body, "plain"))
    server = smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    server.login("bloodbankproject1123@gmail.com","123455432abi")
    text = msg.as_string()
    server.sendmail(msg["From"],msg["To"],text)
    server.quit()

    print("Message Sent !!")
