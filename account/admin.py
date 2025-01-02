from django.contrib import admin
from import_export.admin import ImportExportMixin
from .models import User


# Register your models here.
@admin.register(User)
class UserAdmin(ImportExportMixin):
    list_display = ("id", "email")
