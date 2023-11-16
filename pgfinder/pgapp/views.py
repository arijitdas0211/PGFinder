from django.shortcuts import render, redirect
from pgapp.models import *
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
import os
from django.db.models import Sum, Avg, Max, Min
from django.db.models.functions import Round
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
    # Rendering all props
    if request.method == 'POST':
        myGen = request.POST['gender']
        myLoc = request.POST['location']
        myPrice = request.POST['price']
        # print("Selected Filters are:- ", myGen, " | ", myLoc, " | ", myPrice)
        prop = Properties.objects.filter(prop_gender=myGen, prop_location = myLoc, prop_price__lte = myPrice).order_by('prop_price')
    else:
        prop = Properties.objects.all().order_by('-prop_on')[:8]

    # For Top Rated properties
    ratingIds = Rating.objects.values_list('prop_id', flat=True).distinct().order_by('-score')
    ratedProps = []
    for i in ratingIds:
        ratedProps.append(Properties.objects.filter(prop_id=i).first())
    
    location = Properties.objects.values_list('prop_location', flat=True).distinct().order_by('-prop_location')
    propPrice = Properties.objects.values_list('prop_price', flat=True).distinct()
    # print(max(propPrice))
    return render(request, 'users/index.html', 
                {
                    'nav' : 'Home', 
                    'prop' : prop, 
                    'ratedProps' : ratedProps, 
                    'location' : location,
                    'max_price' : max(propPrice),
                    'min_price' : min(propPrice)
                })

def properties(request):
    prop = Properties.objects.all().order_by('-prop_on')
    return render(request, 'users/properties.html', {'nav' : 'Properties', 'prop' : prop})

def propDetails(request, prop_slug):
    prop_details = Properties.objects.filter(prop_slug=prop_slug)
    prop_id = Properties.objects.filter(prop_slug=prop_slug).first()

    if request.method == "POST":
        if request.POST['form_type'] == "myquery":
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

    check_ip = Rating.objects.filter(prop_id=prop_id).first()
    # print(check_ip)
    if request.method == "POST":
        if request.POST['form_type'] == "myrating":
            x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
            if x_forwarded_for:
                ipaddress = x_forwarded_for.split(',').strip()
            else:
                ipaddress = request.META.get('REMOTE_ADDR')
            score = request.POST['score']
            get_ip = ipaddress
            if check_ip is None:
                prop_score = Rating(score=score, is_Rated = True, user_ip=get_ip, prop_id=prop_id)
                prop_score.save()
                messages.info(request, f'<i class="fa-solid fa-face-grin-stars fa-xl"></i> Thank You for Rating <b>{prop_id.prop_name.title()}</b>')
            else:
                if check_ip.user_ip != ipaddress:
                    prop_score = Rating(score=score, is_Rated = True, user_ip=get_ip, prop_id=prop_id)
                    prop_score.save()
                    messages.info(request, f'<i class="fa-solid fa-face-grin-stars fa-xl"></i> Thank You for Rating <b>{prop_id.prop_name.title()}</b>')
                else:
                    messages.warning(request, f'<i class="fa-solid fa-face-smile-beam fa-xl"></i> You have already rated for <b>{prop_id.prop_name.title()}</b>')

    # ratings = Rating.objects.filter(prop_id=prop_id).first()
    avgRateDict = Rating.objects.filter(prop_id=prop_id).aggregate(Avg('score'))
    for item in avgRateDict.values():
        if item is not None:
            avgRate = round(item)
        else:
            avgRate = 0
    RateList = []
    for i in range(1, avgRate+1):
        RateList.append(i)
    remain = 5 - avgRate
    remList = []
    if remain != 0:
        for rem in range(1, remain+1):
            remList.append(rem)

    # print(RateList)
    return render(request, 'users/propDetails.html', {'nav' : 'Properties', 'propDetail' : prop_details, 'RateList' : RateList, 'remList' : remList})

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
