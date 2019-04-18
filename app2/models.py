from django.db import models

#all models here.


#python manage.py makemigrations appname
#python manage.py migrate
class bbmUser1(models.Model):
    roleid=models.AutoField(primary_key=True)
    rolename=models.CharField(max_length=255,default="",
                              unique=True)

class bbmAdmin(models.Model):
    adminid=models.ForeignKey(bbmUser1,on_delete=
    models.CASCADE,default="")
    adminemail=models.CharField(max_length=255,primary_key=True)
    adminame=models.CharField(max_length=255,default="")
    adminpassword=models.CharField(max_length=255,
                                  default="")
    adminphone=models.BigIntegerField(unique=True)
    adminotp=models.CharField(max_length=255,default="",null=True)
    adminotptime=models.CharField(max_length=255,default="",null=True)

class bbmDonar(models.Model):
    donarid=models.ForeignKey(bbmUser1,on_delete=
    models.CASCADE,default="")
    donarname=models.CharField(max_length=255,default="")
    donaremail=models.CharField(max_length=255,
                               primary_key=True)
    donarpassword=models.CharField(max_length=255,
                                  default="")
    donarcontactno =models.BigIntegerField(unique=True)
    donarage =models.BigIntegerField()
    donarimage=models.CharField(max_length=255,null=True)
    donarotp=models.CharField(max_length=255,default="",null=True)
    donarotptime=models.CharField(max_length=255,default="",null=True)

class bbmBankManager(models.Model):
    managerid=models.ForeignKey(bbmUser1,on_delete=
    models.CASCADE,default="")
    manageremail=models.CharField(max_length=255,primary_key=True)
    managername=models.CharField(max_length=255,default="")
    managerpassword=models.CharField(max_length=255,
                                  default="")
    managerphone=models.BigIntegerField(unique=True)
    managerotp=models.CharField(max_length=255,default="",null=True)
    managerotptime=models.CharField(max_length=255,default="",null=True)

class bbmBlood(models.Model):
    bloodId=models.ForeignKey(bbmDonar,on_delete=
    models.CASCADE,default="")
    bloodDonarName=models.CharField(max_length=255,default="")
    bloodCode=models.AutoField(primary_key=True)
    bloodCost=models.BigIntegerField()
    bloodType=models.CharField(max_length=255,default="")

class bbmHospitals(models.Model):
    hosName=models.CharField(primary_key=True,max_length=255,default="")
    hosPhone=models.BigIntegerField(unique=True)
    hosAddress=models.CharField(max_length=255,default="")

class bbmBloodBank(models.Model):
    bbkId=models.ForeignKey(bbmBlood,on_delete=
    models.CASCADE,default="")
    bbkmgId=models.ForeignKey(bbmBankManager,on_delete=
    models.CASCADE,default="")
    bbkhosId=models.ForeignKey(bbmHospitals,on_delete=
    models.CASCADE,default="")
    bbkBloodType=models.CharField(primary_key=True,unique=True,max_length=255,default="")
    bbkAvailable=models.CharField(max_length=255,default="Yes")


