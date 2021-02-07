#!/bin/bash

# Rellenar huecos
num=1

for ((i=1;i<=9;i++))
do

    	if (!( test -f /etc/copias_seguridad/fichero_conf_$i.tar ))
	then
	    num=$i
	fi
done

if (test $num -eq 1 )
then
    # Reemplazar el más antiguo
    for ((i=2;i<9;i++))
	do
	    if ( test /etc/copias_seguridad/fichero_conf_$i.tar -ot /etc/copias_suguridad/fichero_conf_$num.tar)
	    then
	        num=$i
	    fi
	done
fi

tar -cvf /etc/copias_seguridad/fichero_conf_$num.tar /etc/*.conf

