// output/Data.Function/index.js
var $$const = function(a) {
  return function(v) {
    return a;
  };
};

// output/Data.Unit/foreign.js
var unit = void 0;

// output/Data.Functor/index.js
var map = function(dict) {
  return dict.map;
};
var $$void = function(dictFunctor) {
  return map(dictFunctor)($$const(unit));
};

// output/Control.Apply/index.js
var apply = function(dict) {
  return dict.apply;
};

// output/Control.Applicative/index.js
var pure = function(dict) {
  return dict.pure;
};
var liftA1 = function(dictApplicative) {
  return function(f) {
    return function(a) {
      return apply(dictApplicative.Apply0())(pure(dictApplicative)(f))(a);
    };
  };
};

// output/Control.Bind/index.js
var bind = function(dict) {
  return dict.bind;
};
var composeKleisli = function(dictBind) {
  return function(f) {
    return function(g) {
      return function(a) {
        return bind(dictBind)(f(a))(g);
      };
    };
  };
};

// output/Data.Foldable/foreign.js
var foldrArray = function(f) {
  return function(init2) {
    return function(xs) {
      var acc = init2;
      var len = xs.length;
      for (var i = len - 1; i >= 0; i--) {
        acc = f(xs[i])(acc);
      }
      return acc;
    };
  };
};
var foldlArray = function(f) {
  return function(init2) {
    return function(xs) {
      var acc = init2;
      var len = xs.length;
      for (var i = 0; i < len; i++) {
        acc = f(acc)(xs[i]);
      }
      return acc;
    };
  };
};

// output/Data.Semigroup/foreign.js
var concatArray = function(xs) {
  return function(ys) {
    if (xs.length === 0)
      return ys;
    if (ys.length === 0)
      return xs;
    return xs.concat(ys);
  };
};

// output/Data.Semigroup/index.js
var semigroupArray = {
  append: concatArray
};
var append = function(dict) {
  return dict.append;
};

// output/Data.Bounded/foreign.js
var topChar = String.fromCharCode(65535);
var bottomChar = String.fromCharCode(0);
var topNumber = Number.POSITIVE_INFINITY;
var bottomNumber = Number.NEGATIVE_INFINITY;

// output/Data.Maybe/index.js
var Nothing = /* @__PURE__ */ function() {
  function Nothing2() {
  }
  ;
  Nothing2.value = new Nothing2();
  return Nothing2;
}();
var Just = /* @__PURE__ */ function() {
  function Just2(value0) {
    this.value0 = value0;
  }
  ;
  Just2.create = function(value0) {
    return new Just2(value0);
  };
  return Just2;
}();
var maybe = function(v) {
  return function(v1) {
    return function(v2) {
      if (v2 instanceof Nothing) {
        return v;
      }
      ;
      if (v2 instanceof Just) {
        return v1(v2.value0);
      }
      ;
      throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
    };
  };
};

// output/Data.Monoid/index.js
var monoidArray = {
  mempty: [],
  Semigroup0: function() {
    return semigroupArray;
  }
};
var mempty = function(dict) {
  return dict.mempty;
};

// output/Data.Tuple/index.js
var Tuple = /* @__PURE__ */ function() {
  function Tuple2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Tuple2.create = function(value0) {
    return function(value1) {
      return new Tuple2(value0, value1);
    };
  };
  return Tuple2;
}();

// output/Unsafe.Coerce/foreign.js
var unsafeCoerce2 = function(x) {
  return x;
};

// output/Safe.Coerce/index.js
var coerce = function() {
  return unsafeCoerce2;
};

// output/Data.Newtype/index.js
var unwrap = coerce;

