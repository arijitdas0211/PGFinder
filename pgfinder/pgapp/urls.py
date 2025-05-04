from django.urls import path
from pgapp import views

urlpatterns = [
    # Frontend owners/property holder's views
    # path('property-holder/dashboard/', views.ownerDashboard, name='dashboard'),
    path('property-holder/dashboard/all-enquiries/', views.ownerHome, name='enquiry'),
    path('property-holder/dashboard/my-property-listings/', views.ownerProperties, name='ownProp'),
    path('property-holder/dashboard/add-property/', views.addOwnProp, name='addprop'),
    path('property-holder/dashboard/my-property-listings/delete/<prop_id>', views.deleteOwnProp, name='deleteprop'),
    path('property-holder/dashboard/update-property/<slug:prop_slug>/', views.updateOwnProp, name='updatePropDetail'),
    path('property-holder/dashboard/my-property-listings/<slug:prop_slug>/', views.ownPropDetail, name='ownPropDetail'),
    path('property-holder/authentication/', views.ownerAuth, name='ownerAuth'),
    path('property-holder/edit-profile/', views.ownerProfile, name='profile'),
    path('property-holder/logout/', views.ownerLogout, name='logout'),
    # ---------- End of Frontend owners/property holder's views ----------

    # Frontend users views
    path('', views.home, name='home'),
    path('properties/', views.properties, name='properties'),
    path('properties/<slug:prop_slug>/', views.propDetails, name='propDetails'),
    path('about/', views.about, name='about'),
    path('contact-us/', views.contact, name='contact'),
    # ---------- End of Frontend users views ----------
]