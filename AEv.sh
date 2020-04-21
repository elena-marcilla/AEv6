read -p "Indica el archivo" file
ruta_anterior = `pwd`
ruta_buena = ruta_anterior/1
cd $1
ruta_actual = `pwd`
contador = 0 
contador2 = 0
user = 0
grupos = 0
n = 0
GRUPOS [] = 0
number [] = 0
while [0 -le 1]; do
  if [ruta_buena = ruta_actual]; then
    if [`ls -l | grep $file`]; then
    for i in (cat $file | awk'{print $1}'); do
    contador = $((contador + 1))
    echo "Hay $contador grupos en total:"
    done
    for grupo in `seq 1 $contador`; do
    declare -a GRUPOS = cat $file | awk'{print $1}' | head -$grupo | tail -1 
    done
    for usuarios in (cat $file | awk '{print user}' | head -$contador2 | tail -1); do
    user = $((user+1))
    GRUPOS[$contador2] = usuarios
    declare -a number [$contador2] = $user
    contador2 = $((contador2+1))
    echo "{GRUPOS[$contador2]} $user usuarios"
    for num in number; do
    if [n -lt $num]; then
    n = $num
    else 
    n = $n
    fi
    echo "El mayor grupo es ${GRUPOS[$n]"
    else
    echo "El archivo no existe"
    read -p "Indica el archivo" file
    fi
  fi
done
  