// output/Data.Foldable/index.js
var foldr = function(dict) {
  return dict.foldr;
};
var foldMapDefaultR = function(dictFoldable) {
  return function(dictMonoid) {
    return function(f) {
      return foldr(dictFoldable)(function(x) {
        return function(acc) {
          return append(dictMonoid.Semigroup0())(f(x))(acc);
        };
      })(mempty(dictMonoid));
    };
  };
};
var foldableArray = {
  foldr: foldrArray,
  foldl: foldlArray,
  foldMap: function(dictMonoid) {
    return foldMapDefaultR(foldableArray)(dictMonoid);
  }
};

// output/Data.Op/index.js
var Op = function(x) {
  return x;
};

// output/Foreign/foreign.js
var isArray = Array.isArray || function(value) {
  return Object.prototype.toString.call(value) === "[object Array]";
};

// output/Effect/foreign.js
var pureE = function(a) {
  return function() {
    return a;
  };
};
var bindE = function(a) {
  return function(f) {
    return function() {
      return f(a())();
    };
  };
};

// output/Control.Monad/index.js
var ap = function(dictMonad) {
  return function(f) {
    return function(a) {
      return bind(dictMonad.Bind1())(f)(function(f$prime) {
        return bind(dictMonad.Bind1())(a)(function(a$prime) {
          return pure(dictMonad.Applicative0())(f$prime(a$prime));
        });
      });
    };
  };
};

