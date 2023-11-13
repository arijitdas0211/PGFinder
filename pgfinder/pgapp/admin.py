from django.contrib import admin
from pgapp.models import *

# Register your models here.
admin.site.register(Properties)
# admin.site.register(OwnerAccount)
admin.site.register(PropertyHolder)
admin.site.register(Enquire)
admin.site.register(ContactUs)