from django.urls import path
from . import views

urlpatterns = [
    path('mydetails/', views.mydetails, name='mydetails'),
]