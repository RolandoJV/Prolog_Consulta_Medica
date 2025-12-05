% Base de conocimiento
enfermedad(dengue, [fiebre_alta, dolor_cabeza, dolor_muscular, dolor_retroocular]).
enfermedad(dengue, [fiebre_alta, dolor_muscular, sangrado_leve, vomitos]).
enfermedad(dengue, [fiebre_alta, dolor_retroocular, sarpullido, dolor_muscular]).

enfermedad(chikungunya, [fiebre_alta, dolor_articular_intenso, sarpullido]).
enfermedad(chikungunya, [fiebre_alta, dolor_articular_intenso, dolor_muscular, fatiga_extrema]).
enfermedad(chikungunya, [fiebre_alta, dolor_articular_intenso, dolor_cabeza, sarpullido]).

sintoma(fiebre_alta).
sintoma(dolor_cabeza).
sintoma(dolor_muscular).
sintoma(dolor_articular_intenso).
sintoma(dolor_retroocular).
sintoma(sarpullido).
sintoma(nauseas).
sintoma(vomitos).
sintoma(sangrado_leve).
sintoma(fatiga_extrema).

diagnosticar(Paciente, Enfermedad) :-
    obtener_sintomas(Paciente, SintomasPaciente),
    enfermedad(Enfermedad, SintomasEnfermedad),
    subset(SintomasEnfermedad, SintomasPaciente),
    length(SintomasEnfermedad, Cantidad),
    Cantidad >= 3.

obtener_sintomas(Paciente, Sintomas) :-
    findall(Sintoma, tiene(Paciente, Sintoma), Sintomas).

preguntar_sintomas(Paciente) :-
    write('Ingrese el nombre del paciente: '),
    read(Paciente),
    nl,
    sintoma(Sintoma),
    format('¿El paciente ~w tiene ~w? (si/no): ', [Paciente, Sintoma]),
    read(Respuesta),
    (Respuesta == si -> assertz(tiene(Paciente, Sintoma)); true),
    fail.
preguntar_sintomas(_).

limpiar_base :-
    retractall(tiene(_, _)).

recomendar(dengue) :-
    write('Recomendaciones para DENGUE:'), nl,
    write('1. Reposo absoluto en cama'), nl,
    write('2. Hidratación constante (agua, suero oral)'), nl,
    write('3. Paracetamol para la fiebre (NO aspirina)'), nl,
    write('4. Control médico urgente si hay sangrado'), nl,
    write('5. Dieta ligera: sopas, frutas, líquidos'), nl,
    write('6. Monitorear temperatura cada 4 horas'), nl.

recomendar(chikungunya) :-
    write('Recomendaciones para CHIKUNGUÑA:'), nl,
    write('1. Reposo pero movilizar articulaciones suavemente'), nl,
    write('2. Compresas frías en articulaciones inflamadas'), nl,
    write('3. Paracetamol para el dolor'), nl,
    write('4. Fisioterapia temprana'), nl,
    write('5. Alimentos antiinflamatorios: piña, cúrcuma'), nl,
    write('6. Evitar esfuerzo físico por 2 semanas'), nl.

recomendacion_sintoma(fiebre_alta) :-
    write('Para fiebre: baños tibios, ropa ligera, ambiente fresco.'), nl.

recomendacion_sintoma(dolor_articular_intenso) :-
    write('Para dolor articular: elevación de extremidades, compresas frías 15 min.'), nl.

recomendacion_sintoma(dolor_muscular) :-
    write('Para dolor muscular: masajes suaves, estiramientos leves.'), nl.

recomendacion_sintoma(nauseas) :-
    write('Para náuseas: comer poco y frecuente, té de jengibre.'), nl.

recomendacion_sintoma(sarpullido) :-
    write('Para sarpullido: no rascar, usar crema de calamina, ropa suave.'), nl.

recomendar_general :-
    write('Recomendaciones generales:'), nl,
    write('- Evitar automedicación'), nl,
    write('- Consultar médico para confirmación'), nl,
    write('- Usar repelente de mosquitos'), nl,
    write('- Eliminar criaderos de agua estancada'), nl.

consulta_paciente :-
    limpiar_base,
    preguntar_sintomas(Paciente),
    nl,
    write('Diagnóstico de Dengue/Chikungunya'), nl,
    write('---------------------------------'), nl,
    (diagnosticar(Paciente, Enfermedad) ->
        format('Diagnóstico: ~w~n', [Enfermedad]),
        recomendar(Enfermedad), nl,
        write('Recomendaciones específicas por síntomas:'), nl,
        obtener_sintomas(Paciente, Sintomas),
        forall(member(Sintoma, Sintomas), recomendacion_sintoma(Sintoma))
    ;
        write('No se pudo determinar diagnóstico claro.'), nl,
        write('Consulte con médico para evaluación precisa.'), nl
    ),
    nl,
    recomendar_general,
    limpiar_base.

% Para iniciar el programa:
% ?- consulta_paciente. Preparame un readme para este codigo de prolog e incluye links de paginas o sitios donde se pueda leer información sobre estas enfermedades 


