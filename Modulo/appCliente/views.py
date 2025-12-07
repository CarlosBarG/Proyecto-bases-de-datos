from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from appCliente.services.cliente_services import registrar_cliente

def registrar_cliente_view(request):
    if request.method == "POST":
        data = {
            "codcliente": request.POST.get("codcliente"),
            "idtipodoc": request.POST.get("idtipodoc"),
            "nomcliente": request.POST.get("nomcliente"),
            "apellcliente": request.POST.get("apellcliente"),
            "ndocumento": request.POST.get("ndocumento"),
        }

        exito = registrar_cliente(data)

        if exito:
            return render(request, "registro_exitoso.html")
        else:
            return render(request, "registro_fallido.html")
        
    return render(request, "registrar_cliente.html")