// output/Control.Semigroupoid/index.js
var semigroupoidFn = {
  compose: function(f) {
    return function(g) {
      return function(x) {
        return f(g(x));
      };
    };
  }
};

// output/Control.Category/index.js
var identity = function(dict) {
  return dict.identity;
};
var categoryFn = {
  identity: function(x) {
    return x;
  },
  Semigroupoid0: function() {
    return semigroupoidFn;
  }
};

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

// output/Effect.Class/index.js
var monadEffectEffect = {
  liftEffect: /* @__PURE__ */ identity(categoryFn),
  Monad0: function() {
    return monadEffect;
  }
};
var liftEffect = function(dict) {
  return dict.liftEffect;
};

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

// output/Effect.Console/foreign.js
var log2 = function(s) {
  return function() {
    console.log(s);
  };
};

// output/Effect.Class.Console/index.js
var log3 = function(dictMonadEffect) {
  var $33 = liftEffect(dictMonadEffect);
  return function($34) {
    return $33(log2($34));
  };
};

// output/Graphics.Phaser.GameConfig/index.js
var physics = function(a) {
  return assoc(optional(opt("physics")))(new Just(options(a)));
};
var opt_ = function(attr) {
  return function(val) {
    return assoc(optional(opt(attr)))(new Just(val));
  };
};
var defaultConfig = /* @__PURE__ */ mempty(monoidOptions);
var _gameConfig = {
  width: /* @__PURE__ */ opt_("width"),
  height: /* @__PURE__ */ opt_("height"),
  type_: /* @__PURE__ */ opt_("type_"),
  zoom: /* @__PURE__ */ opt_("zoom"),
  parent: /* @__PURE__ */ opt_("parent"),
  canvas: /* @__PURE__ */ opt_("canvas"),
  canvasStyle: /* @__PURE__ */ opt_("canvasStyle"),
  customEnvironment: /* @__PURE__ */ opt_("customEnvironment"),
  context: /* @__PURE__ */ opt_("context"),
  scene: /* @__PURE__ */ opt_("scene"),
  seed: /* @__PURE__ */ opt_("seed"),
  title: /* @__PURE__ */ opt_("title"),
  url: /* @__PURE__ */ opt_("url"),
  version: /* @__PURE__ */ opt_("version"),
  autofocus: /* @__PURE__ */ opt_("autofocus"),
  input: /* @__PURE__ */ opt_("input"),
  disableContextMenu: /* @__PURE__ */ opt_("disableContextMenu"),
  banner: /* @__PURE__ */ opt_("banner"),
  dom: /* @__PURE__ */ opt_("dom"),
  fps: /* @__PURE__ */ opt_("fps"),
  render: /* @__PURE__ */ opt_("render"),
  callbacks: /* @__PURE__ */ opt_("callbacks"),
  loader: /* @__PURE__ */ opt_("loader"),
  images: /* @__PURE__ */ opt_("images"),
  physics,
  plugins: /* @__PURE__ */ opt_("plugins"),
  scale: /* @__PURE__ */ opt_("scale"),
  audio: /* @__PURE__ */ opt_("audio"),
  pipeline: /* @__PURE__ */ opt_("pipeline"),
  backgroundColor: /* @__PURE__ */ opt_("backgroundColor"),
  antialias: /* @__PURE__ */ opt_("antialias"),
  antialiasGL: /* @__PURE__ */ opt_("antialiasGL"),
  desynchronized: /* @__PURE__ */ opt_("desynchronized"),
  pixelArt: /* @__PURE__ */ opt_("pixelArt"),
  roundPixels: /* @__PURE__ */ opt_("roundPixels"),
  transparent: /* @__PURE__ */ opt_("transparent"),
  clearBeforeRender: /* @__PURE__ */ opt_("clearBeforeRender"),
  preserveDrawingBuffer: /* @__PURE__ */ opt_("preserveDrawingBuffer"),
  premultipliedAlpha: /* @__PURE__ */ opt_("premultipliedAlpha"),
  failIfMajorPerformanceCaveat: /* @__PURE__ */ opt_("failIfMajorPerformanceCaveat"),
  powerPreference: /* @__PURE__ */ opt_("powerPreference"),
  batchSize: /* @__PURE__ */ opt_("batchSize"),
  maxLights: /* @__PURE__ */ opt_("maxLights"),
  maxTextures: /* @__PURE__ */ opt_("maxTextures"),
  mipmapFilter: /* @__PURE__ */ opt_("mipmapFilter"),
  "default": defaultConfig
};

