var turno = 1;

var pikachu = {
    vida: 100,
    ataque: 55,
    win: function() {
        console.log('Pikachu ha ganado!')
    }
}

var jigglypuff = {
    vida: 100,
    ataque: 45,
    win: function() {
        console.log('Jigglypuff ha ganado!')
    }
}

while (pikachu.vida * jigglypuff.vida > 0) {
    if (turno == 1) {
        jigglypuff.vida -= pikachu.ataque;
        turno++;
        console.log('Jigglypuff ahora tiene ' + jigglypuff.vida + ' puntos de vida');
    } else {
        pikachu.vida -= jigglypuff.ataque;
        turno = 1;
        console.log('Pikachu ahora tiene ' + pikachu.vida + ' puntos de vida');
    }
}

if (pikachu.vida >= 0) {
    pikachu.win();
} else {
    jigglypuff.win();
}
