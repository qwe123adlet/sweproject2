from django.shortcuts import redirect, render
from CRUDOperation.models import *
from django.contrib import messages
from CRUDOperation.forms import Empforms, PatientForms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import AuthenticationForm
from django.core.paginator import Paginator
from CRUDOperation.models import EmpModel

def editpatient(request,id):
    editempobj = Patient.objects.get(id=id)
    return render(request, 'editpatients.html', {"EmpModel":editempobj})


def updatepatient(request,id):
    Updateemp = Patient.objects.get(id=id)
    form = PatientForms(request.POST,instance=Updateemp)
    if form.is_valid():
        form.save()
        messages.success(request,"Record is updated successfully")
        return render(request, 'editpatients.html', {"EmpModel":Updateemp})

def insertpatient(request):
    if request.method == "POST":
        if request.POST.get('dateofbirth') and request.POST.get('iin') and request.POST.get('fullname') and request.POST.get('bloodgroup') and request.POST.get('emergency_number') and request.POST.get('contact') and request.POST.get('address') and request.POST.get('marital') and request.POST.get('registration'):
            saverecord = Patient()
    
            saverecord.dateofbirth = request.POST.get('dateofbirth')
            saverecord.iin = request.POST.get('iin')
            saverecord.fullname = request.POST.get('fullname')
            saverecord.bloodgroup = request.POST.get('bloodgroup')
            saverecord.emergency_number = request.POST.get('emergency_number')
            saverecord.contact = request.POST.get('contact')
            saverecord.address = request.POST.get('address')
            saverecord.marital = request.POST.get('marital')
            saverecord.registration = request.POST.get('registration')
            saverecord.save()
            messages.success(request, "Patient " + saverecord.fullname + " has been added successfully")
            return render(request, 'insertpatients.html')
    else:
        return render(request, 'insertpatients.html')
 

def showemp(request):
    showall = EmpModel.objects.all()
    showallpatients = Patient.objects.all()
    showallappointments = Appointment.objects.all()

    paginator = Paginator(showall, 2)

    page_number = request.GET.get('page')
    data = paginator.get_page(page_number)

    paginator1 = Paginator(showallpatients, 2)

    page_number1 = request.GET.get('page1')
    patdata = paginator1.get_page(page_number1)

    paginator2 = Paginator(showallappointments, 3)

    page_number2 = request.GET.get('page2')
    appdata = paginator2.get_page(page_number2)
    return render(request,'index.html',{"data":data, "patdata":patdata, "appdata":appdata})


def insertemp(request):
    if request.method == "POST":
        if request.POST.get('empname') and request.POST.get('dateofbirth') and request.POST.get('iin') and request.POST.get('contact') and request.POST.get('departmentid') and request.POST.get('specializationid') and request.POST.get('experience') and request.POST.get('photo') and request.POST.get('category') and request.POST.get('price') and request.POST.get('education') and request.POST.get('rating') and request.POST.get('address') and request.POST.get('schedulestart') and request.POST.get('scheduleend'):
            saverecord = EmpModel()
            saverecord.empname = request.POST.get('empname') 
            saverecord.dateofbirth = request.POST.get('dateofbirth')
            saverecord.iin = request.POST.get('iin')
            saverecord.contact = request.POST.get('contact')
            saverecord.departmentid = request.POST.get('departmentid')
            saverecord.specializationid = request.POST.get('specializationid')
            saverecord.experience = request.POST.get('experience')
            saverecord.photo = request.POST.get('photo')
            saverecord.category = request.POST.get('category')
            saverecord.price = request.POST.get('price')
            saverecord.schedulestart = request.POST.get('schedulestart')
            saverecord.scheduleend = request.POST.get('scheduleend')
            saverecord.education = request.POST.get('education')
            saverecord.rating = request.POST.get('rating')
            saverecord.address = request.POST.get('address')
            saverecord.save()
            messages.success(request, "Doctor " + saverecord.empname + " has been added successfully")
            return render(request, 'insert.html')
    else:
        return render(request, 'insert.html')

def editemp(request,id):
    editempobj = EmpModel.objects.get(id=id)
    return render(request, 'edit.html', {"EmpModel":editempobj})


def updateemp(request,id):
    Updateemp = EmpModel.objects.get(id=id)
    form = Empforms(request.POST,instance=Updateemp)
    if form.is_valid():
        form.save()
        messages.success(request,"Record is updated successfully")
        return render(request, 'edit.html', {"EmpModel":Updateemp})


def delemp(request,id):
    delemployee = EmpModel.objects.get(id=id)
    delemployee.delete()
    showdata = EmpModel.objects.all()
    return render(request, "delete.html", {"data":showdata})

def delpatient(request,id):
    delemployee = Patient.objects.get(id=id)
    delemployee.delete()
    showdata = Patient.objects.all()
    return render(request, "deletepatients.html", {"data":showdata})

def delappoint(request,id):
    delemployee = Appointment.objects.get(id=id)
    delemployee.delete()
    showdata = Appointment.objects.all()
    return render(request, "deleteappointment.html", {"data":showdata})    

def doctortableSpec(request,id):
    showdoctors = EmpModel.objects.all().filter(specializationid=id)
    return render(request, 'doctortableSpec.html',{"data":showdoctors})    

def doctortable(request, id):
    showdoctors = EmpModel.objects.all().filter(id=id)
    return render(request,'doctortable.html',{"data":showdoctors})

def timetable(request, id):
    showtime = TimeSlots.objects.all()
    doctor = EmpModel.objects.get(id=id)
    return render(request, 'timetable.html',{"data1": showtime, "doctor" : doctor})      

def showspecialization(request):
    results = EmpModel.objects.all   
    showdoctors = SpecType.objects.all()
    return render(request, 'showspecialization.html',{"data":showdoctors, "showdocs":results})

def searchbar(request):
    if request.method == 'GET':
        search = request.GET.get('search')
        post = EmpModel.objects.all().filter(empname__icontains = search)
        if(post):
            return render(request, 'searchbar.html', {"post": post})
        post1 = EmpModel.objects.all().filter(specializationid__icontains = search)
        if(post1):
            return render(request, 'searchbar.html', {"post1": post1})
        post2 = EmpModel.objects.all().filter(category__icontains = search)
        return render(request, 'searchbar.html', {"post2": post2})

def makeappointment(request, id2, id):
    doctor = EmpModel.objects.get(id = id2)
    specid = doctor.specializationid
    name = doctor.empname
    timeslot = TimeSlots.objects.get(id = id)
    start_time = timeslot.starttime
    end_time = timeslot.endtime
    if request.method == "POST":
        if request.POST.get('fullname') and request.POST.get('app_date') and request.POST.get('contact'):
            saverecord = Appointment()
            saverecord.fullname = request.POST.get('fullname')
            saverecord.app_date = request.POST.get('app_date')
            saverecord.app_start = start_time
            saverecord.app_end = end_time
            saverecord.specializationid = specid
            saverecord.empname = name
            saverecord.contact = request.POST.get('contact')
            saverecord.save()
            messages.success(request, "Appointment for name " + saverecord.fullname + " has been added successfully")
            return render(request,'appointment.html', {"doctor" : doctor, "timeslot" : timeslot})
    else:
        return render(request,'appointment.html', {"doctor" : doctor, "timeslot" : timeslot})

def doctortableSpec(request,id):
    showdoctors = EmpModel.objects.all().filter(specializationid=id)
    return render(request, 'doctortableSpec.html',{"data":showdoctors})    
