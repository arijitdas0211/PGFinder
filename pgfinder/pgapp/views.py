from django.shortcuts import render, redirect
from pgapp.models import *
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
import os
from django.db.models import Avg
from ipware import get_client_ip

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
            prop_name = request.POST.get("prop_name")
            prop_img = request.FILES["prop_img"]
            prop_location = request.POST.get("prop_location")
            prop_address = request.POST.get("prop_address")
            prop_gmap = request.POST.get("prop_gmap")
            prop_facilities = request.POST.get("prop_facilities")
            prop_price = request.POST.get("prop_price")
            prop_gender = request.POST.get("prop_gender")
            prop_details = request.POST.get("prop_details")
            
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
        propId.prop_name = request.POST.get("prop_name")
        propId.prop_location = request.POST.get("prop_location")
        propId.prop_address = request.POST.get("prop_address")
        propId.prop_gmap = request.POST.get("prop_gmap")
        propId.prop_facilities = request.POST.get("prop_facilities")
        propId.prop_price = request.POST.get("prop_price")
        propId.prop_gender = request.POST.get("prop_gender")
        propId.prop_details = request.POST.get("prop_details")
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
        if request.POST.get('form_type') == "registerForm":
            fname = request.POST.get('fname')
            lname = request.POST.get('lname')
            phone = request.POST.get('phone')
            mypassword = request.POST.get('mypassword')
            password = request.POST.get('password')

            if len(fname)<2 or len(lname)<1 or len(phone) != 10 or password != mypassword:
                messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
            else:
                userReg = User.objects.create_user(first_name=fname, last_name=lname, username=phone, password=password)
                userReg.save()
                messages.success(request, "<i class='fa-regular fa-thumbs-up'></i> <b>Great!</b> Registration Successful!<br/><b>Please Login...</b>")
            return redirect('ownerAuth')        
    
    # User Login
    if request.method == 'POST':
        if request.POST.get('form_type') == "loginForm":
            userphone = request.POST.get('phone')
            password = request.POST.get('password')
            
            user = authenticate(username=userphone, password=password)
            if user is not None:
                login(request, user)
                # messages.success(request, "<i class='fa-regular fa-thumbs-up'></i> <b>Great!</b> Login Successful!<br/>")
                return redirect('ownProp')
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
            owner_aadhaar = request.POST.get("aadhaar")
            owner_pan = request.POST.get("pan")
            owner_state = request.POST.get("state")
            owner_city = request.POST.get("city")
            owner_pin = request.POST.get("pin")
            owner_address = request.POST.get("address")

            if check_user is None:
                ownerinfo = PropertyHolder(owner_aadhaar=owner_aadhaar, owner_pan=owner_pan, owner_state=owner_state, owner_city=owner_city, owner_pin=owner_pin, owner_address=owner_address, user_id = user_id)
                ownerinfo.save()
                messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Your profile has been saved!')
            else:
                PropertyHolder.objects.filter(user_id=user_id).update(
                        owner_aadhaar = request.POST("aadhaar"),
                        owner_pan = request.POST("pan"),
                        owner_state = request.POST("state"),
                        owner_city = request.POST("city"),
                        owner_pin = request.POST("pin"),
                        owner_address = request.POST("address")
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
    # Rendering all props or filter props
    if request.method == 'POST':
        myGen = request.POST.get('gender')
        myLoc = request.POST.get('location')
        myPrice = request.POST.get('price')
        # print("Selected Filters are:- ", myGen, " | ", myLoc, " | ", myPrice)

        if myLoc and myPrice and not myGen:
            prop = Properties.objects.filter(prop_location = myLoc, prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and myPrice and not myLoc:
            prop = Properties.objects.filter(prop_gender=myGen, prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and myLoc and not myPrice:
            prop = Properties.objects.filter(prop_gender=myGen, prop_location = myLoc).order_by('prop_price')
        elif myPrice and not myGen and not myLoc:
            prop = Properties.objects.filter(prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and not myLoc and not myPrice:
            prop = Properties.objects.filter(prop_gender=myGen).order_by('prop_price')
        elif myLoc and not myGen and not myPrice:
            prop = Properties.objects.filter(prop_location = myLoc).order_by('prop_price')
        else:
            prop = Properties.objects.filter(prop_gender = myGen, prop_location = myLoc, prop_price__lte = myPrice).order_by('prop_price')

        # print(prop)
        if not prop:
            prop = Properties.objects.all().order_by('-prop_on')[:8]
            messages.warning(request, '<b>Sorry!</b> Filtered Property not available, instead Showing All.')
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
    footerProps = Properties.objects.all().order_by('-prop_on')[:5]
    return render(request, 'users/index.html', 
                {
                    'nav' : 'Home', 
                    'prop' : prop, 
                    'footerProps' : footerProps,
                    'ratedProps' : ratedProps, 
                    'location' : location,
                    'max_price' : max(propPrice)+1000,
                    'min_price' : min(propPrice)-1000
                })

def properties(request):
    # Rendering all props or filter props
    if request.method == 'POST':
        myGen = request.POST.get('gender')
        myLoc = request.POST.get('location')
        myPrice = request.POST.get('price')
        # print("Selected Filters are:- ", myGen, " | ", myLoc, " | ", myPrice)

        if myLoc and myPrice and not myGen:
            prop = Properties.objects.filter(prop_location = myLoc, prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and myPrice and not myLoc:
            prop = Properties.objects.filter(prop_gender=myGen, prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and myLoc and not myPrice:
            prop = Properties.objects.filter(prop_gender=myGen, prop_location = myLoc).order_by('prop_price')
        elif myPrice and not myGen and not myLoc:
            prop = Properties.objects.filter(prop_price__lte = myPrice).order_by('prop_price')
        elif myGen and not myLoc and not myPrice:
            prop = Properties.objects.filter(prop_gender=myGen).order_by('prop_price')
        elif myLoc and not myGen and not myPrice:
            prop = Properties.objects.filter(prop_location = myLoc).order_by('prop_price')
        else:
            prop = Properties.objects.filter(prop_gender=myGen, prop_location = myLoc, prop_price__lte = myPrice).order_by('prop_price')

        # print(prop)
        if not prop:
            prop = Properties.objects.all().order_by('-prop_on')
            messages.warning(request, '<b>Sorry!</b> Filtered Property not available, instead Showing All.')
    else:
        prop = Properties.objects.all().order_by('-prop_on')

    # For Top Rated properties
    ratingIds = Rating.objects.values_list('prop_id', flat=True).distinct().order_by('-score')
    ratedProps = []
    for i in ratingIds:
        ratedProps.append(Properties.objects.filter(prop_id=i).first())
    
    location = Properties.objects.values_list('prop_location', flat=True).distinct().order_by('-prop_location')
    propPrice = Properties.objects.values_list('prop_price', flat=True).distinct()
    # print(max(propPrice))
    footerProps = Properties.objects.all().order_by('-prop_on')[:5]
    return render(request, 'users/properties.html', {'nav' : 'Properties', 
                                                     'prop' : prop, 
                                                     'footerProps' : footerProps,
                                                     'ratedProps' : ratedProps, 
                                                     'location' : location,
                                                     'max_price' : max(propPrice)+1000,
                                                     'min_price' : min(propPrice)-1000 })

def propDetails(request, prop_slug):
    prop_details = Properties.objects.filter(prop_slug=prop_slug)
    prop_id = Properties.objects.filter(prop_slug=prop_slug).first()

    if request.method == "POST":
        if request.POST.get('form_type') == "myquery":
            name = request.POST.get('name')
            phone = request.POST.get('phone')
            select_property = request.POST.get('select_property')
            message = request.POST.get('message')
            if len(name) < 2 or len(phone) != 10 or len(message) < 10:
                messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
            else:
                enquiry = Enquire(name=name, phone=phone, property=select_property, message=message, prop_id=prop_id)
                enquiry.save()
                messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Query Submitted!<br>We will contact you within 48 hours.')

    check_ip = Rating.objects.filter(prop_id=prop_id).first()
    # print(check_ip)
    if request.method == "POST":
        if request.POST.get('form_type') == "myrating":
            client_ip, is_routable = get_client_ip(request)
            # print("The IP is:- ", client_ip, is_routable)
            if request.POST.get('score') != '':
                score = request.POST.get('score')
            else:
                score = 0
            get_ip = client_ip
            if check_ip is None:
                prop_score = Rating(score=score, is_Rated = True, user_ip=get_ip, prop_id=prop_id)
                prop_score.save()
                messages.info(request, f'<i class="fa-solid fa-face-grin-stars fa-xl"></i> Thank You for Rating <b>{prop_id.prop_name.title()}</b>')
            else:
                if check_ip.user_ip != client_ip:
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
    footerProps = Properties.objects.all().order_by('-prop_on')[:5]
    return render(request, 'users/propDetails.html', {'nav' : 'Properties', 'propDetail' : prop_details, 'footerProps' : footerProps, 'RateList' : RateList, 'remList' : remList})

def about(request):
    footerProps = Properties.objects.all().order_by('-prop_on')[:5]
    return render(request, 'users/about_us.html', {'nav' : 'About-Us', 'footerProps' : footerProps})

def contact(request):
    if request.method=="POST":
        name=request.POST.get('name')
        contact_no=request.POST.get('contact_no')
        queries=request.POST.get('queries')
        if len(name) < 2 or len(contact_no) != 10 or len(queries) < 10:
            messages.error(request, '<i class="fa-regular fa-circle-xmark"></i> <b>Sorry!</b> Invalid Submission.')
        else:
            contacts = ContactUs(name=name, contact_no=contact_no, query=queries)
            contacts.save()
            messages.success(request, '<i class="fa-regular fa-thumbs-up"></i> <b>Great!</b> Query Submitted!<br>Our team will contact you within 48 hours.')
    footerProps = Properties.objects.all().order_by('-prop_on')[:5]
    return render(request, 'users/contact.html', {'nav' : 'Contact us', 'footerProps' : footerProps})

# ---------- End of Frontend users views ----------