// output/Utils.FFI/foreign.js
var phaser = () => Phaser;
var __getProp = (path, obj) => obj[path];
var __setProp = (path, val, obj) => {
  obj[path] = val;
};
var __new1 = (config2, fn) => new fn(config2);
var __return0 = (prop, obj) => obj[prop]();
var __return1 = (prop, v1, obj) => obj[prop](v1);
var __return2 = (prop, v1, v2, obj) => obj[prop](v1, v2);
var __return3 = (prop, v1, v2, v3, obj) => obj[prop](v1, v2, v3);
var _listener0 = (fn) => () => fn();

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
var _return0 = /* @__PURE__ */ runEffectFn2(__return0);
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
var _method0 = function(prop) {
  return function(obj) {
    return function __do2() {
      $$void(functorEffect)(_return0(prop)(obj))();
      return obj;
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

// output/Graphics.Phaser.Events/index.js
var on2 = function() {
  return _method2("on");
};
var createEventListener0 = _listener0;

// output/Graphics.Phaser.GameObject/index.js
var setPosition = function() {
  return function(v) {
    return _method2("setPosition")(v.x)(v.y);
  };
};
var setInteractive = function() {
  return _method0("setInteractive");
};
var setDisplaySize = function() {
  return function(v) {
    return _method2("setDisplaySize")(v.width)(v.height);
  };
};
var setAngle = function() {
  return _method1("setAngle");
};

// output/Graphics.Phaser.Image/index.js
var create = function(v1) {
  return composeKleisli(bindEffect)(_getProp("add"))(_return3("image")(0)(0)(v1));
};

// output/Graphics.Phaser.Loader/index.js
var loadImage = function(v) {
  return function(scn) {
    return function __do2() {
      $$void(functorEffect)(bind(bindEffect)(_getProp("load")(scn))(_return2("image")(v.key)(v.path)))();
      return scn;
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
var launch = /* @__PURE__ */ _method2("launch");
var getScenePlugin = function() {
  return _getProp("scene");
};
var create2 = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(_setProp("create")(callback(scene))(scene))();
      return scene;
    };
  };
};

// output/Graphics.Phaser.Text/index.js
var create3 = function(v1) {
  return composeKleisli(bindEffect)(_getProp("add"))(_return3("text")(0)(0)(v1));
};

// output/Main/index.js
var secondScene = /* @__PURE__ */ function() {
  var createLogo = composeKleisli(bindEffect)(create("logo"))(composeKleisli(bindEffect)(setPosition()({
    x: 200,
    y: 200
  }))(composeKleisli(bindEffect)(setAngle()(30))(setDisplaySize()({
    width: 50,
    height: 50
  }))));
  return bind(bindEffect)(newScene("snd"))(create2(composeKleisli(bindEffect)(createLogo)($$const(pure(applicativeEffect)(unit)))));
}();
var mainScene = /* @__PURE__ */ function() {
  var startButton = function(scene) {
    var callback = $$void(functorEffect)(function __do2() {
      log3(monadEffectEffect)("clicked!")();
      return bind(bindEffect)(getScenePlugin()(scene))(launch("snd")({}))();
    });
    var listener = createEventListener0(callback);
    return bind(bindEffect)(bind(bindEffect)(bind(bindEffect)(bind(bindEffect)(create("logo")(scene))(setPosition()({
      x: 100,
      y: 100
    })))(setDisplaySize()({
      width: 50,
      height: 50
    })))(setInteractive()))(on2()("pointerdown")(listener));
  };
  return bind(bindEffect)(bind(bindEffect)(newScene("main"))(create2(function(scene) {
    return function __do2() {
      $$void(functorEffect)(create3("Click the logo to create a new scene")(scene))();
      return $$void(functorEffect)(startButton(scene))();
    };
  })))(preload(composeKleisli(bindEffect)(loadImage({
    key: "logo",
    path: "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
  }))($$const(pure(applicativeEffect)(unit)))));
}();
var main = function __do() {
  var mainScene$prime = mainScene();
  var snd$prime = secondScene();
  return createWithConfig(append(semigroupOptions)(config.width(400))(append(semigroupOptions)(config.height(400))(config.scene([mainScene$prime, snd$prime]))))();
};

// <stdin>
main();
