from django.shortcuts import render
import re 
# Create your views here.
def home(request):
    page_title = "home"
    context={
         'page_title':page_title,
     }    
    return render(request,'home.html',context)

def introduction(request):
    page_title = "introduction"
    context={
         'page_title':page_title,
     }     
    return render(request,'introduction.html',context)


def note_historique(request):
    page_title = "Note Historique"
    context={
         'page_title':page_title,
     }     
    return render(request,'note_historique.html',context)

def limpressionnisme(request):
    page_title = "limpressionnisme"
    context={
         'page_title':page_title,
     }     
    return render(request,'limpressionnisme.html',context)

def impressionistes_a(request):
    page_title = "impressionistes_a"
    context={
         'page_title':page_title,
     }     
    return render(request,'impressionistes_A.html',context)

def impressionistes_b(request):
    page_title = "impressionistes_b"
    context={
         'page_title':page_title,
     }     
    return render(request,'impressionistes_B.html',context)

def author(request):
    page_title = "author"
    context={
         'page_title':page_title,
     }     
    return render(request,'author.html',context)

def step_controller(request):
                  #          step1               step2                   step3                   step4                           step5             step6                   step7                      step8               step9               step10
    page_headings = ["La maison Fournaise","La maison Levanneur","L’église de Notre-Dame","L'ancien château Bertin","Le Nymphée de Soufflot","La villa Lambert","Boulevard de la République","L’hôtel de ville","La Place Berteaux","La gare de Chatou"]
    url = request.path.split('/')
    
    page_title = url[2]
    step_file = url[2]+".html"
    res = [re.findall(r'(\w+?)(\d+)', page_title)[0] ] 
    step_number = int(res[0][1])
    print(res[0][1])
    page_heading = page_headings[step_number]
    context={
         'page_title':page_title,
         'step_file':step_file,
         'page_heading':page_heading,
     }     
    return render(request,'step_main.html',context)

# def step0(request):
#     page_title = "step0"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step_main.html',context)

# def step1(request):
#     page_title = "step1"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step1.html',context)

# def step2(request):
#     page_title = "step2"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step2.html',context)

# def step3(request):
#     page_title = "step3"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step3.html',context)

# def step4(request):
#     page_title = "step4"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step4.html',context)

# def step5(request):
#     page_title = "step5"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step5.html',context)

# def step6(request):
#     page_title = "step6"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step6.html',context)

# def step7(request):
#     page_title = "step7"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step7.html',context)

# def step8(request):
#     page_title = "step8"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step8.html',context)

# def step9(request):
#     page_title = "step9"
#     context={
#          'page_title':page_title,
#      }     
#     return render(request,'step9.html',context)