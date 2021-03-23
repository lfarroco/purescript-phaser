'use strict';

exports.createGame = function(config) {
  return function() {
    return new Phaser.Game(config);
  };
};

//exports.addTween = function({
//  scene,
//  targets,
//  props,
//  delay,
//  duration,
//  ease,
//  repeat,
//  yoyo,
//}) {
//  return function() {
//    // use tween.setCallBack to define callback
//    let p = {
//      targets,
//      delay,
//      duration,
//      ease,
//      repeat,
//      yoyo,
//    };

//    // spread props into the parameter object
//    Object.keys(props).forEach((k) => {
//      p[k] = props[k];
//    });

//    return scene.add.tween(p);
//  };
//};

//exports.delay_ = function(scene) {
//  return function(delay) {
//    return function(onError, onSuccess) {
//      scene.time.addEvent({
//        delay,
//        callback: onSuccess,
//      });
//      return function(cancelError, cancelerError, cancelerSuccess) {
//        req.cancel();
//        cancelerSuccess();
//      };
//    };
//  };
//};

//exports.text = function({scene, pos, text, config}) {
//  return function() {
//    return scene.add.text(pos.x, pos.y, text, config);
//  };
//};

//exports.imageOnPointerUp = function(image) {
//  return function(listener) {
//    return function() {
//      image.setInteractive();
//      image.on('pointerup', function(_) {
//        listener()();
//      });
//    };
//  };
//};

//exports.containerOnPointerUp = function(container) {
//  return function(event) {
//    return function(listener) {
//      return function() {
//        container.setInteractive(
//          new Phaser.Geom.Rectangle(
//            container.width / 2,
//            container.height / 2,
//            container.width,
//            container.height,
//          ),
//          Phaser.Geom.Rectangle.Contains,
//        );

//        container.on('pointerup', function(pointer) {
//          const {x, y} = pointer.position;

//          // Not passing e.position directly because it is a reference to the pointer
//          // and its value changes over time
//          listener(event({x, y}))();
//        });

//        return {};
//      };
//    };
//  };
//};

//exports.destroy = function(element) {
//  return function() {
//    element.destroy();
//  };
//};
//exports.setTint = function({image, color}) {
//  return function() {
//    image.setTint(color);
//  };
//};
//exports.clearTint = function(image) {
//  return function() {
//    image.clearTint();
//  };
//};

//exports.onUpdate = function({scene, callback}) {
//  return function() {
//    scene.events.on('update', function(time, delta) {
//      callback(time)(delta)();
//    });
//  };
//};
//exports.removeOnUpdate = function(scene) {
//  return function() {
//    return function() {
//      scene.events.update.removeAll();
//    };
//  };
//};

//exports.makeTileMap = function({scene, data, tileWidth, tileHeight}) {
//  return () => {
//    return scene.make.tilemap({data, tileWidth, tileHeight});
//  };
//};

//exports.addTilesetImage = function({tileMap, key, tileWidth, tileHeight}) {
//  return () => {
//    console.log(`....`, key);
//    return tileMap.addTilesetImage(key, null, tileWidth, tileHeight);
//  };
//};

//exports.createLayer = function({tileMap, tileset}) {
//  return () => {
//    return tileMap.createLayer(0, tileset, 0, 0);
//  };
//};

//exports.setMainCameraBounds = ({scene, x, y, width, height}) => {
//  scene.cameras.main.setBounds(x, y, width, height);
//  return {};
//};
