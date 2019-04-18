from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from app2 import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url('admin/', admin.site.urls),
    url(r'^',include('app2.urls'))

]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
