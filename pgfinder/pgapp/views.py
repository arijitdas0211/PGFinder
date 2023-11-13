from django.shortcuts import render, redirect
from pgapp.models import *
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
import os
# https://www.educative.io/answers/how-to-get-the-user-ip-address-in-django -- For Client IP Address

# owners/property holder's views
@login_required
def ownerHome(request):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id  
        prop_id = Properties.objects.filter(user_id=user_id).first()
        prop_query = Enquire.objects.filter(prop_id=prop_id).order_by('-enquire_on')
    return render(request, 'owners/index.html', {'nav' : 'enquiry', 'enquiry' : prop_query})

@login_required
def addOwnProp(request):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        if request.method == "POST":
            prop_name = request.POST["prop_name"]
            prop_img = request.FILES["prop_img"]
            prop_location = request.POST["prop_location"]
            prop_address = request.POST["prop_address"]
            prop_gmap = request.POST["prop_gmap"]
            prop_facilities = request.POST["prop_facilities"]
            prop_price = request.POST["prop_price"]
            prop_gender = request.POST["prop_gender"]
            prop_details = request.POST["prop_details"]
            
            myprop = Properties(prop_name=prop_name, prop_img=prop_img, prop_location=prop_location, prop_address=prop_address, prop_gmap=prop_gmap, prop_facilities=prop_facilities, prop_price=prop_price, prop_gender=prop_gender, prop_details=prop_details, user_id=user_id)
            myprop.save()
            # messages.success(request, f'<i class="fa-regular fa-thumbs-up"></i> <b>Great! {prop_name}</b> - property has been created!')
            return redirect('ownProp')
    return render(request, 'owners/addprop.html', {'nav' : 'addProp'})

@login_required
def ownerProperties(request):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        prop = Properties.objects.filter(user_id=user_id)
    return render(request, 'owners/ownerProperties.html', {'nav' : 'Home', 'prop' : prop})

@login_required
def updateOwnProp(request, prop_slug):
    propdetail = Properties.objects.filter(prop_slug=prop_slug).first()
    if request.method == "POST":
        propId = Properties.objects.filter(prop_slug=prop_slug).first()
        if len(request.FILES) != 0:
            if len(propId.prop_img) > 0:
                os.remove(propId.prop_img.path)
            propId.prop_img = request.FILES['prop_img']
        propId.prop_name = request.POST["prop_name"]
        propId.prop_location = request.POST["prop_location"]
        propId.prop_address = request.POST["prop_address"]
        propId.prop_gmap = request.POST["prop_gmap"]
        propId.prop_facilities = request.POST["prop_facilities"]
        propId.prop_price = request.POST["prop_price"]
        propId.prop_gender = request.POST["prop_gender"]
        propId.prop_details = request.POST["prop_details"]
        propId.save()
        
        propdetail = Properties.objects.filter(prop_slug=prop_slug).first()
        messages.success(request, f'<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Property - <b>{propdetail.prop_name}</b> has been updated!')
    return render(request, 'owners/updateprop.html', {'nav' : 'updateProp', 'propdetail' : propdetail})

@login_required
def deleteOwnProp(request, prop_id):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        obj = Properties.objects.get(pk=prop_id)
        obj.delete()
    return redirect('ownProp')

@login_required
def ownPropDetail(request, prop_slug):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        propdetail = Properties.objects.raw(f"SELECT * from pgapp_properties where prop_slug='{prop_slug}'")
    return render(request, 'owners/ownPropDetail.html', {'propdetail' : propdetail})

