from django.contrib import admin
from anonsocial.ab.models import User, Board, Thread, Post, Tag

for table in [User, Board, Thread, Post, Tag]:
	admin.site.register(table)
