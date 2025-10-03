#!/bin/bash


USER="LeirBaGMC"


Alphabetlower=("abcdefghijklmnopqrstuvwxyz")
AlphabetUpper=("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
Specials=("!#$%&/()=?¡¿+[];:.,")
Digits=("0123456789")

Alphabet = (Alphabetlower, AlphabetUpper, Specials, Digits)

USUARIO="$1"
MAX_LEN="$2"
OPC="${3:-digits}"
TARGET=" http://127.0.0.1:8000 "

host=$(echo "$TARGET" | sed -E 's|https?://([^/:]+).*|\1|')
if [[ "$host" != "127.0.0.1" && "$host" != "localhost" && "$host" != "::1" ]]; then
  echo "ERROR: solo localhost permitido. Host detectado: $host"
  exit 2
fi



URL=" http://127.0.0.1:8000 "

for PASS in "${PASSWORDS[@]}"
do
    echo "Probando contraseña: $PASS"
    RESPONSE=$(curl -s -G --data-urlencode "user=$USER" --data-urlencode "password=$PASS" "$URL")
    
   
    if echo "$RESPONSE" | grep -q "Login exitoso"; then
        echo "Contraseña encontrada: $PASS"
        echo "Respuesta completa: $RESPONSE"
        break
    fi
done