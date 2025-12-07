from django.urls import path
from . import views

urlpatterns = [
    path('registro/', views.registrar_cliente_view, name='registro_cliente'),
    path('buscar', views.buscar_cliente_api, name='buscar_cliente_api'),
]