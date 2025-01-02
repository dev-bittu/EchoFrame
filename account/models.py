from django.contrib.auth.models import AbstractUser
from django.db import models
from .managers import UserManager
    
class User(AbstractUser):
    username = None
    first_name = None
    last_name = None
    email = models.EmailField(unique=True, blank=False, null=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def save(self, *args, **kwargs):
        self.email = self.email.lower()
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.email
    
class Newsletter(models.Model):
    email = models.EmailField(unique=True)

    def save(self, *args, **kwargs):
        self.email = self.email.lower()
        super(Newsletter, self).save(*args, **kwargs)

    def __str__(self):
        return self.email