def ownerAuth(request):
    # User Registration
    if request.method == 'POST':
        if request.POST['form_type'] == "registerForm":
            fname = request.POST['fname']
            lname = request.POST['lname']
            phone = request.POST['phone']
            mypassword = request.POST['mypassword']
            password = request.POST['password']

            if len(fname)<2 or len(lname)<1 or len(phone) != 10 or password != mypassword:
                messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
            else:
                userReg = User.objects.create_user(first_name=fname, last_name=lname, username=phone, password=password)
                userReg.save()
                messages.success(request, "<i class='fa-regular fa-thumbs-up'></i> <b>Great!</b> Registration Successful!<br/><b>Please Login...</b>")
            return redirect('ownerAuth')        
    
    # User Login
    if request.method == 'POST':
        if request.POST['form_type'] == "loginForm":
            userphone = request.POST['phone']
            password = request.POST['password']
            
            user = authenticate(username=userphone, password=password)
            if user is not None:
                login(request, user)
                # messages.success(request, "<i class='fa-regular fa-thumbs-up'></i> <b>Great!</b> Login Successful!<br/>")
                return redirect('enquiry')
            else:
                messages.error(request, "<i class='fa-regular fa-circle-xmark'></i> <b>Sorry!</b> User doesn't exist, please register..!")

    return render(request, "owners/authentication.html")

@login_required
def ownerProfile(request):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        check_user = PropertyHolder.objects.filter(user_id=user_id).first()
        if request.method == "POST":
            owner_aadhaar = request.POST["aadhaar"]
            owner_pan = request.POST["pan"]
            owner_state = request.POST["state"]
            owner_city = request.POST["city"]
            owner_pin = request.POST["pin"]
            owner_address = request.POST["address"]

            if check_user is None:
                ownerinfo = PropertyHolder(owner_aadhaar=owner_aadhaar, owner_pan=owner_pan, owner_state=owner_state, owner_city=owner_city, owner_pin=owner_pin, owner_address=owner_address, user_id = user_id)
                ownerinfo.save()
                messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Your profile has been saved!')
            else:
                PropertyHolder.objects.filter(user_id=user_id).update(
                        owner_aadhaar = request.POST["aadhaar"],
                        owner_pan = request.POST["pan"],
                        owner_state = request.POST["state"],
                        owner_city = request.POST["city"],
                        owner_pin = request.POST["pin"],
                        owner_address = request.POST["address"]
                    )
                messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Your profile has been updated!')
        owner = PropertyHolder.objects.filter(user_id=user_id).first()
    return render(request, "owners/ownerProfile.html", {"nav" : "my-profile", "owner" : owner})

def ownerLogout(request):
    if request.user.is_authenticated:
        user = request.user
        user_id = user.id
        logout(request)
    messages.success(request, "<i class='fa-regular fa-thumbs-up'></i> <b>Successfully logged out !!</b>")
    return redirect('ownerAuth')

# ---------- End of owners/property holder's views ----------

# Frontend users views
def home(request):
    prop = Properties.objects.raw('SELECT * FROM PGAPP_PROPERTIES')
    return render(request, 'users/index.html', {'nav' : 'Home', 'prop' : prop})

def properties(request):
    prop = Properties.objects.raw('SELECT * FROM PGAPP_PROPERTIES')
    return render(request, 'users/properties.html', {'nav' : 'Properties', 'prop' : prop})

def propDetails(request, prop_slug):
    prop_details = Properties.objects.filter(prop_slug=prop_slug)
    prop_id = Properties.objects.filter(prop_slug=prop_slug).first()

    if request.method == "POST":
        name = request.POST['name']
        phone = request.POST['phone']
        select_property = request.POST['select_property']
        message = request.POST['message']
        if len(name) < 2 or len(phone) != 10 or len(message) < 10:
            messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
        else:
            enquiry = Enquire(name=name, phone=phone, property=select_property, message=message, prop_id=prop_id)
            enquiry.save()
            messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Query Submitted!<br>We will contact you within 48 hours.')
    return render(request, 'users/propDetails.html', {'nav' : 'Properties', 'propDetail' : prop_details})

def about(request):
    return render(request, 'users/about_us.html', {'nav' : 'About-Us'})

def contact(request):
    if request.method=="POST":
        name=request.POST['name']
        contact_no=request.POST['contact_no']
        queries=request.POST['queries']
        if len(name) < 2 or len(contact_no) != 10 or len(queries) < 10:
            messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
        else:
            contacts = ContactUs(name=name, contact_no=contact_no, query=queries)
            contacts.save()
            messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Query Submitted!<br>Our team will contact you within 48 hours.')
    return render(request, 'users/contact.html', {'nav' : 'Contact us'})

# ---------- End of Frontend users views ----------
