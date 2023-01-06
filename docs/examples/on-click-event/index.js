(() => {
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

  // output/Type.Proxy/index.js
  var $$Proxy = /* @__PURE__ */ function() {
    function $$Proxy2() {
    }
    ;
    $$Proxy2.value = new $$Proxy2();
    return $$Proxy2;
  }();

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
    var apply2 = apply(dictApplicative.Apply0());
    var pure1 = pure(dictApplicative);
    return function(f) {
      return function(a) {
        return apply2(pure1(f))(a);
      };
    };
  };

  // output/Control.Bind/index.js
  var bind = function(dict) {
    return dict.bind;
  };
  var composeKleisli = function(dictBind) {
    var bind1 = bind(dictBind);
    return function(f) {
      return function(g) {
        return function(a) {
          return bind1(f(a))(g);
        };
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

  // output/Data.Symbol/index.js
  var reflectSymbol = function(dict) {
    return dict.reflectSymbol;
  };

  // output/Record.Unsafe/foreign.js
  var unsafeGet = function(label) {
    return function(rec) {
      return rec[label];
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

  // output/Data.Show/foreign.js
  var showNumberImpl = function(n) {
    var str = n.toString();
    return isNaN(str + ".0") ? str : str + ".0";
  };

  // output/Data.Show/index.js
  var showRecordFields = function(dict) {
    return dict.showRecordFields;
  };
  var showRecord = function() {
    return function() {
      return function(dictShowRecordFields) {
        var showRecordFields1 = showRecordFields(dictShowRecordFields);
        return {
          show: function(record) {
            return "{" + (showRecordFields1($$Proxy.value)(record) + "}");
          }
        };
      };
    };
  };
  var showNumber = {
    show: showNumberImpl
  };
  var show = function(dict) {
    return dict.show;
  };
  var showRecordFieldsCons = function(dictIsSymbol) {
    var reflectSymbol2 = reflectSymbol(dictIsSymbol);
    return function(dictShowRecordFields) {
      var showRecordFields1 = showRecordFields(dictShowRecordFields);
      return function(dictShow) {
        var show1 = show(dictShow);
        return {
          showRecordFields: function(v) {
            return function(record) {
              var tail = showRecordFields1($$Proxy.value)(record);
              var key = reflectSymbol2($$Proxy.value);
              var focus = unsafeGet(key)(record);
              return " " + (key + (": " + (show1(focus) + ("," + tail))));
            };
          }
        };
      };
    };
  };
  var showRecordFieldsConsNil = function(dictIsSymbol) {
    var reflectSymbol2 = reflectSymbol(dictIsSymbol);
    return function(dictShow) {
      var show1 = show(dictShow);
      return {
        showRecordFields: function(v) {
          return function(record) {
            var key = reflectSymbol2($$Proxy.value);
            var focus = unsafeGet(key)(record);
            return " " + (key + (": " + (show1(focus) + " ")));
          };
        }
      };
    };
  };

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
  var coerce2 = /* @__PURE__ */ coerce();
  var unwrap = function() {
    return coerce2;
  };

  // output/Data.Foldable/index.js
  var foldr = function(dict) {
    return dict.foldr;
  };
  var foldMapDefaultR = function(dictFoldable) {
    var foldr2 = foldr(dictFoldable);
    return function(dictMonoid) {
      var append3 = append(dictMonoid.Semigroup0());
      var mempty3 = mempty(dictMonoid);
      return function(f) {
        return foldr2(function(x) {
          return function(acc) {
            return append3(f(x))(acc);
          };
        })(mempty3);
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
    var bind7 = bind(dictMonad.Bind1());
    var pure3 = pure(dictMonad.Applicative0());
    return function(f) {
      return function(a) {
        return bind7(f)(function(f$prime) {
          return bind7(a)(function(a$prime) {
            return pure3(f$prime(a$prime));
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
        return function(pure3) {
          return function(f) {
            return function(array) {
              function go(bot, top2) {
                switch (top2 - bot) {
                  case 0:
                    return pure3([]);
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
  var $$void2 = /* @__PURE__ */ $$void(functorST);
  var fromFoldable3 = function(dictFoldable) {
    var fromFoldable1 = fromFoldable2(dictFoldable);
    return function(l) {
      return runST(function __do2() {
        var s = newImpl();
        foreach(fromFoldable1(l))(function(v) {
          return $$void2(poke2(v.value0)(v.value1)(s));
        })();
        return s;
      });
    };
  };

  // output/Data.Options/index.js
  var fromFoldable4 = /* @__PURE__ */ fromFoldable3(foldableArray);
  var semigroupOptions = semigroupArray;
  var options = function(v) {
    return unsafeToForeign(fromFoldable4(v));
  };
  var monoidOptions = monoidArray;
  var mempty2 = /* @__PURE__ */ mempty(monoidOptions);
  var defaultToOptions = function(k) {
    return function(v) {
      return [new Tuple(k, unsafeToForeign(v))];
    };
  };
  var opt = function($8) {
    return Op(defaultToOptions($8));
  };
  var assoc = /* @__PURE__ */ unwrap();
  var optional = function(option) {
    return maybe(mempty2)(function(v) {
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
    var $51 = liftEffect(dictMonadEffect);
    return function($52) {
      return $51(log2($52));
    };
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
    type_: /* @__PURE__ */ _opt("type"),
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
  var __new1 = (v1, fn) => new fn(v1);
  var __return0 = (prop, obj) => obj[prop]();
  var __return1 = (prop, v1, obj) => obj[prop](v1);
  var __return2 = (prop, v1, v2, obj) => obj[prop](v1, v2);
  var __return3 = (prop, v1, v2, v3, obj) => obj[prop](v1, v2, v3);
  var _listener3 = (fn) => (v1, v2, v3) => fn(v1)(v2)(v3)();

  // output/Data.Nullable/foreign.js
  function nullable(a, r, f) {
    return a == null ? r : f(a);
  }

  // output/Data.Nullable/index.js
  var toMaybe = function(n) {
    return nullable(n, Nothing.value, Just.create);
  };

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
  var $$void3 = /* @__PURE__ */ $$void(functorEffect);
  var bind2 = /* @__PURE__ */ bind(bindEffect);
  var _setProp = /* @__PURE__ */ runEffectFn3(__setProp);
  var _return3 = /* @__PURE__ */ runEffectFn5(__return3);
  var _return2 = /* @__PURE__ */ runEffectFn4(__return2);
  var _return1 = /* @__PURE__ */ runEffectFn3(__return1);
  var getNullable = function(expr) {
    return function(obj) {
      return _return1(expr)(obj);
    };
  };
  var _return0 = /* @__PURE__ */ runEffectFn2(__return0);
  var _new1 = /* @__PURE__ */ runEffectFn2(__new1);
  var _method2 = function(prop) {
    return function(v1) {
      return function(v2) {
        return function(obj) {
          return function __do2() {
            $$void3(_return2(prop)(v1)(v2)(obj))();
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
          $$void3(_return1(prop)(v1)(obj))();
          return obj;
        };
      };
    };
  };
  var _method0 = function(prop) {
    return function(obj) {
      return function __do2() {
        $$void3(_return0(prop)(obj))();
        return obj;
      };
    };
  };
  var _getProp = /* @__PURE__ */ runEffectFn2(__getProp);
  var safeGet = function(k) {
    return function(obj) {
      return function __do2() {
        var $6 = bind2(_getProp("children")(obj))(getNullable("getByName")(k))();
        return toMaybe($6);
      };
    };
  };

  // output/Graphics.Phaser/index.js
  var bind3 = /* @__PURE__ */ bind(bindEffect);
  var createWithUnsafeConfig = function(cfg) {
    return bind3(bind3(phaser)(_getProp("Game")))(_new1(cfg));
  };
  var createWithConfig = function(opts) {
    return createWithUnsafeConfig(options(opts));
  };
  var config = _gameConfig;

  // output/Graphics.Phaser.Events/index.js
  var on2 = function() {
    return _method2("on");
  };
  var off = /* @__PURE__ */ _method1("off");
  var createEventListener3 = _listener3;

  // output/Graphics.Phaser.GameObject/index.js
  var setPosition = function() {
    return function(v) {
      return _method2("setPosition")(v.x)(v.y);
    };
  };
  var setName = function() {
    return _method1("setName");
  };
  var setInteractive = function() {
    return _method0("setInteractive");
  };
  var setDisplaySize = function() {
    return function(v) {
      return _method2("setDisplaySize")(v.width)(v.height);
    };
  };

  // output/Graphics.Phaser.Loader/index.js
  var bind4 = /* @__PURE__ */ bind(bindEffect);
  var $$void4 = /* @__PURE__ */ $$void(functorEffect);
  var loadImage = function(v) {
    return function(scn) {
      return function __do2() {
        $$void4(bind4(_getProp("load")(scn))(_return2("image")(v.key)(v.path)))();
        return scn;
      };
    };
  };

  // output/Graphics.Phaser.Scene/index.js
  var $$void5 = /* @__PURE__ */ $$void(functorEffect);
  var bind5 = /* @__PURE__ */ bind(bindEffect);
  var preload = function(callback) {
    return function(scene) {
      return function __do2() {
        $$void5(_setProp("preload")(callback(scene))(scene))();
        return scene;
      };
    };
  };
  var newScene = function(key) {
    return bind5(bind5(phaser)(_getProp("Scene")))(_new1(key));
  };
  var getChildByName = function() {
    return safeGet;
  };
  var create = function(callback) {
    return function(scene) {
      return function __do2() {
        $$void5(_setProp("create")(callback(scene))(scene))();
        return scene;
      };
    };
  };

  // output/Graphics.Phaser.Text/index.js
  var composeKleisli2 = /* @__PURE__ */ composeKleisli(bindEffect);
  var create2 = function(v1) {
    return composeKleisli2(_getProp("add"))(_return3("text")(0)(0)(v1));
  };

  // output/Main/index.js
  var bind6 = /* @__PURE__ */ bind(bindEffect);
  var pure2 = /* @__PURE__ */ pure(applicativeEffect);
  var log4 = /* @__PURE__ */ log3(monadEffectEffect);
  var show2 = /* @__PURE__ */ show(/* @__PURE__ */ showRecord()()(/* @__PURE__ */ showRecordFieldsCons({
    reflectSymbol: function() {
      return "x";
    }
  })(/* @__PURE__ */ showRecordFieldsConsNil({
    reflectSymbol: function() {
      return "y";
    }
  })(showNumber))(showNumber)));
  var setPosition2 = /* @__PURE__ */ setPosition();
  var setDisplaySize2 = /* @__PURE__ */ setDisplaySize();
  var $$void6 = /* @__PURE__ */ $$void(functorEffect);
  var setInteractive2 = /* @__PURE__ */ setInteractive();
  var setName2 = /* @__PURE__ */ setName();
  var on3 = /* @__PURE__ */ on2();
  var composeKleisli3 = /* @__PURE__ */ composeKleisli(bindEffect);
  var append2 = /* @__PURE__ */ append(semigroupOptions);
  var getImageByName = /* @__PURE__ */ getChildByName();
  var mainScene = /* @__PURE__ */ function() {
    var title = function(scene) {
      return bind6(create2("Click the logo to trigger an event.")(scene))($$const(pure2(scene)));
    };
    var startButton = function(scene) {
      var callback = function(pointer) {
        return function(localX) {
          return function(localY) {
            return function __do2() {
              log4(show2(pointer))();
              log4(localX)();
              log4(localY)();
              bind6(bind6(create2("logo")(scene))(setPosition2({
                x: 200,
                y: 200
              })))(setDisplaySize2({
                width: 150,
                height: 150
              }))();
              var clickable = getImageByName("clickable_image")(scene)();
              (function() {
                if (clickable instanceof Just) {
                  return $$void6(off("pointerdown")(clickable.value0))();
                }
                ;
                if (clickable instanceof Nothing) {
                  return log4("Clickable image not found")();
                }
                ;
                throw new Error("Failed pattern match at Main (line 72, column 7 - line 74, column 51): " + [clickable.constructor.name]);
              })();
              return unit;
            };
          };
        };
      };
      var listener = createEventListener3(callback);
      return function __do2() {
        var image = bind6(bind6(bind6(bind6(create2("logo")(scene))(setPosition2({
          x: 100,
          y: 100
        })))(setDisplaySize2({
          width: 50,
          height: 50
        })))(setInteractive2))(setName2("clickable_image"))();
        $$void6(on3("pointerdown")(listener)(image))();
        return scene;
      };
    };
    var onpreload = preload(function(scene) {
      return $$void6(loadImage({
        key: "logo",
        path: "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
      })(scene));
    });
    var oncreate = create(composeKleisli3(title)(composeKleisli3(startButton)($$const(pure2(unit)))));
    return bind6(bind6(newScene("main"))(onpreload))(oncreate);
  }();
  var main = function __do() {
    var mainScene$prime = mainScene();
    return createWithConfig(append2(config.width(400))(append2(config.height(300))(config.scene([mainScene$prime]))))();
  };

  // <stdin>
  main();
})();
