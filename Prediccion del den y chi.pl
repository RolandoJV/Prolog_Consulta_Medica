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
% ?- consulta_paciente.