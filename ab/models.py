from django.db.models import *

# Create your models here.

class User(Model):
	name = CharField(max_length=50)
	tripcode = CharField(max_length=50)
	regdate = TimeField(auto_now=True)
	email = EmailField(blank = True)
	password = CharField(max_length=50, blank = True)
	deleted = BooleanField(default = False)
	

	def __unicode__(self):
		return self.name

## add inheritance here

class Board(Model):
	name = CharField(max_length=50)
	dir = CharField(max_length=50)

	def __unicode__(self):
		return self.name

class Msg(Model):
	message = TextField()
	time = TimeField(auto_now=True)
	show_name = BooleanField()
	show_tripcode = BooleanField()

class Thread(Model):
	board = ForeignKey('Board')
	user = ForeignKey('User')
	tag = ForeignKey('Tag')
	subject = CharField(max_length=50)

	def __unicode__(self):
		return self.subject


class Post(Msg):
	thread = ForeignKey('Thread')
	user = ForeignKey('User')
	parent = ForeignKey('Post')
	subject = CharField(max_length=50)

	def __unicode__(self):
		return self.subject

class WallMsg(Msg):
	to_id = CharField(max_length=50)
	from_id = CharField(max_length=50)
	
class PrivMsg(Msg):
	to_id = CharField(max_length=50)
	from_id = CharField(max_length=50)

class Tag(Model):
	name = CharField(max_length=50)
	description = TextField(blank = True)
	

	def __unicode__(self):
		return self.name







