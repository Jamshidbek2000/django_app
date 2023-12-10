pip install virtualenv
virtualenv env
source env/bin/activate
# deactivate for deactivating
pip install django
django-admin # to see cmds that admin can run
django-admin startproject studybud # will create a project and structure with some files
cd studybud
# python manage.py runserver # for some reason this didnt work
python ./project/studybud/manage.py runserver 0.0.0.0:8000
# moved env dir into studybud. But have to change its creation in Dockerfile

#=============================================
urls.py - all the routing is handled here. when someone visits some url, this will handle it
wsgi.py - is a server
models.py - takes care of db
#=============================================

# # ----------- STEP 1 ---------------------
python manage.py startapp base # inside of studybud, base is an app name, it will create an app
# # ----------- STEP 2 ---------------------
# server doesn't know about the project yet, so we need to let it know by
# going to studybud/settings.py, find INSTALLED_APPS and add
# 'base.apps.BaseConfig',
# this is going to connect new app to the project

# # ----------- STEP 3 ---------------------
# go into studybud/urls.py and make it:
#--------------------------------------------
# from django.contrib import admin
# from django.urls import path
# from django.http import HttpResponse

# def home(request):
# 	return HttpResponse('Home page!')

# urlpatterns = [
#     path('admin/', admin.site.urls),
# 	path('', home),
# ]
#--------------------------------------------

# # ----------- STEP 4 ---------------------
# to make it more structured cut this part:
#--------------------------------------------
# from django.http import HttpResponse

# def home(request):
# 	return HttpResponse('Home page!')

# def room(request):
# 	return HttpResponse('ROOM!')
#--------------------------------------------
# and paste it to base/views.py

# # ----------- STEP 5 ---------------------
# For server to know where this views are we need to 
# create base/urls.py and put this there:
#--------------------------------------------
# from django.urls import path
# from . import views

# urlpatterns = [
# 	path('', views.home, name="home"),
# 	path('room/', views.room, name="room"),
# ]
#--------------------------------------------
# don't forget to delete this views from studybud/urls.py

# # ----------- STEP 6 ---------------------
# include into studybud/urls.py
#--------------------------------------------
# from django.contrib import admin
# from django.urls import path, include 


# urlpatterns = [
#     path('admin/', admin.site.urls),
# 	path('', include('base.urls'))
# ]
#--------------------------------------------

# # ----------- STEP 7 ---------------------
# create dir 'templates' on the same level as env, base, studybud
# and within this folder create
# html file that you will need

# # ----------- STEP 8 ---------------------
# project needs to know about the dir 'templates'
# go to studybud/settings.py and add into TEMPLATES
# inside TEMPLATES change DIRS
# "BASE_DIR /  'templates'"

# # ----------- STEP 9 ---------------------
# to reference the templates Go to base/views and add
# return render(request, 'home.html')

# # ----------- STEP 10 --------------------
# create navbar.html in templates with some code..

# # ----------- STEP 11 --------------------
# include this code inside of home.html
# {% include 'navbar.html' %}

# # ----------- STEP 11 --------------------
# create main.html which will be a wrapper for other files
# and creat DOCTYPE stlye
# after put this to it's body
#--------------------------------------------
#	{% include 'navbar.html' %}
# 	{% block content %}

# 	{% endblock %}
#--------------------------------------------
# don't forget to delete navbar part from other html files


# # ----------- STEP 12 -------------------- 47min
# modify home.html by adding
# {% extends 'main.html' %}


# # ----------- STEP 13 -------------------- 51min
# added list of rooms in base/views.py which we will pass 
# to home.html file for rendering
#--------------------------------------------
# <div>
# 	<div>
# 		{% for room in rooms %}
# 		<div>
# 			<h5>{{room.id}} -- {{room.name}}</h5>
# 		</div>
# 		{% endfor %}
# 	</div>
# </div>
#--------------------------------------------


# # ----------- STEP 14 -------------------- 56min
# to structure it in a better way, created folders
# /base/templates/base and moved home.html from 
# studybud/templates/ to base/templates/base
# And to make the code know where that file is
# change base/views.py
#--------------------------------------------
# def home(request):
# 	context = {'rooms': rooms}
# 	return render(request, 'base/home.html', context)
#--------------------------------------------
# and do the same with room.html


# # ----------- STEP 15 -------------------- 58min
# to be able to go into rooms, go into base/urls.py
#--------------------------------------------
# urlpatterns = [
# 	path('', views.home, name="home"),
# 	path('room/<str:pk>/s', views.room, name="room"),
# ]
#--------------------------------------------
# and now we should make the function room() accept the other var



# # ----------- STEP 16 -------------------- 58min
# click on room names to get to /room/1...
# in home.html
#--------------------------------------------
# <h5>{{room.id}} -- <a href="/room/{{room.id}}">{{room.name}}</a></h5>
#--------------------------------------------




# # ----------- STEP 17 -------------------- 01h 05m
# python manage.py migrate 
# execute for the first time
# in base/models.py 
#--------------------------------------------
# class Room(models.Model):
# 	# host =
# 	# topic =
# 	name = models.CharField(max_length=200)
# 	description = models.TextField(null=True, blank=True)
# 	# participants = 
# 	updated = models.DateTimeField(auto_now=True)
# 	created = models.DateTimeField(auto_now_add=True)
# 	def __str__(self):
# 		return self.name
#--------------------------------------------
# this is going to create a table inside db
# python manage.py makemigrations
# to apply new class added then
# python manage.py migrate
# again, to commit the changes

# create first and new superuser to access db
# python3 manange.py createsuperuser

# update base/admin.py
#--------------------------------------------
# from .models import Room
# admin.site.register(Room)
#--------------------------------------------

# now, it's time to get rooms from db and show on website
# change base/views.py
#--------------------------------------------
# from .models import Room
# def home(request):
# 	rooms = Room.objects.all()
# 	context = {'rooms': rooms}
# 	return render(request, 'base/home.html', context)

# def room(request, pk):
# 	room = Room.objects.get(id=pk)
# 	context = {'room' : room}
# 	return render(request, 'base/room.html', context)
#--------------------------------------------
