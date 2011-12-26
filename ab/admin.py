from django.contrib import admin
from anonsocial.ab.models import Person, Board, Thread, Post, Tag, PrivMsg

for table in [Person, Board, Thread, Post, Tag, PrivMsg]:
	admin.site.register(table)