// output/Effect/index.js
var $runtime_lazy = function(name2, moduleName, init2) {
  var state2 = 0;
  var val;
  return function(lineNumber) {
    if (state2 === 2)
      return val;
    if (state2 === 1)
      throw new ReferenceError(name2 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state2 = 1;
    val = init2();
    state2 = 2;
    return val;
  };
};
var monadEffect = {
  Applicative0: function() {
    return applicativeEffect;
  },
  Bind1: function() {
    return bindEffect;
  }
};
var bindEffect = {
  bind: bindE,
  Apply0: function() {
    return $lazy_applyEffect(0);
  }
};
var applicativeEffect = {
  pure: pureE,
  Apply0: function() {
    return $lazy_applyEffect(0);
  }
};
var $lazy_functorEffect = /* @__PURE__ */ $runtime_lazy("functorEffect", "Effect", function() {
  return {
    map: liftA1(applicativeEffect)
  };
});
var $lazy_applyEffect = /* @__PURE__ */ $runtime_lazy("applyEffect", "Effect", function() {
  return {
    apply: ap(monadEffect),
    Functor0: function() {
      return $lazy_functorEffect(0);
    }
  };
});
var functorEffect = /* @__PURE__ */ $lazy_functorEffect(20);

// output/Data.Traversable/foreign.js
var traverseArrayImpl = function() {
  function array1(a) {
    return [a];
  }
  function array2(a) {
    return function(b) {
      return [a, b];
    };
  }
  function array3(a) {
    return function(b) {
      return function(c) {
        return [a, b, c];
      };
    };
  }
  function concat2(xs) {
    return function(ys) {
      return xs.concat(ys);
    };
  }
  return function(apply2) {
    return function(map2) {
      return function(pure2) {
        return function(f) {
          return function(array) {
            function go(bot, top2) {
              switch (top2 - bot) {
                case 0:
                  return pure2([]);
                case 1:
                  return map2(array1)(f(array[bot]));
                case 2:
                  return apply2(map2(array2)(f(array[bot])))(f(array[bot + 1]));
                case 3:
                  return apply2(apply2(map2(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]));
                default:
                  var pivot = bot + Math.floor((top2 - bot) / 4) * 2;
                  return apply2(map2(concat2)(go(bot, pivot)))(go(pivot, top2));
              }
            }
            return go(0, array.length);
          };
        };
      };
    };
  };
}();

// output/Foreign/index.js
var unsafeToForeign = unsafeCoerce2;

// output/Foreign.Object/foreign.js
function runST(f) {
  return f();
}
function toArrayWithKey(f) {
  return function(m) {
    var r = [];
    for (var k in m) {
      if (hasOwnProperty.call(m, k)) {
        r.push(f(k)(m[k]));
      }
    }
    return r;
  };
}
var keys = Object.keys || toArrayWithKey(function(k) {
  return function() {
    return k;
  };
});

// output/Control.Monad.ST.Internal/foreign.js
var map_ = function(f) {
  return function(a) {
    return function() {
      return f(a());
    };
  };
};
var foreach = function(as) {
  return function(f) {
    return function() {
      for (var i = 0, l = as.length; i < l; i++) {
        f(as[i])();
      }
    };
  };
};

// output/Control.Monad.ST.Internal/index.js
var functorST = {
  map: map_
};

// output/Data.Array/foreign.js
var replicateFill = function(count) {
  return function(value) {
    if (count < 1) {
      return [];
    }
    var result = new Array(count);
    return result.fill(value);
  };
};
var replicatePolyfill = function(count) {
  return function(value) {
    var result = [];
    var n = 0;
    for (var i = 0; i < count; i++) {
      result[n++] = value;
    }
    return result;
  };
};
var replicate = typeof Array.prototype.fill === "function" ? replicateFill : replicatePolyfill;
var fromFoldableImpl = function() {
  function Cons2(head, tail) {
    this.head = head;
    this.tail = tail;
  }
  var emptyList = {};
  function curryCons(head) {
    return function(tail) {
      return new Cons2(head, tail);
    };
  }
  function listToArray(list) {
    var result = [];
    var count = 0;
    var xs = list;
    while (xs !== emptyList) {
      result[count++] = xs.head;
      xs = xs.tail;
    }
    return result;
  }
  return function(foldr2) {
    return function(xs) {
      return listToArray(foldr2(curryCons)(emptyList)(xs));
    };
  };
}();
var sortByImpl = function() {
  function mergeFromTo(compare2, fromOrdering, xs1, xs2, from, to) {
    var mid;
    var i;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from + (to - from >> 1);
    if (mid - from > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, from, mid);
    if (to - mid > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, mid, to);
    i = from;
    j = mid;
    k = from;
    while (i < mid && j < to) {
      x = xs2[i];
      y = xs2[j];
      c = fromOrdering(compare2(x)(y));
      if (c > 0) {
        xs1[k++] = y;
        ++j;
      } else {
        xs1[k++] = x;
        ++i;
      }
    }
    while (i < mid) {
      xs1[k++] = xs2[i++];
    }
    while (j < to) {
      xs1[k++] = xs2[j++];
    }
  }
  return function(compare2) {
    return function(fromOrdering) {
      return function(xs) {
        var out;
        if (xs.length < 2)
          return xs;
        out = xs.slice(0);
        mergeFromTo(compare2, fromOrdering, out, xs.slice(0), 0, xs.length);
        return out;
      };
    };
  };
}();

// output/Data.Array.ST/foreign.js
var sortByImpl2 = function() {
  function mergeFromTo(compare2, fromOrdering, xs1, xs2, from, to) {
    var mid;
    var i;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from + (to - from >> 1);
    if (mid - from > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, from, mid);
    if (to - mid > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, mid, to);
    i = from;
    j = mid;
    k = from;
    while (i < mid && j < to) {
      x = xs2[i];
      y = xs2[j];
      c = fromOrdering(compare2(x)(y));
      if (c > 0) {
        xs1[k++] = y;
        ++j;
      } else {
        xs1[k++] = x;
        ++i;
      }
    }
    while (i < mid) {
      xs1[k++] = xs2[i++];
    }
    while (j < to) {
      xs1[k++] = xs2[j++];
    }
  }
  return function(compare2) {
    return function(fromOrdering) {
      return function(xs) {
        return function() {
          if (xs.length < 2)
            return xs;
          mergeFromTo(compare2, fromOrdering, xs, xs.slice(0), 0, xs.length);
          return xs;
        };
      };
    };
  };
}();

// output/Data.Array/index.js
var fromFoldable2 = function(dictFoldable) {
  return fromFoldableImpl(foldr(dictFoldable));
};

// output/Foreign.Object.ST/foreign.js
var newImpl = function() {
  return {};
};
function poke2(k) {
  return function(v) {
    return function(m) {
      return function() {
        m[k] = v;
        return m;
      };
    };
  };
}

// output/Foreign.Object/index.js
var fromFoldable3 = function(dictFoldable) {
  return function(l) {
    return runST(function __do2() {
      var s = newImpl();
      foreach(fromFoldable2(dictFoldable)(l))(function(v) {
        return $$void(functorST)(poke2(v.value0)(v.value1)(s));
      })();
      return s;
    });
  };
};

// output/Data.Options/index.js
var semigroupOptions = semigroupArray;
var options = function(v) {
  return unsafeToForeign(fromFoldable3(foldableArray)(v));
};
var monoidOptions = monoidArray;
var defaultToOptions = function(k) {
  return function(v) {
    return [new Tuple(k, unsafeToForeign(v))];
  };
};
var opt = function($4) {
  return Op(defaultToOptions($4));
};
var assoc = /* @__PURE__ */ unwrap();
var optional = function(option) {
  return maybe(mempty(monoidOptions))(function(v) {
    return assoc(option)(v);
  });
};

// output/Internal.Utils/index.js
var _opt = function(attr) {
  return function(val) {
    return assoc(optional(opt(attr)))(new Just(val));
  };
};

// output/Graphics.Phaser.GameConfig/index.js
var physics = function(a) {
  return assoc(optional(opt("physics")))(new Just(options(a)));
};
var defaultConfig = /* @__PURE__ */ mempty(monoidOptions);
var _gameConfig = {
  width: /* @__PURE__ */ _opt("width"),
  height: /* @__PURE__ */ _opt("height"),
  type_: /* @__PURE__ */ _opt("type_"),
  zoom: /* @__PURE__ */ _opt("zoom"),
  parent: /* @__PURE__ */ _opt("parent"),
  canvas: /* @__PURE__ */ _opt("canvas"),
  canvasStyle: /* @__PURE__ */ _opt("canvasStyle"),
  customEnvironment: /* @__PURE__ */ _opt("customEnvironment"),
  context: /* @__PURE__ */ _opt("context"),
  scene: /* @__PURE__ */ _opt("scene"),
  seed: /* @__PURE__ */ _opt("seed"),
  title: /* @__PURE__ */ _opt("title"),
  url: /* @__PURE__ */ _opt("url"),
  version: /* @__PURE__ */ _opt("version"),
  autofocus: /* @__PURE__ */ _opt("autofocus"),
  input: /* @__PURE__ */ _opt("input"),
  disableContextMenu: /* @__PURE__ */ _opt("disableContextMenu"),
  banner: /* @__PURE__ */ _opt("banner"),
  dom: /* @__PURE__ */ _opt("dom"),
  fps: /* @__PURE__ */ _opt("fps"),
  render: /* @__PURE__ */ _opt("render"),
  callbacks: /* @__PURE__ */ _opt("callbacks"),
  loader: /* @__PURE__ */ _opt("loader"),
  images: /* @__PURE__ */ _opt("images"),
  physics,
  plugins: /* @__PURE__ */ _opt("plugins"),
  scale: /* @__PURE__ */ _opt("scale"),
  audio: /* @__PURE__ */ _opt("audio"),
  pipeline: /* @__PURE__ */ _opt("pipeline"),
  backgroundColor: /* @__PURE__ */ _opt("backgroundColor"),
  antialias: /* @__PURE__ */ _opt("antialias"),
  antialiasGL: /* @__PURE__ */ _opt("antialiasGL"),
  desynchronized: /* @__PURE__ */ _opt("desynchronized"),
  pixelArt: /* @__PURE__ */ _opt("pixelArt"),
  roundPixels: /* @__PURE__ */ _opt("roundPixels"),
  transparent: /* @__PURE__ */ _opt("transparent"),
  clearBeforeRender: /* @__PURE__ */ _opt("clearBeforeRender"),
  preserveDrawingBuffer: /* @__PURE__ */ _opt("preserveDrawingBuffer"),
  premultipliedAlpha: /* @__PURE__ */ _opt("premultipliedAlpha"),
  failIfMajorPerformanceCaveat: /* @__PURE__ */ _opt("failIfMajorPerformanceCaveat"),
  powerPreference: /* @__PURE__ */ _opt("powerPreference"),
  batchSize: /* @__PURE__ */ _opt("batchSize"),
  maxLights: /* @__PURE__ */ _opt("maxLights"),
  maxTextures: /* @__PURE__ */ _opt("maxTextures"),
  mipmapFilter: /* @__PURE__ */ _opt("mipmapFilter"),
  "default": defaultConfig
};

// output/Utils.FFI/foreign.js
var phaser = () => Phaser;
var __getProp = (path, obj) => obj[path];
var __setProp = (path, val, obj) => {
  obj[path] = val;
};
var __new1 = (config2, fn) => new fn(config2);
var __return1 = (prop, v1, obj) => obj[prop](v1);
var __return2 = (prop, v1, v2, obj) => obj[prop](v1, v2);
var __return3 = (prop, v1, v2, v3, obj) => obj[prop](v1, v2, v3);

// output/Effect.Uncurried/foreign.js
var runEffectFn2 = function runEffectFn22(fn) {
  return function(a) {
    return function(b) {
      return function() {
        return fn(a, b);
      };
    };
  };
};
var runEffectFn3 = function runEffectFn32(fn) {
  return function(a) {
    return function(b) {
      return function(c) {
        return function() {
          return fn(a, b, c);
        };
      };
    };
  };
};
var runEffectFn4 = function runEffectFn42(fn) {
  return function(a) {
    return function(b) {
      return function(c) {
        return function(d) {
          return function() {
            return fn(a, b, c, d);
          };
        };
      };
    };
  };
};
var runEffectFn5 = function runEffectFn52(fn) {
  return function(a) {
    return function(b) {
      return function(c) {
        return function(d) {
          return function(e) {
            return function() {
              return fn(a, b, c, d, e);
            };
          };
        };
      };
    };
  };
};

// output/Utils.FFI/index.js
var _setProp = /* @__PURE__ */ runEffectFn3(__setProp);
var _return3 = /* @__PURE__ */ runEffectFn5(__return3);
var _return2 = /* @__PURE__ */ runEffectFn4(__return2);
var _return1 = /* @__PURE__ */ runEffectFn3(__return1);
var _new1 = /* @__PURE__ */ runEffectFn2(__new1);
var _method2 = function(prop) {
  return function(v1) {
    return function(v2) {
      return function(obj) {
        return function __do2() {
          $$void(functorEffect)(_return2(prop)(v1)(v2)(obj))();
          return obj;
        };
      };
    };
  };
};
var _method1 = function(prop) {
  return function(v1) {
    return function(obj) {
      return function __do2() {
        $$void(functorEffect)(_return1(prop)(v1)(obj))();
        return obj;
      };
    };
  };
};
var _getProp = /* @__PURE__ */ runEffectFn2(__getProp);

// output/Graphics.Phaser/index.js
var createWithUnsafeConfig = function(cfg) {
  return bind(bindEffect)(bind(bindEffect)(phaser)(_getProp("Game")))(_new1(cfg));
};
var createWithConfig = function(opts) {
  return createWithUnsafeConfig(options(opts));
};
var config = _gameConfig;

// output/Graphics.Phaser.GameObject/index.js
var setScale = function() {
  return function(v) {
    return _method2("setScale")(v.x)(v.y);
  };
};

// output/Graphics.Phaser.Loader/index.js
var loadSpritesheet = function(v) {
  return function(v2) {
    return function(scn) {
      return bind(bindEffect)(bind(bindEffect)(_getProp("load")(scn))(_return3("spritesheet")(v.key)(v.path)(v2)))($$const(pure(applicativeEffect)(scn)));
    };
  };
};

// output/Graphics.Phaser.Scene/index.js
var preload = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(_setProp("preload")(callback(scene))(scene))();
      return scene;
    };
  };
};
var newScene = function(key) {
  return bind(bindEffect)(bind(bindEffect)(phaser)(_getProp("Scene")))(_new1(key));
};
var create = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(_setProp("create")(callback(scene))(scene))();
      return scene;
    };
  };
};

