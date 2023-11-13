from django.db import models
from django import forms
from django.utils.timezone import now
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from autoslug import AutoSlugField
import numpy as np

# Create your models here.
class Properties(models.Model):
    prop_id = models.AutoField(primary_key=True)
    prop_name = models.CharField(max_length=100)
    score = models.IntegerField(default=0, 
                                validators= [
                                    MaxValueValidator(5),
                                    MinValueValidator(0),
                                ]
                            )
    prop_img = models.FileField(upload_to="properties")
    prop_location = models.CharField(max_length=100)
    prop_address = models.CharField(max_length=200)
    prop_gmap = models.CharField(max_length=200)
    prop_facilities = models.CharField(max_length=100)
    prop_price = models.BigIntegerField()
    prop_details = models.TextField()
    prop_gender = models.CharField(max_length=50)
    prop_slug = AutoSlugField(populate_from='prop_name')
    prop_on = models.DateTimeField(default=now)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    
    def __str__(self):
        return str(self.pk)
    def facList(self):
        return self.prop_facilities.strip().split(',')
    def propGen(self):
        return self.prop_gender.strip().split(',')
    def propLocation(self):
        prop_list = self.prop_location.lower().strip().split()
        str1 = "-"
        proploc =  str1.join(prop_list)
        new_loc = proploc.split()
        unique_loc = np.unique(new_loc)
        return unique_loc
    def __str__(self):
        return f"{self.prop_name}"


class ImageForm(forms.ModelForm):
    class Meta:
        model = Properties
        fields = ['prop_img']

class PropertyHolder(models.Model):
    owner_id = models.AutoField(primary_key=True)
    owner_aadhaar = models.CharField(max_length=30)
    owner_pan = models.CharField(max_length=10)
    owner_city = models.CharField(max_length=50)
    owner_state = models.CharField(max_length=50)
    owner_state = models.CharField(max_length=50)
    owner_pin = models.CharField(max_length=10)
    owner_address = models.TextField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)

class Enquire(models.Model):
    enq_id = models.AutoField(primary_key=True)
    name=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    property=models.CharField(max_length=100)
    message=models.TextField()
    enquire_on = models.DateTimeField(default=now)
    prop_id = models.ForeignKey("Properties", on_delete=models.CASCADE)
        
class ContactUs(models.Model):
    cus_id = models.AutoField(primary_key=True)
    name=models.CharField(max_length=50)
    contact_no=models.BigIntegerField()
    query=models.TextField()
    contact_on = models.DateTimeField(default=now)
