#!usr/bin/perl


use strict;
use warnings;
use CGI qw(:standard);

print header('text/html');
print start_html('Resultado de la Calculadora Sintáctica');

my $ecuacion = param('textlabel');

if (defined $ecuacion) {
    # Limpia la expresión y evalúa
/*Uso de expresiones regulares*/
    if ($ecuacion =~ /^[\d\s\+\-\*\/\(\)]+$/) {
        /* Metodo eval para realizar una operación a la cadena */
        my $resultado = eval $ecuacion;
/* Esta linea evalua los errores, y los printea en pantalla con esta llamada $@ */
        if ($@) {
            print "<p>Error al evaluar la expresión: $@</p>";
        } else {
            print "<p>El resultado de '$ecuacion' es: $resultado</p>";
        }
    } else {
        print "<p>Expresión no válida: '$expresion'</p>";
    }
} else {
    print "<p>No se proporcionó ninguna expresión.</p>";
}
print end_html;
