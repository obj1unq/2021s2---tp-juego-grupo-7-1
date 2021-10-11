# Dominio y reglas de negocio
Se trata de una reversión del clásico Space Invaders.
- El personaje principal es la `nave`, a quien el jugador puede controlar.
- Hay también `naves enemigas`, las cuales hay que destruir y las que a su vez intentarán destruirnos.
- La destrucción se produce de dos formas:
  - Disparando `balas`. Una nave que colisiona con una bala es destruida.
  - Por colisión entre naves. Ambas son destruidas.
- Hay una cantidad determinada de `niveles`, de `dificultad` creciente
- El **objetivo del juego (global)** es completar todos los niveles.
- El **objetivo parcial** en cada nivel es destruir todas las naves enemigas. Al completarlo, se avanza al siguiente nivel
- La nave posee una cantidad determinada de _Vidas_. Al ser destruída, pierde una vida. Al perder todas las vidas, el jugador pierde, el juego finaliza y se debe recomenzar.

## La Nave Heroína
- Se mueve a izquierda y derecha.
- Dispara verticalmente.

### A ver...
- Se mueve hacia adelante y atrás?
- Puede, con algún poder, disparar más de una bala a la vez? en diversos ángulos (45, 90, 135)? con repetición, etc.?

## Balas
Las balas se pueden pensar de manera genérica y luego habra balas amigas y enemigas, las cuales deberían tener distinta visual y tal vez distinto comportamiento.
