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
