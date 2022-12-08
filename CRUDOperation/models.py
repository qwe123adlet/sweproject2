from pyexpat import model
from statistics import mode
from django.db import models
from django.contrib.auth.models import AbstractUser

class SpecType(models.Model):
    specializationid = models.CharField(max_length = 100)
    specialization = models.CharField(max_length = 100)

    def __str__(self):
        return self.specialization  


    class Meta:
        db_table = "specializationtype"

class EmpModel(models.Model):
    empname = models.CharField(max_length=100)
    dateofbirth = models.DateField(max_length = 100)
    iin = models.CharField(max_length = 12)
    contact = models.IntegerField()
    departmentid = models.CharField(max_length=100)
    specializationid = models.CharField(max_length=100)
    experience = models.IntegerField()
    photo = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    price = models.IntegerField()
    schedulestart = models.TimeField()
    scheduleend = models.TimeField()
    education = models.CharField(max_length=100)
    rating = models.IntegerField()
    address = models.CharField(max_length=100)
    
    def __str__(self):
        return self.empname

    def __str__(self):
        return self.specializationid

    class Meta:
        db_table = "employee"


class Patient(models.Model):
    dateofbirth = models.DateField(max_length = 100)
    iin = models.CharField(max_length = 100)
    fullname = models.CharField(max_length = 100)
    bloodgroup = models.CharField(max_length = 100)
    emergency_number = models.CharField(max_length = 100)
    contact = models.CharField(max_length = 100)
    address = models.CharField(max_length = 100)
    marital = models.CharField(max_length = 100)
    registration = models.DateField(max_length =100)

    class Meta:
        db_table = "patient"

class Appointment(models.Model):
    fullname = models.CharField(max_length=100)
    app_date = models.DateField(max_length=100)
    specializationid = models.CharField(max_length=100)
    empname = models.CharField(max_length=100)
    contact = models.CharField(max_length=100)
    app_start = models.TimeField()
    app_end = models.TimeField()
    procedure = models.CharField(max_length=100)
    
    class Meta:
        db_table = "appointment"

class TimeSlots(models.Model):
    timedate = models.DateField(max_length=100)
    starttime = models.TimeField(max_length=100)
    endtime = models.TimeField(max_length=100)

    class Meta:
        db_table = "timeslots"

class Procedures(models.Model):
    procid = models.CharField(max_length=100)
    typeofprocedure = models.CharField(max_length=100)

    def __str__(self):
        return self.typeofprocedure  

    class Meta:
        db_table = "procedures"