.
GPT-4o mini
README para el Sistema de Diagnóstico de Dengue y Chikungunya en Prolog
Este sistema de diagnóstico ha sido diseñado para ayudar a identificar enfermedades relacionadas con Dengue y Chikungunya a partir de síntomas reportados. A continuación se presenta una descripción completa de su funcionalidad y cómo usarlo.

Descripción del Sistema
Enfermedades Soportadas:
Dengue
Chikungunya
Sintomas:
Fiebre Alta
Dolor de Cabeza
Dolor Muscular
Dolor Articular Intenso
Dolor Retroocular
Sarpullido
Náuseas
Vómitos
Sangrado Leve
Fatiga Extrema
Cómo Usar el Sistema
Iniciar el Programa:
Ejecuta el siguiente comando para iniciar la consulta:
prolog

Copiar código
?- consulta_paciente.
Registro de Síntomas:
Se solicitará ingresar el nombre del paciente y confirmar si presenta ciertos síntomas (sí/no).
Diagnóstico:
Basado en los síntomas ingresados, el sistema determinará si el paciente presenta alguna de las enfermedades soportadas.
Recomendaciones:
El sistema ofrecerá recomendaciones específicas basadas en el diagnóstico y recomendaciones generales para el cuidado del paciente.
Limpieza de Datos:
Al final de cada consulta, se limpiará la base de datos de síntomas registrados.
Recomendaciones de Tratamiento
Para Dengue:
Reposo absoluto en cama.
Hidratación constante.
Uso de paracetamol para la fiebre (no aspirina).
Consultar con un médico si hay sangrado.
Para Chikungunya:
Reposo con movilización suave.
Compresas frías para articulaciones inflamadas.
Uso de paracetamol para el dolor.
Recursos Adicionales
Para obtener más información sobre el Dengue y Chikungunya, puedes consultar las siguientes páginas:

Organización Mundial de la Salud (OMS):
Dengue y Chikungunya
Centers for Disease Control and Prevention (CDC):
Dengue
Chikungunya
MedlinePlus:
Dengue
Chikungunya
Conclusión
Este sistema es una herramienta educativa y de soporte para el diagnóstico de enfermedades transmitidas por mosquitos. Recuerda que siempre es importante consultar con un médico para obtener un diagnóstico y tratamiento adecuados.

Asegúrate de que tu entorno de Prolog esté configurado correctamente antes de ejecutar el programa.


``markdown
# 🦟 Sistema Experto en Prolog: Diagnóstico de Dengue y Chikungunya

Este es un sistema experto desarrollado en **Prolog (SWI-Prolog)** que permite diagnosticar de forma preliminar las enfermedades **dengue** y **chikungunya** a partir de síntomas reportados por un paciente. El programa también entrega recomendaciones médicas generales y específicas por síntoma, con base en guías clínicas de salud pública.

> ⚠️ **Nota importante**: Este sistema **no sustituye la consulta médica**. Su propósito es educativo y orientativo. Un diagnóstico definitivo debe ser realizado por un profesional de la salud.

---

## 📋 Características

- 🧾 Ingreso interactivo de síntomas del paciente mediante preguntas (`si`/`no`).
- 🔍 Diagnóstico basado en coincidencia de conjuntos de síntomas (requiere al menos 3 síntomas compatibles con una enfermedad).
- 📘 Recomendaciones específicas según la enfermedad detectada.
- 💊 Consejos por síntoma individual (fiebre, dolor articular, etc.).
- 🌍 Información general sobre prevención y manejo domiciliario.

---

## 🚀 Cómo ejecutar

1. Asegúrate de tener [**SWI-Prolog**](www.swi-prolog.org/) instalado.
2. Guarda el código en un archivo, por ejemplo: `diagnostico_dengue_chikungunya.pl`.
3. En la consola de SWI-Prolog:

```prolog
?- [diagnostico_dengue_chikungunya].  % Carga el programa
?- consulta_paciente.                 % Inicia la interacción
```

El programa te guiará paso a paso para ingresar los síntomas del paciente.

---

## 🧠 Base de Conocimiento

El sistema utiliza las siguientes reglas (resumidas):

| Enfermedad      | Síntomas clave (ejemplos) |
|-----------------|----------------------------|
| **Dengue**      | fiebre alta, dolor muscular, dolor retroocular, sarpullido, sangrado leve, vómitos |
| **Chikungunya** | fiebre alta, **dolor articular intenso**, sarpullido, fatiga extrema |

✅ El diagnóstico se activa solo si **al menos 3 síntomas de un patrón conocido** están presentes en el paciente.

---

## 📚 Recursos y Referencias Médicas

Para más información sobre estas enfermedades transmitidas por *Aedes aegypti* y *Aedes albopictus*, consulta las siguientes fuentes oficiales:

