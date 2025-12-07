from django.http import JsonResponse
from django.shortcuts import render
from django.db import IntegrityError

# Create your views here.
from appCliente.services.cliente_services import registrar_cliente, obtener_tipo_documento, buscar_cliente_por_codigo

def registrar_cliente_view(request):

    tipos_documento = obtener_tipo_documento()

    if request.method == "POST":
        data = {
            "codcliente": request.POST.get("codcliente"),
            "idtipodoc": request.POST.get("idtipodoc"),
            "nomcliente": request.POST.get("nomcliente"),
            "apellcliente": request.POST.get("apellcliente"),
            "ndocumento": request.POST.get("ndocumento"),
        }
        try:
            exito = registrar_cliente(data)
            if exito:
                return render(request, "registro_cliente.html", {"success": "Cliente registrado exitosamente.", "tipos_documento": tipos_documento})
            else:
                return render(request, "registro_cliente.html", {"error": "Error al registrar el cliente.", "tipos_documento": tipos_documento})
        
        except IntegrityError:
            return render(request, "registro_cliente.html", {"error": "El código ingresado ya existe.", "tipos_documento": tipos_documento})
        
        except Exception as e:
            return render(request, "registro_cliente.html", {"error": f"Error inesperado: {str(e)}", "tipos_documento": tipos_documento})
        
    return render(request, "registro_cliente.html", {"tipos_documento": tipos_documento})
        

def buscar_cliente_api(request):
    codcliente = request.GET.get("codcliente")
    
    if not codcliente:
        return JsonResponse({"error": "Codigo Requerido"}, status=400)
    
    try:
        data = buscar_cliente_por_codigo(codcliente)

        return JsonResponse({"data": data})
    
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)
