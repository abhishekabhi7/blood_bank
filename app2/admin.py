from django.contrib import admin
from app2.models import bbmDonar,bbmHospitals,bbmBankManager,bbmUser1,bbmAdmin,bbmBlood,bbmBloodBank

# Register your models here.

#python manage.py createsuperuser


#admin username abhishek
#admin password 1234abi1234


admin.site.register(bbmDonar)
admin.site.register(bbmBlood)
admin.site.register(bbmBloodBank)
admin.site.register(bbmBankManager)
admin.site.register(bbmAdmin)
admin.site.register(bbmHospitals)
admin.site.register(bbmUser1)
