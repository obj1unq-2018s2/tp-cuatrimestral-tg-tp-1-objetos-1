Liga de Leyendas
----------------

Se nos pide modelar un pequeño sistema de batallas basado en el popular video juego League of Legends (a.k.a. Lol).
El sistema se basará en batallas de campeones contra oleadas de *minions*. 
No habrá, al menos de momento, batallas entre campeones (conocidas popularmente como batallas en equipo).

Las batallas están basadas en un sistema simple de ataque y defensa. 
Cuando un campeón ataca le produce una daño a la oleada de minions igual a los puntos de ataque que posee el campeón. 
Sin embargo, éste recibe a su vez un daño, producido por los minions que se defienden. El daño es igual a la cantidad de minions que conforman la oleada más un plus que es definido en cada oleada.

Parte 1: 
--------

Como se explicó antes, los campeones poseen puntos de ataque y puntos de vida, que varían de campeón en campeón. 
Cuando un campeón batalla acumula puntos de daño; los puntos de vida representan la cantidad de daño que puede resistir el campeón antes de morir. 
De esta forma, cuando los puntos de daño son iguales a los puntos de vida, al campeón se lo considera muerto. 

Para ayudar a la supervivencia del campeón, existen los bloqueos. 
Un bloqueo es la capacidad de resistir todo el daño que el campeón recibe en una batalla contra una oleada de minions. 
Esto quiere decir que, si un campeón posee un bloqueo y batallo contra una oleada de minions, en esa batalla no recibirá daño alguno.
Cada bloqueo sirve para una sola batalla y luego se pierde.

Los campeones pueden equiparse o desequiparse items. 
Esto tiene dos consecuencias:
1. Los items, al ser equipados o desequipados en el campeón, producen un efecto en el campeón (que puede ser tanto positivo como negativo). 
2. Cada item brinda, al campeón que lo tiene equipado, una cantidad de puntos de ataque y otra de puntos vida extra. 
Por lo tanto, para calcular el ataque o la vida de un campeón, debe considerarse la suma entre los puntos base propios del campeón más los que aportan los items que posee equipados.

Considerar los siguientes items que el campeón podría equiparse:
* **Anillo de Doran:** Aporta 60 puntos de vida y 15 de ataque. 
Al equiparse, el campeón recibe 5 puntos de daño y, al desequiparse, recupera 10 puntos de daño.

* **Tomo Amplificador:** Aporta el 25% de los puntos de daño total recibido por el campeón como puntos de vida y el 5% del daño total como puntos de ataque. 
Al equiparse otorga dos bloqueos al campeón, pero al desequiparse otorga 1 bloqueo y recibe 30 puntos de daño.

* **Sombrero de Rabadon:** Es una variante del Tomo Amplificador. Aporta 5 puntos más de vida que un Tomo Amplificador, y el doble de los puntos de ataque base del campeón (o sea, algo distinto de lo que aporta el Tomo Amplificador). 
Al equiparse, hace lo mismo que un Tomo Amplificador pero el campeón ademas recibe 5 puntos extra de daño. Al desequiparse, no hace nada.


Las oleadas de minions están conformadas por la cantidad de minions que la conforman.
No es necesario considerar al minion como un objeto individual, sólo la oleada, que al defenderse de un ataque provoca un daño en el campeón atacante. 
El daño que producido es igual al numero de minions que conforma la oleada, más un plus que varia de oleada en oleada.

### Tests
Realizar, como mínimo, el siguiente test:

* Crear un campeón con 50 puntos de vida y 15 de ataque. 
* Equiparlo con un anillo de Doran y un Tomo Amplificador. 
* Crear una Oleada de 10 minions con un plus de 5 puntos de daño.
* Hacer que el campeón ataque a la oleada de minions tres veces.
* Hacer que se desequipe el Tomo Amplificador y el Anillo.
* Probar que el campeón esta muerto tras haberse desequipado.