// output/Graphics.Phaser.Sprite/index.js
var setFrame = /* @__PURE__ */ _method1("setFrame");
var playAnimation = function() {
  return function(v) {
    return function(obj) {
      return bind(bindEffect)(bind(bindEffect)(_getProp("anims")(obj))(_return2("play")(v.key)(v.ignoreIfPlaying)))($$const(pure(applicativeEffect)(obj)));
    };
  };
};
var generateFrameNumbers = function(v1) {
  return function(start) {
    return function(end) {
      return composeKleisli(bindEffect)(_getProp("anims"))(_return2("generateFrameNumbers")(v1)({
        start,
        end
      }));
    };
  };
};
var createAnimation = function(key) {
  return function(frames) {
    return function(frameRate) {
      return function(repeat) {
        return composeKleisli(bindEffect)(_getProp("anims"))(_return1("create")({
          key,
          frames,
          frameRate,
          repeat
        }));
      };
    };
  };
};
var add2 = function(v) {
  return function(v2) {
    return composeKleisli(bindEffect)(_getProp("add"))(_return3("sprite")(v.x)(v.y)(v2));
  };
};

// output/Main/index.js
var ghRoot = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/assets/sprites/";
var onpreload = /* @__PURE__ */ function() {
  return composeKleisli(bindEffect)(loadSpritesheet({
    key: "explosion",
    path: ghRoot + "explosion.png"
  })({
    frameWidth: 64,
    frameHeight: 64
  }))(composeKleisli(bindEffect)(loadSpritesheet({
    key: "balls",
    path: ghRoot + "balls.png"
  })({
    frameWidth: 17,
    frameHeight: 17
  }))($$const(pure(applicativeEffect)(unit))));
}();
var explodeSpriteKey = "explosion";
var explodeAnimationKey = "explodeAnimation";
var oncreate = function(scene) {
  var scale = setScale()({
    x: 3,
    y: 3
  });
  return $$void(functorEffect)(function __do2() {
    var explosionFrames = generateFrameNumbers(explodeSpriteKey)(0)(23)(scene)();
    $$void(functorEffect)(createAnimation(explodeAnimationKey)(explosionFrames)(20)(-1 | 0)(scene))();
    $$void(functorEffect)(bind(bindEffect)(bind(bindEffect)(add2({
      x: 200,
      y: 200
    })(explodeSpriteKey)(scene))(playAnimation()({
      key: explodeAnimationKey,
      ignoreIfPlaying: true
    })))(scale))();
    return $$void(functorEffect)(bind(bindEffect)(bind(bindEffect)(add2({
      x: 200,
      y: 200
    })("balls")(scene))(setFrame(3)))(scale))();
  });
};
var mainScene = /* @__PURE__ */ bind(bindEffect)(/* @__PURE__ */ bind(bindEffect)(/* @__PURE__ */ newScene("main"))(/* @__PURE__ */ create(oncreate)))(/* @__PURE__ */ preload(onpreload));
var main = function __do() {
  var scene = mainScene();
  return createWithConfig(append(semigroupOptions)(config.width(500))(append(semigroupOptions)(config.height(500))(config.scene([scene]))))();
};

// <stdin>
main();
