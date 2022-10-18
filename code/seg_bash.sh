#!/usr/bin/env bash

echo ">>> VER EL CONTENIDO DE LAS BASES DE DATOS"

echo ">> DATOS GENERALES"
cat ../data/seguimiento.csv
echo "> Nº Líneas"
wc -l ../data/seguimiento.csv

echo "-------------------------------------------------------------------------"

echo ">> DATOS DE MI RÍTMO EN LOS KM"
cat ../data/seg_ritmo.csv

echo "> Nº Líneas"
wc -l ../data/seg_ritmo.csv

echo "-------------------------------------------------------------------------"

echo ">> DATOS DE MI RITMO CARDÍACO"

cat ../data/seg_cardiaco.csv

echo "> Nº Líneas"
wc -l ../data/seg_cardiaco.csv

echo "-------------------------------------------------------------------------"

echo ">> DATOS DE MI SUEÑO"

cat ../data/sueno.csv
echo "> Nº Líneas"
wc -l ../data/sueno.csv

