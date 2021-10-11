# Dominio y reglas de negocio
Se trata de una reversión del clásico Space Invaders.
- El personaje principal es la `nave`, a quien el jugador puede controlar.
- Hay también `naves enemigas`, las cuales hay que destruir y las que a su vez intentarán destruirnos.
- La destrucción se produce de dos formas:
  - Disparando `balas`. Una nave que colisiona X cantidad de veces con una bala es destruida.
  - Por colisión entre naves de distinto bando. Ambas son destruidas.
- Hay una cantidad determinada de `niveles`, de `dificultad` creciente
- El **objetivo del juego (global)** es completar todos los niveles.
- El **objetivo parcial** en cada nivel es destruir todas las naves enemigas. Al completarlo, se avanza al siguiente nivel
- La nave posee un **contador de vitalidad**, el cual va decreciendo a medida que recibe impactos de bala o colisiona con naves. A su vez posee una cantidad determinada de **Vidas**. Al ser destruída, pierde una vida. Al perder todas las vidas, el jugador pierde (game over), el juego finaliza y se debe recomenzar.

## La Nave Heroína
- Se mueve a izquierda y derecha.
- Dispara verticalmente.

#### A ver...
- Se mueve hacia adelante y atrás?
- Puede, con algún poder, disparar más de una bala a la vez? en diversos ángulos (45, 90, 135)? con repetición, etc.?

## Balas
Las balas se pueden pensar de manera genérica y luego habra balas amigas y enemigas, las cuales deberían tener distinta visual y tal vez distinto comportamiento.

## Naves enemigas
- Las naves enemigas son de diverso tipo
- Tipos posibles:
  - Soldado razo: disparan de forma sencilla, solo una bala, en un período de tiempo más o menos regular.
  - Kamikaze: además de dispara idem razos, cuando lo deciden, se arrojan hacia la nave héroe
  - ??
- Además, cada 3 niveles, hay un boss, más grande, con un poder especial, que aparece transcurrido cierto tiempo. Los bosses tienen una vitalidad mayor, osea, hay que impactarlos más veces para destruirlos.

## Dinámica de juego
- Se buscan niveles cortos, con dinámica ágil. Para esto las naves enemigas deben exponerse relativamente rápido al ataque de la heroína, lo cual posibilita ser destruidas.
- Al comienzo del nivel, las naves enemigas se encuentran en formación inicial.
- la pantalla posee 3 bandas:
  - SUPERIOR: Ocupa la mayor parte del tablero y es donde forman inicialmente las enemigas
  - MEDIA: Es la zona de confrontación, al romper filas, las enemigas avanzan hasta aqui y realizan ataques
  - INFERIOR: la banda propia, es la zona en que se mueve nuestra heroína
- Las enemigas siguen una determinada `coreografía de ataque`:
  - Estan formadas
  - rompen filas y van a la zona de confrontación para atacar.
  - Si sobreviven, vuelven a la posición inicial

## Momentos del juego
Hay diversos momentos, en tanto modos del programa:
- Pantalla de presentación global. Titulo/logo del juego, ¿Menu?
- Pantalla presentación nivel
- Pantalla de juego (la principal)
- Pantalla de fin del juego (Game over o Win)
- Créditos

## Otros objetos
Puede a su vez haber otros objetos que agreguen dinamismo y jugabilidad al juego
- Asteroides: pueden aparecer de manera fortuita y ser neutros en terminos de bando: afecatar a todos por igual. Desplazarse en determinado ángulo y arrazar con todo a su paso.
- Power ups. Objetos que "caen" y que nuestra nave intentará atrapar para potenciarse: vidas, mejor disparpo, más velocidad, más resistencia, etc.
- Aliados:
  - Autómatas: son objetos que o bien son kamikazes aliados o bien disparan temporalmente contra las enemigas
  - Controlados por el usuario: una funcionalidad forzada a multiplayer en la que el teclado puede controlar más de un objeto a la vez. Ademas de la nave ppal, puede haber o bien naves secundarias, o bien cañones laterales que disparan fijos al presionar una tecla. 