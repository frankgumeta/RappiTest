## RappiTest ##

+ Se utilizó CLEAN como arquitectura
  NOTA: Se omitio Interactor y Presenter en la lista y detalle de peliculas ya que no tiene caso crear requests
        vacios para fines del test
+ Se utilizó NSCache para guardar imagenes y FileManager para guardar entidades con protocolo Encodable
+ Las llamadas web se hicieron con URLSession

##Capas##

Persistencia: StorageManager.swift
Red: Networker.swift, URLGenerator.swift
Vistas: Main.storyboard

###¿Cual es el principio de responsabilidad unica?###
Cada clase o moduló debe ser responsable de una parte de la funcionalidad de la app en concreto
Es la "S" de los principios de SOLID "Single Resposibility Principle"

###¿Que caracteristicas tiene un buen codigo?###
+ Reusable
+ Escalable
+ Facilmente Legible
+ Bien documentado
