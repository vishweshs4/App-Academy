const Util = require('./util.js')
const MovingObject = require('./moving_object.js')
const Ship = require('./ship.js')

const DEFAULTS = { 
  COLOR: 'gray', 
  RADIUS: 20, 
  SPEED: 5
}; 

function Asteroid(options) { 
  MovingObject.call(this, { 
    pos: options['pos'], 
    vel: Util.randomVec(DEFAULTS['SPEED']), 
    color: DEFAULTS['COLOR'], 
    radius: DEFAULTS['RADIUS'],
    game: options['game']
  })
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) { 
  if (otherObject instanceof Ship) { 
    otherObject.relocate(); 
  }
}


module.exports = Asteroid; 