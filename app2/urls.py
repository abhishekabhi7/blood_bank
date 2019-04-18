from django.conf.urls import url
from app2 import views

app_name = "app2"

urlpatterns=[
    url(r'^$',views.bbm),
    url(r'^login/$',views.login_new,name="login"),
    url(r'^register/$',views.register,name="register"),
    url(r'^adduser/$',views.adduser),
    url(r'^details/$',views.adddetails),
    url(r'^home/$',views.vwdata,name="home"),
    url(r'^verification/$',views.my_change_password),

]
