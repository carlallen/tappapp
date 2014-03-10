function setupHead(arr) {
  var i = 0;
  var spacing = 15;
  while(i < window.innerWidth) {
    arr[i / spacing] = new Kinetic.Circle({
      x: i + getRandomInt(0, 3),
      y: 25,
      radius: getRandomInt(20, 75),
      fill: '#ffffd5'
    });
    i = i + spacing
  }
  shuffle(arr);
  return arr
}

function animateHead(headArray, layer) {
  var nextFrame =0;

  var anim = new Kinetic.Animation(function(frame) {
    if(frame.time>nextFrame){
      nextFrame=frame.time+250;
      var variant = getRandomInt(0,9).toString()
      var moveHead = 0;
      headArray[getRandomInt(0, headArray.length-30)].setFill("#fff" + variant + "c" + variant)
      for(var j=0; j<headArray.length; j++) {
        moveHead = getRandomReal(0, 1)
        if (headArray[j].getY() + headArray[j].getRadius() + moveHead < 100) {
          headArray[j].setY(headArray[j].getY() + moveHead);  
        }
      }
    }
  }, layer)
  anim.start()
}

function setupCarbonation(arr) {
  var i = 0;
  var spacing = 20;
  while(i < window.innerWidth) {
    arr[i / spacing] = new Kinetic.Circle({
      x: i + getRandomInt(0, 3),
      y: getRandomInt(400, 500),
      radius: getRandomInt(5, 9),
      fill: '#ffb200',
      opacity: getRandom(.01, .3),
      speed: getRandom(1.5, 2.5)
    });
    i = i + spacing
  }
  return arr
}

function animateCarbonation(bubbleArray, layer) {
  var anim = new Kinetic.Animation(function(frame) {
    for(var j=0; j<bubbleArray.length; j++) {
      
      bubbleArray[j].setY(bubbleArray[j].getY() - bubbleArray[j].attrs.speed);
      bubbleArray[j].setX(bubbleArray[j].getX() + getRandomReal(0, 1));
      if(bubbleArray[j].getY() < 0){
        bubbleArray[j].setY(getRandomInt(400, 500))
        bubbleArray[j].setRadius(getRandomInt(5, 9))
      }
    }
  }, layer);
  anim.start()
}

function animateMultipleShapes(id, ht, setupFn, animateFn) {
  var arr = []
  var layer = new Kinetic.Layer()
  var stage = new Kinetic.Stage({
    container: id,
    width: window.innerWidth,
    height: ht
  });

  arr = setupFn(arr)
  for(var j=0; j < arr.length - 1; j++) {
    layer.add(arr[j])
  }
  stage.add(layer)
  animateFn(arr, layer)
}

function headify() {
  animateMultipleShapes('head_container', 100, setupHead, animateHead)
}

function carbonate() {
  animateMultipleShapes('beer_container', 500, setupCarbonation, animateCarbonation)
}

function brew() {
  headify()
  carbonate()
}

