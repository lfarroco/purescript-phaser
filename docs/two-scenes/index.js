// Generated by purs bundle 0.14.3
var PS = {};
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Control.Apply"] = $PS["Control.Apply"] || {};
  var exports = $PS["Control.Apply"];                
  var Apply = function (Functor0, apply) {
      this.Functor0 = Functor0;
      this.apply = apply;
  };                      
  var apply = function (dict) {
      return dict.apply;
  };
  exports["Apply"] = Apply;
  exports["apply"] = apply;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Control.Applicative"] = $PS["Control.Applicative"] || {};
  var exports = $PS["Control.Applicative"];
  var Control_Apply = $PS["Control.Apply"];          
  var Applicative = function (Apply0, pure) {
      this.Apply0 = Apply0;
      this.pure = pure;
  };
  var pure = function (dict) {
      return dict.pure;
  };
  var liftA1 = function (dictApplicative) {
      return function (f) {
          return function (a) {
              return Control_Apply.apply(dictApplicative.Apply0())(pure(dictApplicative)(f))(a);
          };
      };
  };
  exports["Applicative"] = Applicative;
  exports["pure"] = pure;
  exports["liftA1"] = liftA1;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Control.Bind"] = $PS["Control.Bind"] || {};
  var exports = $PS["Control.Bind"];                 
  var Bind = function (Apply0, bind) {
      this.Apply0 = Apply0;
      this.bind = bind;
  };                     
  var bind = function (dict) {
      return dict.bind;
  };
  var composeKleisli = function (dictBind) {
      return function (f) {
          return function (g) {
              return function (a) {
                  return bind(dictBind)(f(a))(g);
              };
          };
      };
  };
  exports["Bind"] = Bind;
  exports["bind"] = bind;
  exports["composeKleisli"] = composeKleisli;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Control.Monad"] = $PS["Control.Monad"] || {};
  var exports = $PS["Control.Monad"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Control_Bind = $PS["Control.Bind"];                
  var Monad = function (Applicative0, Bind1) {
      this.Applicative0 = Applicative0;
      this.Bind1 = Bind1;
  };
  var ap = function (dictMonad) {
      return function (f) {
          return function (a) {
              return Control_Bind.bind(dictMonad.Bind1())(f)(function (f$prime) {
                  return Control_Bind.bind(dictMonad.Bind1())(a)(function (a$prime) {
                      return Control_Applicative.pure(dictMonad.Applicative0())(f$prime(a$prime));
                  });
              });
          };
      };
  };
  exports["Monad"] = Monad;
  exports["ap"] = ap;
})(PS);
(function(exports) {
  "use strict";

  exports.runFn2 = function (fn) {
    return function (a) {
      return function (b) {
        return fn(a, b);
      };
    };
  };

  exports.runFn3 = function (fn) {
    return function (a) {
      return function (b) {
        return function (c) {
          return fn(a, b, c);
        };
      };
    };
  };
})(PS["Data.Function.Uncurried"] = PS["Data.Function.Uncurried"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Data.Function.Uncurried"] = $PS["Data.Function.Uncurried"] || {};
  var exports = $PS["Data.Function.Uncurried"];
  var $foreign = $PS["Data.Function.Uncurried"];
  exports["runFn2"] = $foreign.runFn2;
  exports["runFn3"] = $foreign.runFn3;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Data.Functor"] = $PS["Data.Functor"] || {};
  var exports = $PS["Data.Functor"];                 
  var Functor = function (map) {
      this.map = map;
  };
  exports["Functor"] = Functor;
})(PS);
(function(exports) {
  "use strict";

  exports.unit = {};
})(PS["Data.Unit"] = PS["Data.Unit"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Data.Unit"] = $PS["Data.Unit"] || {};
  var exports = $PS["Data.Unit"];
  var $foreign = $PS["Data.Unit"];
  exports["unit"] = $foreign.unit;
})(PS);
(function(exports) {
  "use strict";

  exports.pureE = function (a) {
    return function () {
      return a;
    };
  };

  exports.bindE = function (a) {
    return function (f) {
      return function () {
        return f(a())();
      };
    };
  };
})(PS["Effect"] = PS["Effect"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Effect"] = $PS["Effect"] || {};
  var exports = $PS["Effect"];
  var $foreign = $PS["Effect"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Control_Apply = $PS["Control.Apply"];
  var Control_Bind = $PS["Control.Bind"];
  var Control_Monad = $PS["Control.Monad"];
  var Data_Functor = $PS["Data.Functor"];                    
  var monadEffect = new Control_Monad.Monad(function () {
      return applicativeEffect;
  }, function () {
      return bindEffect;
  });
  var bindEffect = new Control_Bind.Bind(function () {
      return applyEffect;
  }, $foreign.bindE);
  var applyEffect = new Control_Apply.Apply(function () {
      return functorEffect;
  }, Control_Monad.ap(monadEffect));
  var applicativeEffect = new Control_Applicative.Applicative(function () {
      return applyEffect;
  }, $foreign.pureE);
  var functorEffect = new Data_Functor.Functor(Control_Applicative.liftA1(applicativeEffect));
  exports["applicativeEffect"] = applicativeEffect;
  exports["bindEffect"] = bindEffect;
})(PS);
(function(exports) {
  "use strict";

  exports.log = function (s) {
    return function () {
      console.log(s);
    };
  };
})(PS["Effect.Console"] = PS["Effect.Console"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Effect.Console"] = $PS["Effect.Console"] || {};
  var exports = $PS["Effect.Console"];
  var $foreign = $PS["Effect.Console"];
  exports["log"] = $foreign.log;
})(PS);
(function(exports) {
  "use strict";

  function create(config) {
    return function () {
      return new Phaser.Game(config);
    };
  }

  exports.create = create;

  exports.addSceneImpl = function (
    { key, init, create, update, preload, state },
    autoStart,
    game
  ) {
    return function () {
      const config = {
        init: function (data_) {
          init(this)(data_)();
        },
        preload: function () {
          preload(this)();
        },
        create: function (data_) {
          create(this)(data_)();
        },
        update: function () {
          update(this)();
        },
      };
      game.scene.add(key, config, autoStart, state);
      return game;
    };
  };
})(PS["Graphics.Phaser"] = PS["Graphics.Phaser"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Graphics.Phaser"] = $PS["Graphics.Phaser"] || {};
  var exports = $PS["Graphics.Phaser"];
  var $foreign = $PS["Graphics.Phaser"];
  var Data_Function_Uncurried = $PS["Data.Function.Uncurried"];                
  var addScene = Data_Function_Uncurried.runFn3($foreign.addSceneImpl);
  exports["addScene"] = addScene;
  exports["create"] = $foreign.create;
})(PS);
(function(exports) {
  "use strict";

  exports.destroyImpl = function (obj) {
    return function () {
      obj.destroy();
      return {};
    };
  };

  exports.getPositionImpl = function ({ x, y }) {
    return function () {
      return { x, y };
    };
  };
  exports.setPositionImpl = function ({ x, y }, obj) {
    return function () {
      obj.setPosition(x, y);
      return obj;
    };
  };
  exports.getAngleImpl = function (obj) {
    return function () {
      return obj.angle;
    };
  };
  exports.setAngleImpl = function (degrees, obj) {
    return function () {
      obj.setAngle(degrees);
      return obj;
    };
  };
  exports.getRadiansImpl = function (obj) {
    return function () {
      return obj.radians;
    };
  };
  exports.setRadiansImpl = function (radians, obj) {
    return function () {
      obj.setRadians(radians);
      return obj;
    };
  };
  exports.getVisibleImpl = function (obj) {
    return function () {
      return obj.visible;
    };
  };
  exports.setVisibleImpl = function (visible, obj) {
    return function () {
      obj.setVisible(visible);
      return obj;
    };
  };

  exports.getAlphaImpl = function (obj) {
    return function () {
      return obj.alpha;
    };
  };
  exports.setAlphaImpl = function (value, obj) {
    return function () {
      obj.setAlpha(value);
      return obj;
    };
  };

  exports.setTintImpl = function (value, obj) {
    return function () {
      obj.setTint(value);
      return obj;
    };
  };
  exports.clearTintImpl = function (obj) {
    return function () {
      obj.clearTint();
      return obj;
    };
  };

  exports.getSizeImpl = function ({ width, height }) {
    return function () {
      return { width, height };
    };
  };
  exports.setSizeImpl = function ({ width, height }, obj) {
    return function () {
      obj.setSize(width, height);
      return obj;
    };
  };

  exports.getDisplaySizeImpl = function ({ displayWidth, displayHeight }) {
    return function () {
      return { width: displayWidth, height: displayHeight };
    };
  };
  exports.setDisplaySizeImpl = function ({ width, height }, obj) {
    return function () {
      obj.setDisplaySize(width, height);
      return obj;
    };
  };

  exports.getOriginImpl = function ({ originX, originY }) {
    return function () {
      return { x: originX, y: originY };
    };
  };
  exports.setOriginImpl = function ({ x, y }, obj) {
    return function () {
      obj.setOrigin(x, y);
      return obj;
    };
  };

  exports.getScaleImpl = function ({ scaleX, scaleY }) {
    return function () {
      return { x: scaleX, y: scaleY };
    };
  };
  exports.setScaleImpl = function ({ x, y }, obj) {
    return function () {
      obj.setScale(x, y);
      return obj;
    };
  };
  exports.getNameImpl = function ({ name }) {
    return function () {
      return name;
    };
  };
  exports.setNameImpl = function (name, obj) {
    return function () {
      obj.setName(name);
      return obj;
    };
  };

  exports.onClickImpl = function (handler, obj) {
    return function () {
      obj.setInteractive().on("pointerdown", (pointer, localX, localY, event) => {
        handler(pointer)({ x: localX, y: localY })(event)(obj)();
      });
      return obj;
    };
  };

  exports.getSceneImpl = function (obj) {
    return function () {
      return obj.scene;
    };
  };
})(PS["Graphics.Phaser.GameObject"] = PS["Graphics.Phaser.GameObject"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Graphics.Phaser.GameObject"] = $PS["Graphics.Phaser.GameObject"] || {};
  var exports = $PS["Graphics.Phaser.GameObject"];
  var $foreign = $PS["Graphics.Phaser.GameObject"];
  var Data_Function_Uncurried = $PS["Data.Function.Uncurried"];                
  var GameObject = function (clearTint, destroy, getAlpha, getAngle, getDisplaySize, getName, getOrigin, getPosition, getRadians, getScale, getScene, getSize, getVisible, onClick, setAlpha, setAngle, setDisplaySize, setName, setOrigin, setPosition, setRadians, setScale, setSize, setTint, setVisible) {
      this.clearTint = clearTint;
      this.destroy = destroy;
      this.getAlpha = getAlpha;
      this.getAngle = getAngle;
      this.getDisplaySize = getDisplaySize;
      this.getName = getName;
      this.getOrigin = getOrigin;
      this.getPosition = getPosition;
      this.getRadians = getRadians;
      this.getScale = getScale;
      this.getScene = getScene;
      this.getSize = getSize;
      this.getVisible = getVisible;
      this.onClick = onClick;
      this.setAlpha = setAlpha;
      this.setAngle = setAngle;
      this.setDisplaySize = setDisplaySize;
      this.setName = setName;
      this.setOrigin = setOrigin;
      this.setPosition = setPosition;
      this.setRadians = setRadians;
      this.setScale = setScale;
      this.setSize = setSize;
      this.setTint = setTint;
      this.setVisible = setVisible;
  };
  var setDisplaySize = function (dict) {
      return dict.setDisplaySize;
  };
  var setAngle = function (dict) {
      return dict.setAngle;
  };
  var onClick = function (dict) {
      return dict.onClick;
  };
  var imageInstance = new GameObject(function (i) {
      return $foreign.clearTintImpl(i);
  }, function (i) {
      return $foreign.destroyImpl(i);
  }, function (i) {
      return $foreign.getAlphaImpl(i);
  }, function (i) {
      return $foreign.getAngleImpl(i);
  }, function (i) {
      return $foreign.getDisplaySizeImpl(i);
  }, function (i) {
      return $foreign.getNameImpl(i);
  }, function (i) {
      return $foreign.getOriginImpl(i);
  }, function (i) {
      return $foreign.getPositionImpl(i);
  }, function (i) {
      return $foreign.getRadiansImpl(i);
  }, function (i) {
      return $foreign.getScaleImpl(i);
  }, function (i) {
      return $foreign.getSceneImpl(i);
  }, function (i) {
      return $foreign.getSizeImpl(i);
  }, function (i) {
      return $foreign.getVisibleImpl(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.onClickImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setAlphaImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setAngleImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setDisplaySizeImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setNameImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setOriginImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setPositionImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setRadiansImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setScaleImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setSizeImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setTintImpl)(i);
  }, function (i) {
      return Data_Function_Uncurried.runFn2($foreign.setVisibleImpl)(i);
  });
  exports["onClick"] = onClick;
  exports["setAngle"] = setAngle;
  exports["setDisplaySize"] = setDisplaySize;
  exports["imageInstance"] = imageInstance;
})(PS);
(function(exports) {
  "use strict";

  exports.create = function (textureKey) {
    return function ({ x, y }) {
      return function (scene) {
        return function () {
          return scene.add.image(x, y, textureKey);
        };
      };
    };
  };
})(PS["Graphics.Phaser.Image"] = PS["Graphics.Phaser.Image"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Graphics.Phaser.Image"] = $PS["Graphics.Phaser.Image"] || {};
  var exports = $PS["Graphics.Phaser.Image"];
  var $foreign = $PS["Graphics.Phaser.Image"];
  exports["create"] = $foreign.create;
})(PS);
(function(exports) {
  'use strict';

  exports.loadImagesImpl = function (images, scene) {
    return function () {
      images.forEach(({ key, path }) => {
        scene.load.image(key, path);
      });

      return scene;
    };
  };
})(PS["Graphics.Phaser.Loader"] = PS["Graphics.Phaser.Loader"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Graphics.Phaser.Loader"] = $PS["Graphics.Phaser.Loader"] || {};
  var exports = $PS["Graphics.Phaser.Loader"];
  var $foreign = $PS["Graphics.Phaser.Loader"];
  var Data_Function_Uncurried = $PS["Data.Function.Uncurried"];            
  var loadImages = Data_Function_Uncurried.runFn2($foreign.loadImagesImpl);
  exports["loadImages"] = loadImages;
})(PS);
(function(exports) {
  "use strict";
  exports.launchByKeyImpl = function (key, data, scene) {
    return function () {
      return scene.scene.launch(key, data);
    };
  };
})(PS["Graphics.Phaser.Scene"] = PS["Graphics.Phaser.Scene"] || {});
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Graphics.Phaser.Scene"] = $PS["Graphics.Phaser.Scene"] || {};
  var exports = $PS["Graphics.Phaser.Scene"];
  var $foreign = $PS["Graphics.Phaser.Scene"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Data_Function_Uncurried = $PS["Data.Function.Uncurried"];
  var Data_Unit = $PS["Data.Unit"];
  var Effect = $PS["Effect"];                                                
  var launchByKey = Data_Function_Uncurried.runFn3($foreign.launchByKeyImpl);  
  var defaultSceneConfig = {
      key: "",
      create: function (_scene) {
          return function (_state) {
              return Control_Applicative.pure(Effect.applicativeEffect)(Data_Unit.unit);
          };
      },
      init: function (_scene) {
          return function (_state) {
              return Control_Applicative.pure(Effect.applicativeEffect)(Data_Unit.unit);
          };
      },
      update: function (_scene) {
          return Control_Applicative.pure(Effect.applicativeEffect)(Data_Unit.unit);
      },
      preload: function (_scene) {
          return Control_Applicative.pure(Effect.applicativeEffect)(Data_Unit.unit);
      },
      state: {}
  };
  exports["defaultSceneConfig"] = defaultSceneConfig;
  exports["launchByKey"] = launchByKey;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.3
  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var exports = $PS["Main"];
  var Control_Bind = $PS["Control.Bind"];
  var Data_Unit = $PS["Data.Unit"];
  var Effect = $PS["Effect"];
  var Effect_Console = $PS["Effect.Console"];
  var Graphics_Phaser = $PS["Graphics.Phaser"];
  var Graphics_Phaser_GameObject = $PS["Graphics.Phaser.GameObject"];
  var Graphics_Phaser_Image = $PS["Graphics.Phaser.Image"];
  var Graphics_Phaser_Loader = $PS["Graphics.Phaser.Loader"];
  var Graphics_Phaser_Scene = $PS["Graphics.Phaser.Scene"];                
  var logoPath = "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png";
  var mainScene = (function () {
      var startButton = function (scene) {
          var callback = function (_vec1) {
              return function (_vec2) {
                  return function (_event) {
                      return function (image) {
                          return function __do() {
                              Effect_Console.log("clicked")();
                              Graphics_Phaser_Scene.launchByKey("snd")({})(scene)();
                              return Data_Unit.unit;
                          };
                      };
                  };
              };
          };
          return function __do() {
              var image = Control_Bind.bind(Effect.bindEffect)(Graphics_Phaser_Image.create("logo")({
                  x: 100.0,
                  y: 100.0
              })(scene))(Graphics_Phaser_GameObject.setDisplaySize(Graphics_Phaser_GameObject.imageInstance)({
                  width: 50,
                  height: 50
              }))();
              Graphics_Phaser_GameObject.onClick(Graphics_Phaser_GameObject.imageInstance)(callback)(image)();
              return scene;
          };
      };
      return {
          key: "main",
          create: function (scene) {
              return function (_state) {
                  return function __do() {
                      startButton(scene)();
                      return Data_Unit.unit;
                  };
              };
          },
          init: Graphics_Phaser_Scene.defaultSceneConfig.init,
          update: Graphics_Phaser_Scene.defaultSceneConfig.update,
          preload: function (scene) {
              return Graphics_Phaser_Loader.loadImages([ {
                  key: "logo",
                  path: logoPath
              } ])(scene);
          },
          state: Graphics_Phaser_Scene.defaultSceneConfig.state
      };
  })();
  var secondScene = (function () {
      var createLogo = Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser_Image.create("logo")({
          x: 200.0,
          y: 200.0
      }))(Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser_GameObject.setAngle(Graphics_Phaser_GameObject.imageInstance)(30.0))(Graphics_Phaser_GameObject.setDisplaySize(Graphics_Phaser_GameObject.imageInstance)({
          width: 50,
          height: 50
      })));
      return {
          key: "snd",
          create: function (scene) {
              return function (v1) {
                  return function __do() {
                      createLogo(scene)();
                      return Data_Unit.unit;
                  };
              };
          },
          init: Graphics_Phaser_Scene.defaultSceneConfig.init,
          update: Graphics_Phaser_Scene.defaultSceneConfig.update,
          preload: function (scene) {
              return Graphics_Phaser_Loader.loadImages([ {
                  key: "logo",
                  path: logoPath
              } ])(scene);
          },
          state: Graphics_Phaser_Scene.defaultSceneConfig.state
      };
  })();
  var runGame = Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser.create)(Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser.addScene(mainScene)(true))(Graphics_Phaser.addScene(secondScene)(false)));
  var main = function __do() {
      runGame({
          width: 800,
          height: 600
      })();
      return Data_Unit.unit;
  };
  exports["main"] = main;
  exports["runGame"] = runGame;
  exports["mainScene"] = mainScene;
  exports["logoPath"] = logoPath;
  exports["secondScene"] = secondScene;
})(PS);
PS["Main"].main();