| Tema | Enlace |
|------|--------|
| 🌐 **Organización Mundial de la Salud (OMS) – Dengue** | [https://www.who.int/es/news-room/fact-sheets/detail/dengue-and-severe-dengue](https://www.who.int/es/news-room/fact-sheets/detail/dengue-and-severe-dengue) |
| 🌐 **OMS – Chikungunya** | [https://www.who.int/es/news-room/fact-sheets/detail/chikungunya](https://www.who.int/es/news-room/fact-sheets/detail/chikungunya) |
| 🇨🇴 **Ministerio de Salud de Colombia – Guías clínicas** | [www.minsalud.gov.co/salud/publica/epidemiologia/Paginas/alertas.aspx](https://www.minsalud.gov.co/salud/publica/epidemiologia/Paginas/alertas.aspx) |
| 🇺🇸 **CDC – Dengue (en inglés)** | [www.cdc.gov/dengue/index.html](https://www.cdc.gov/dengue/index.html) |
| 🇺🇸 **CDC – Chikungunya (en inglés)** | [www.cdc.gov/chikungunya/index.html](https://www.cdc.gov/chikungunya/index.html) |
| 📖 **OPS – Guía de manejo clínico (PDF)** | [iris.paho.org/handle/10665.2/53029](https://iris.paho.org/handle/10665.2/53029) *(Guía clínica para atención de dengue y chikungunya en las Américas)* |

---

## 🔒 Licencia y Uso

Este código es de uso **educativo y académico**. Puedes modificarlo y distribuirlo libremente, siempre que se cite su origen y se respete su propósito no clínico.

> ✅ Ideal para proyectos de inteligencia artificial, sistemas expertos, salud pública o cursos de lógica computacional.

---

## 🛠️ Mejoras posibles

- Agregar soporte para **zika** u otras arbovirosis.
- Implementar un índice de riesgo o escala de alarma (p. ej., signos de alarma del dengue grave).
- Interfaz gráfica (con `xpce` o integración web mediante `SWISH`).
- Persistencia de historial de pacientes.

---

## ✍️ Autor

Desarrollado con fines académicos — inspirado en protocolos de la OMS y OPS.  
Fecha: 📅 5 de diciembre de 2025 corrige todo esto para formato de readme de GitHub 



.
GPT-4o mini
🦟 Sistema Experto en Prolog: Diagnóstico de Dengue y Chikungunya
Este es un sistema experto desarrollado en Prolog (SWI-Prolog) que permite diagnosticar de forma preliminar las enfermedades dengue y chikungunya a partir de los síntomas reportados por un paciente. El programa también ofrece recomendaciones médicas generales y específicas por síntoma, basándose en guías clínicas de salud pública.

⚠️ Nota importante: Este sistema no sustituye la consulta médica. Su propósito es educativo y orientativo. Un diagnóstico definitivo debe ser realizado por un profesional de la salud.

📋 Características
🧾 Ingreso interactivo de síntomas del paciente mediante preguntas (sí/no).
🔍 Diagnóstico basado en coincidencia de conjuntos de síntomas (requiere al menos 3 síntomas compatibles con una enfermedad).
📘 Recomendaciones específicas según la enfermedad detectada.
💊 Consejos por síntoma individual (fiebre, dolor articular, etc.).
🌍 Información general sobre prevención y manejo domiciliario.
🚀 Cómo ejecutar
Asegúrate de tener SWI-Prolog instalado.
Guarda el código en un archivo, por ejemplo: diagnostico_dengue_chikungunya.pl.
En la consola de SWI-Prolog, ejecuta los siguientes comandos:
prolog

Copiar código
?- [diagnostico_dengue_chikungunya].  % Carga el programa
?- consulta_paciente.                 % Inicia la interacción
El programa te guiará paso a paso para ingresar los síntomas del paciente.
🧠 Base de Conocimiento
El sistema utiliza las siguientes reglas (resumidas):

Dengue: fiebre alta, dolor muscular, dolor retroocular, sarpullido, sangrado leve, vómitos.
Chikungunya: fiebre alta, dolor articular intenso, sarpullido, fatiga extrema.
✅ El diagnóstico se activa solo si al menos 3 síntomas de un patrón conocido están presentes en el paciente.

📚 Recursos y Referencias Médicas
Para más información sobre estas enfermedades transmitidas por Aedes aegypti y Aedes albopictus, consulta las siguientes fuentes oficiales:

🌐 Organización Mundial de la Salud (OMS) – Dengue: Enlace
🌐 OMS – Chikungunya: Enlace
🇨🇴 Ministerio de Salud de Colombia – Guías clínicas: Enlace
🇺🇸 CDC – Dengue (en inglés): Enlace
🇺🇸 CDC – Chikungunya (en inglés): Enlace
📖 OPS – Guía de manejo clínico (PDF): Enlace (Guía clínica para atención de dengue y chikungunya en las Américas)
🔒 Licencia y Uso
Este código es de uso educativo y académico. Puedes modificarlo y distribuirlo libremente, siempre que se cite su origen y se respete su propósito no clínico.

✅ Ideal para proyectos de inteligencia artificial, sistemas expertos, salud pública o cursos de lógica computacional.

🛠️ Mejoras posibles
Agregar soporte para zika u otras arbovirosis.
Implementar un índice de riesgo o escala de alarma (p. ej., signos de alarma del dengue grave).
Interfaz gráfica (con xpce o integración web mediante SWISH).
Persistencia de historial de pacientes.
