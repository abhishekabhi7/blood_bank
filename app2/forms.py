from django import forms
from app2.models import bbmDonar,bbmHospitals,bbmBankManager,bbmUser1,bbmAdmin,bbmBlood,bbmBloodBank

class bbmUserForm(forms.ModelForm):
    class Meta():
        model=bbmUser1
        exclude=["roleid","rolename"]

class bbmDonarForm(forms.ModelForm):
    class Meta():
        model=bbmDonar
        exclude=["donarid","donarname","donaremail","donarpassword","donarcontactno","donarage","donarimage","donarotptime","donarotp"]

class bbmAdminForm(forms.ModelForm):
    class Meta():
        model=bbmAdmin
        exclude=["adminid","adminname","adminemail","adminpassword","donarphone","adminImage"]

class bbmManagerForm(forms.ModelForm):
    class Meta():
        model=bbmBankManager
        exclude=["managerid","managername","manageremail","managerpassword","managerphone","managerImage"]


class detailsForm(forms.ModelForm):
    class Meta():
        model=bbmBlood
        exclude=["bloodId","bloodDonarName","bloodCost","bloodCode","bloodType"]
