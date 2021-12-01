# Objects Invaders

¡La galaxia se encuentra en peligro! Una serie de naves espaciales busca conquistar el espacio explorado conocido, y amenaza con aniquilar toda civilización que se interponga en su camino. Afortunadamente, existe una valerosa nave heroína diseñada para cumplir la dificil tarea de evitar que esto ocurra ¿Te animas a pilotearla? Acompañanos en esta aventura y salvá el cosmos!

Videojuego inspirado en el clásico arcade "Space Invaders" diseñado por Toshihiro Nishikado y publicado en 1978.
Desarrollado en Wollok (version 3.0.0) como trabajo grupal para la materia Programación con Objetos I (UNQ) durante el 2° cuatrimestre de 2021

### Equipo de desarrollo

- Lucio Cristofanetti
- Ivan Gómez
- Nicolás Miñán

## Reglas de Juego 

El juego consta de tres niveles, donde la nave heroína se enfrenta con diversas flotas de naves enemigas.  
El objetivo de cada nivel es destruir todas las naves enemigas antes de que se acabe el tiempo, las balas, o la vida de la nave heroína.  
Si cualquiera de estos indicadores llega a 0 antes de destruir la flota enemiga, se pierde el juego.   
Si la nave heroína consigue superar los tres niveles, se gana el juego y la galaxia estará a salvo.  

## Controles

La nave puede moverse hacia arriba, abajo, y lo laterales con las 4 flechas del teclado  ``↓`` ``→`` ``↑`` ``←`` 
o bien detenerse en el lugar pulsando la tecla ``N``

Al precionar la tecla ``Espacio`` dispara balas de plasma![Bala De Plasma](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/heroBullet.png?token=AVNGJX42M3NJFRLJQH3CZX3BU6ICA) alternando sus cañones en cada tiro.

## Enemigos

Las flotas enemigas van disparando![Bala Enemiga](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/enemyBullet.png?token=AVNGJX5FY5V4RY6CAWQ7JRDBU6IGM) y descenciendo, a la vez que se desplazan lateralmente por la pantalla.
Las mismas se componen de hasta dos tipos de naves:

![Soldado Raso](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/private.png?token=AVNGJXZWIGA47GDB62H25C3BU6G44)  <b>Soldado Raso:</b> esta nave ataca disparando proyectiles esporadicamente. Se trata de una nave fragil, por lo que un disparo es suficiente para destruirla

![Kamikaze](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/kamikaze.png?token=AVNGJX5T7MOZ2PUNLYJ2SOLBU6HBI)  <b>Kamikaze:</b> no solo ataca con proyectiles, eventualmente se sacrifica avalanzandose sobre su oponente. Este enemigo cuenta con una nave mas robusta, pero mas inestable al mismo tiempo. Mientras acompaña la flota, se necesitan dos disparos para aniquilarla. Sin embargo, si la misma toma velocidad y rompe filas, un solo acierto sobre la mísma la hará volar por los aires 

## Vida 

La nave heroína cuenta con 3 puntos de vida. ![Vida](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/life.png?token=AVNGJX634FMWTS2ALXMSEFLBU6HS6) ![Vida](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/life.png?token=AVNGJX634FMWTS2ALXMSEFLBU6HS6) ![Vida](https://raw.githubusercontent.com/obj1unq/2021s2---tp-juego-grupo-7-1/master/assets/life.png?token=AVNGJX634FMWTS2ALXMSEFLBU6HS6)  
Cada disparo recibido le quita 1 punto de vida.  
Si la heroína se estrella con un enemigo, es destruida.  

## Puntaje

Cada enemigo que destruye la nave heroína le otorga un puntaje especifico. La destrucción del Soldado Raso entrega 20 puntos, mientras que la destruccion de un Kamikaze varía segun su estado. Si el mismo se encuentra dentro de la flota, equivale a 40 puntos. Mientras que si se lo destruye cuando toma velocidad, la recompenza son 90 puntos.

El puntaje se conserva siempre que la vida de la nave heroína no llege a agotarse. Si se pierde un nivel, es posible reintentarlo pero el puntaje vuelve a cero.

## Capturas

#### Pantalla de Inicio
![Pantalla de Inicio]()

#### Consigna de Nivel
![Consigna de Nivel]()

#### Gameplay
![Gameplay]()

#### Game Over
![GameOver]()

## Otros

- Una vez terminado, no tenemos problemas en que el repositorio sea público / queremos manternerlo privado
