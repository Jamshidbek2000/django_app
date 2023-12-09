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

# # ----------- STEP 1 ---------------------
python manage.py startapp base # inside of studybud, base is an app name, it will create an app
# # ----------- STEP 2 ---------------------
# server doesn't know about the project yet, so we need to let it know by
# going to studybud/settings.py, find INSTALLED_APPS and add
# 'base.apps.BaseConfig',

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

