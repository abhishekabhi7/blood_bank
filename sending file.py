import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

fromaddr="bloodbankproject1123@gmail.com"
toaddr="abhisheksingh7397@gmail.com"
msg=MIMEMultipart()
msg['From']='bloodbankproject1123@gmail.com'
msg['To']='abhisheksingh7397@gmail.com'
msg['Subject']="Hello Abhishek"

#attachment code
filename="c.txt"
with open(filename,'r') as f:
    message=MIMEText(f.read(),_subtype="txt")
    message.add_header('Content-Deposition','attachment',filename=filename)
    msg.attach(message)

# End attachment code
body="my file is her !!"
msg.attach(MIMEText(body,"plain"))

server=smtplib.SMTP('smtp.gmail.com',587)
server.starttls()
server.login('bloodbankproject1123@gmail.com','123455432abi')
text=msg.as_string()
server.sendmail('bloodbankproject1123@gmail.com','abhisheksingh7397@gmail.com',text)

server.quit()
print('emeil sent successfully')
