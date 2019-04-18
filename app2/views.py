from django.shortcuts import render, HttpResponse,redirect
from app2.models import bbmDonar,bbmHospitals,bbmBankManager,bbmUser1,bbmAdmin,bbmBlood,bbmBloodBank
from app2.forms import bbmDonarForm,bbmUserForm,detailsForm
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password,check_password
from otpfile import otpgenerate
from emailsending import otpsend
import datetime as dt


def bbm(request):
     return render(request, "bbm.html")

def adduser(request):

    if(request.method=="POST"):
        form=bbmUserForm(request.POST)
        if(form.is_valid()):
            f=form.save(commit=False)
            f.rolename=request.POST["rolename"]
            f.save()
            return render(request,"usr.html",{'success':True})
        else:

            return render(request,"usr.html",{'invalid':True})

    return render(request,"usr.html")

def login_new(request):

    if(request.method=="POST"):
        ue = request.POST['email']
        password = request.POST['password']
        role = request.POST['role']

        if (role == "1"):
            try:
                admindata = bbmAdmin.objects.get(adminemail=ue)
                dbp=admindata.adminpassword
                b= password==dbp
                if(b):
                    request.session['Authenticated']=True
                    request.session['emailid']=ue

                    return render(request,"wel.html")
                else:
                    return render(request,"login_bbm.html",{'pinvalid':True})
            except:
                    return render(request,"login_bbm.html",{'einvalid':True})


        if(role == "2"):
            try:
                donardata = bbmDonar.objects.get(donaremail=ue)
                dbp=donardata.donarpassword
                b=check_password(password,dbp)
                if(b):
                        request.session['Authenticated']=True
                        request.session['emailid']=ue

                        update=bbmDonar(donaremail=ue)


                        return render(request,"wel.html")

                else:
                        return render(request,"login_bbm.html",{'pinvalid':True})
            except:
                    return render(request,"login_bbm.html",{'einvalid':True})


        if (role == "3"):
            try:
                managerdata = bbmBankManager.objects.get(manageremail=ue)
                dbp=managerdata.managerpassword
                b=(password==dbp)
                if(b):
                    request.session['Authenticated']=True
                    request.session['emailid']=ue

                    update=bbmBankManager(manageremail=ue)


                    return redirect("/details/")

                else:
                    return render(request,"login_bbm.html",{'pinvalid':True})
            except:
                    return render(request,"login_bbm.html",{'einvalid':True})
    return render(request, "login_bbm.html")

def register(request):

    if(request.method=="POST"):
        donar_image=None
        if(request.FILES["donarimage"]):
            myfile=request.FILES["donarimage"]
            fs=FileSystemStorage()
            filename=fs.save(myfile.name,myfile)
            donar_image=fs.url(filename)
            donar_image=myfile.name

        form=bbmDonarForm(request.POST)
        if(form.is_valid()):
            f=form.save(commit=False)
            f.donarid_id=request.POST["s1"]
            f.donarname=request.POST["donarname"]
            f.donaremail=request.POST["donaremail"]
            f.donarpassword=make_password(request.POST["donarpassword"])
            f.donarcontactno=request.POST["donarcontactno"]
            f.donarage=request.POST["donarage"]
            f.donarimage=donar_image
            f.save()
            return render(request,"reg_bbm.html",{'success':True})
        else:

            return render(request,"reg_bbm.html",{'invalid':True})

    return render(request,"reg_bbm.html")


def adddetails(request):

    if(request.method=="POST"):
        form=detailsForm(request.POST)
        if(form.is_valid()):

            f=form.save(commit=False)
            f.bloodId_id=request.POST["bloodid"]
            f.bloodDonarName=request.POST["blooddonarname"]
            f.bloodType=request.POST["bloodtype"]
            f.bloodCost=request.POST["bloodcost"]
            f.save()
            return render(request,"bbm details.html",{'success':True})
        else:

            return render(request,"bbm details.html",{'invalid':True})

    return render(request,"bbm details.html")


def vwdata(request):
    #data=bbmDonar.objects.filter(donaremail="abhiabhi111@gmail.com").select_related()
    data=bbmDonar.objects.select_related().all()
    #data=bbmDonar.objects.select_related().all().prefetch_related('bloodid')
    return render(request,"home1.html",{"donardata":data})

def my_change_password(request):
    get_email = request.session['emailid']
    my_data = bbmDonar.objects.get(donaremail=get_email)
    ck_otp= bbmDonar.donarotp
    password = my_data.donarpassword
    if (request.method == 'POST'):
        get_old_pass = request.POST['oldpassword']
        check = check_password(get_old_pass,password)
        if check:
            new_password = request.POST['newpassword']
            confirm_password = request.POST['confirmpassword']
            get_length = len(confirm_password)
            if new_password == confirm_password:
                if (get_length >= 3):
                    get_otp=request.POST['otp']
                    if get_otp == ck_otp:
                        update = bbmDonar(donaremail=get_email, donarpassword=make_password(confirm_password))
                        update.save(update_fields=['donarpassword'])
                        return redirect("/home/")
                else:
                    return render(request, "nww.html", {'length_less': True})
            else:
                return render(request, 'nww.html', {'pass_dont_match': True})
        else:
            return render(request, 'nww.html', {'old_p_invalid': True})


    else:
        otp = otpgenerate()
        otp_date_time = dt.datetime.now()
        update = bbmDonar(donaremail=get_email, donarotp=otp, donarotptime=otp_date_time)
        update.save(update_fields=['donarotp','donarotptime'])
        otpsend(otp, get_email)


    return render(request, "nww.html", {'data': my_data})



def verify(request):
    return render(request,"wel.html")


#userdata=newUser(user_email="abc@gmail.com",   primary key    ..... newUser here is table name
#        user_password="123344" )  to be changed

#update.save(update_fields=["user_password"])
