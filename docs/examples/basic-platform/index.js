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
  var flip = function(f) {
    return function(b) {
      return function(a) {
        return f(a)(b);
      };
    };
  };
  var $$const = function(a) {
    return function(v) {
      return a;
    };
  };

  // output/Data.Functor/foreign.js
  var arrayMap = function(f) {
    return function(arr) {
      var l = arr.length;
      var result = new Array(l);
      for (var i = 0; i < l; i++) {
        result[i] = f(arr[i]);
      }
      return result;
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
  var functorArray = {
    map: arrayMap
  };

  // output/Control.Apply/index.js
  var identity2 = /* @__PURE__ */ identity(categoryFn);
  var apply = function(dict) {
    return dict.apply;
  };
  var applySecond = function(dictApply) {
    var apply1 = apply(dictApply);
    var map3 = map(dictApply.Functor0());
    return function(a) {
      return function(b) {
        return apply1(map3($$const(identity2))(a))(b);
      };
    };
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

  // output/Data.Array/foreign.js
  var range = function(start) {
    return function(end) {
      var step = start > end ? -1 : 1;
      var result = new Array(step * (end - start) + 1);
      var i = start, n = 0;
      while (i !== end) {
        result[n++] = i;
        i += step;
      }
      result[n] = i;
      return result;
    };
  };
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

  // output/Control.Monad/index.js
  var ap = function(dictMonad) {
    var bind9 = bind(dictMonad.Bind1());
    var pure6 = pure(dictMonad.Applicative0());
    return function(f) {
      return function(a) {
        return bind9(f)(function(f$prime) {
          return bind9(a)(function(a$prime) {
            return pure6(f$prime(a$prime));
          });
        });
      };
    };
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
  var traverse_ = function(dictApplicative) {
    var applySecond2 = applySecond(dictApplicative.Apply0());
    var pure6 = pure(dictApplicative);
    return function(dictFoldable) {
      var foldr2 = foldr(dictFoldable);
      return function(f) {
        return foldr2(function($454) {
          return applySecond2(f($454));
        })(pure6(unit));
      };
    };
  };
  var for_ = function(dictApplicative) {
    var traverse_1 = traverse_(dictApplicative);
    return function(dictFoldable) {
      return flip(traverse_1(dictFoldable));
    };
  };
  var foldMapDefaultR = function(dictFoldable) {
    var foldr2 = foldr(dictFoldable);
    return function(dictMonoid) {
      var append2 = append(dictMonoid.Semigroup0());
      var mempty3 = mempty(dictMonoid);
      return function(f) {
        return foldr2(function(x) {
          return function(acc) {
            return append2(f(x))(acc);
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
      return function(map3) {
        return function(pure6) {
          return function(f) {
            return function(array) {
              function go(bot, top2) {
                switch (top2 - bot) {
                  case 0:
                    return pure6([]);
                  case 1:
                    return map3(array1)(f(array[bot]));
                  case 2:
                    return apply2(map3(array2)(f(array[bot])))(f(array[bot + 1]));
                  case 3:
                    return apply2(apply2(map3(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]));
                  default:
                    var pivot = bot + Math.floor((top2 - bot) / 4) * 2;
                    return apply2(map3(concat2)(go(bot, pivot)))(go(pivot, top2));
                }
              }
              return go(0, array.length);
            };
          };
        };
      };
    };
  }();

  // output/Data.Traversable/index.js
  var identity3 = /* @__PURE__ */ identity(categoryFn);
  var traverse = function(dict) {
    return dict.traverse;
  };
  var sequenceDefault = function(dictTraversable) {
    var traverse2 = traverse(dictTraversable);
    return function(dictApplicative) {
      return traverse2(dictApplicative)(identity3);
    };
  };
  var traversableArray = {
    traverse: function(dictApplicative) {
      var Apply0 = dictApplicative.Apply0();
      return traverseArrayImpl(apply(Apply0))(map(Apply0.Functor0()))(pure(dictApplicative));
    },
    sequence: function(dictApplicative) {
      return sequenceDefault(traversableArray)(dictApplicative);
    },
    Functor0: function() {
      return functorArray;
    },
    Foldable1: function() {
      return foldableArray;
    }
  };
  var sequence = function(dict) {
    return dict.sequence;
  };

  // output/Data.Array/index.js
  var fromFoldable = function(dictFoldable) {
    return fromFoldableImpl(foldr(dictFoldable));
  };

  // output/Data.Int/foreign.js
  var toNumber = function(n) {
    return n;
  };

  // output/Data.Op/index.js
  var Op = function(x) {
    return x;
  };

  // output/Foreign/foreign.js
  var isArray = Array.isArray || function(value) {
    return Object.prototype.toString.call(value) === "[object Array]";
  };

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
    var fromFoldable1 = fromFoldable(dictFoldable);
    return function(l) {
      return runST(function __do() {
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
  var defaultPhysicsConfig = /* @__PURE__ */ _opt("default");
  var defaultConfig = /* @__PURE__ */ mempty(monoidOptions);
  var arcade = /* @__PURE__ */ _opt("arcade");
  var _physicsConfig = {
    "default": defaultPhysicsConfig,
    arcade
  };
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
  var _listener2 = (fn) => (v1, v2) => fn(v1)(v2)();

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
          return function __do() {
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
        return function __do() {
          $$void3(_return1(prop)(v1)(obj))();
          return obj;
        };
      };
    };
  };
  var _method0 = function(prop) {
    return function(obj) {
      return function __do() {
        $$void3(_return0(prop)(obj))();
        return obj;
      };
    };
  };
  var _getProp = /* @__PURE__ */ runEffectFn2(__getProp);
  var safeGet = function(k) {
    return function(obj) {
      return function __do() {
        var $6 = bind2(_getProp("children")(obj))(getNullable("getByName")(k))();
        return toMaybe($6);
      };
    };
  };

  // output/Graphics.Phaser/index.js
  var bind3 = /* @__PURE__ */ bind(bindEffect);
  var physicsConfig = _physicsConfig;
  var createWithUnsafeConfig = function(cfg) {
    return bind3(bind3(phaser)(_getProp("Game")))(_new1(cfg));
  };
  var createWithConfig = function(opts) {
    return createWithUnsafeConfig(options(opts));
  };
  var config = _gameConfig;

  // output/Graphics.Phaser.Events/index.js
  var createEventListener2 = _listener2;

  // output/Graphics.Phaser.ArcadePhysics/index.js
  var bind4 = /* @__PURE__ */ bind(bindEffect);
  var pure2 = /* @__PURE__ */ pure(applicativeEffect);
  var composeKleisli2 = /* @__PURE__ */ composeKleisli(bindEffect);
  var setVelocityY = function() {
    return function(v1) {
      return function(obj) {
        return bind4(bind4(_getProp("body")(obj))(_method1("setVelocityY")(v1)))($$const(pure2(obj)));
      };
    };
  };
  var setVelocityX = function() {
    return function(v1) {
      return function(obj) {
        return bind4(bind4(_getProp("body")(obj))(_method1("setVelocityX")(v1)))($$const(pure2(obj)));
      };
    };
  };
  var setImmovable = function() {
    return _method1("setImmovable");
  };
  var setCollideWorldBounds = function() {
    return _method1("setCollideWorldBounds");
  };
  var setBounce = function() {
    return function(v1) {
      return function(obj) {
        return bind4(bind4(_getProp("body")(obj))(_method1("setBounce")(v1)))($$const(pure2(obj)));
      };
    };
  };
  var setAllowGravity = function() {
    return function(v1) {
      return function(obj) {
        return bind4(bind4(_getProp("body")(obj))(_return1("setAllowGravity")(v1)))($$const(pure2(obj)));
      };
    };
  };
  var refreshBody = function() {
    return _method0("refreshBody");
  };
  var getTouching = function() {
    return composeKleisli2(_getProp("body"))(_getProp("touching"));
  };
  var disableBody = function() {
    return _method2("disableBody")(true)(true);
  };
  var createStaticGroup = /* @__PURE__ */ composeKleisli2(/* @__PURE__ */ _getProp("add"))(/* @__PURE__ */ _return0("staticGroup"));
  var createChild = function() {
    return function(v) {
      return function(v2) {
        return _return3("create")(v.x)(v.y)(v2);
      };
    };
  };
  var createArcadeSprite = function(v) {
    return function(v2) {
      return composeKleisli2(_getProp("add"))(_return3("sprite")(v.x)(v.y)(v2));
    };
  };
  var createArcadeImage = function(v) {
    return function(v2) {
      return composeKleisli2(_getProp("add"))(_return3("image")(v.x)(v.y)(v2));
    };
  };
  var addOverlap = function() {
    return function() {
      return function() {
        return function() {
          return function(v1) {
            return function(v2) {
              return function(v3) {
                return function(plugin) {
                  var listener = createEventListener2(v3);
                  return bind4(bind4(_getProp("add")(plugin))(_return3("overlap")(v1)(v2)(listener)))($$const(pure2(plugin)));
                };
              };
            };
          };
        };
      };
    };
  };
  var addCollider = function() {
    return function() {
      return function(v1) {
        return function(v2) {
          return function(plugin) {
            return bind4(bind4(_getProp("add")(plugin))(_return2("collider")(v1)(v2)))($$const(pure2(plugin)));
          };
        };
      };
    };
  };

  // output/Graphics.Phaser.GameObject/index.js
  var setScale = function() {
    return function(v) {
      return _method2("setScale")(v.x)(v.y);
    };
  };
  var setPosition = function() {
    return function(v) {
      return _method2("setPosition")(v.x)(v.y);
    };
  };
  var setName = function() {
    return _method1("setName");
  };
  var getX = function() {
    return _getProp("x");
  };

  // output/Graphics.Phaser.Image/index.js
  var composeKleisli3 = /* @__PURE__ */ composeKleisli(bindEffect);
  var create = function(v1) {
    return composeKleisli3(_getProp("add"))(_return3("image")(0)(0)(v1));
  };

  // output/Graphics.Phaser.Input.InputPlugin/index.js
  var composeKleisli4 = /* @__PURE__ */ composeKleisli(bindEffect);
  var isDown = /* @__PURE__ */ _getProp("isDown");
  var createCursorKeys = /* @__PURE__ */ composeKleisli4(/* @__PURE__ */ _getProp("input"))(/* @__PURE__ */ composeKleisli4(/* @__PURE__ */ _getProp("keyboard"))(/* @__PURE__ */ _return0("createCursorKeys")));

  // output/Graphics.Phaser.Loader/index.js
  var bind5 = /* @__PURE__ */ bind(bindEffect);
  var pure3 = /* @__PURE__ */ pure(applicativeEffect);
  var $$void4 = /* @__PURE__ */ $$void(functorEffect);
  var loadSpritesheet = function(v) {
    return function(v2) {
      return function(scn) {
        return bind5(bind5(_getProp("load")(scn))(_return3("spritesheet")(v.key)(v.path)(v2)))($$const(pure3(scn)));
      };
    };
  };
  var loadImage = function(v) {
    return function(scn) {
      return function __do() {
        $$void4(bind5(_getProp("load")(scn))(_return2("image")(v.key)(v.path)))();
        return scn;
      };
    };
  };

  // output/Graphics.Phaser.Scene/index.js
  var $$void5 = /* @__PURE__ */ $$void(functorEffect);
  var bind6 = /* @__PURE__ */ bind(bindEffect);
  var update = function(callback) {
    return function(scene) {
      return function __do() {
        $$void5(_setProp("update")(callback(scene))(scene))();
        return scene;
      };
    };
  };
  var preload = function(callback) {
    return function(scene) {
      return function __do() {
        $$void5(_setProp("preload")(callback(scene))(scene))();
        return scene;
      };
    };
  };
  var newScene = function(key) {
    return bind6(bind6(phaser)(_getProp("Scene")))(_new1(key));
  };
  var getPhysicsPlugin = /* @__PURE__ */ _getProp("physics");
  var getChildByName = function() {
    return safeGet;
  };
  var create2 = function(callback) {
    return function(scene) {
      return function __do() {
        $$void5(_setProp("create")(callback(scene))(scene))();
        return scene;
      };
    };
  };

  // output/Graphics.Phaser.Sprite/index.js
  var bind7 = /* @__PURE__ */ bind(bindEffect);
  var pure4 = /* @__PURE__ */ pure(applicativeEffect);
  var composeKleisli5 = /* @__PURE__ */ composeKleisli(bindEffect);
  var playAnimation = function() {
    return function(v) {
      return function(obj) {
        return bind7(bind7(_getProp("anims")(obj))(_return2("play")(v.key)(v.ignoreIfPlaying)))($$const(pure4(obj)));
      };
    };
  };
  var generateFrameNumbers = function(v1) {
    return function(start) {
      return function(end) {
        return composeKleisli5(_getProp("anims"))(_return2("generateFrameNumbers")(v1)({
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
          return composeKleisli5(_getProp("anims"))(_return1("create")({
            key,
            frames,
            frameRate,
            repeat
          }));
        };
      };
    };
  };

  // output/Main/index.js
  var $$void6 = /* @__PURE__ */ $$void(functorEffect);
  var for_2 = /* @__PURE__ */ for_(applicativeEffect)(foldableArray);
  var bind8 = /* @__PURE__ */ bind(bindEffect);
  var setVelocityX2 = /* @__PURE__ */ setVelocityX();
  var playAnimation2 = /* @__PURE__ */ playAnimation();
  var getChildByName2 = /* @__PURE__ */ getChildByName();
  var setVelocityY2 = /* @__PURE__ */ setVelocityY();
  var getTouching2 = /* @__PURE__ */ getTouching();
  var pure5 = /* @__PURE__ */ pure(applicativeEffect);
  var log4 = /* @__PURE__ */ log3(monadEffectEffect);
  var getX2 = /* @__PURE__ */ getX();
  var disableBody2 = /* @__PURE__ */ disableBody();
  var composeKleisli6 = /* @__PURE__ */ composeKleisli(bindEffect);
  var addCollider2 = /* @__PURE__ */ addCollider()();
  var addOverlap2 = /* @__PURE__ */ addOverlap()()()();
  var sequence2 = /* @__PURE__ */ sequence(traversableArray)(applicativeEffect);
  var map2 = /* @__PURE__ */ map(functorArray);
  var setBounce2 = /* @__PURE__ */ setBounce();
  var setCollideWorldBounds2 = /* @__PURE__ */ setCollideWorldBounds();
  var setName2 = /* @__PURE__ */ setName();
  var setImmovable2 = /* @__PURE__ */ setImmovable();
  var setAllowGravity2 = /* @__PURE__ */ setAllowGravity();
  var createChild2 = /* @__PURE__ */ createChild();
  var setScale2 = /* @__PURE__ */ setScale();
  var refreshBody2 = /* @__PURE__ */ refreshBody();
  var setPosition2 = /* @__PURE__ */ setPosition();
  var append1 = /* @__PURE__ */ append(semigroupOptions);
  var onpreload = function(scene) {
    return $$void6(for_2(["sky", "platform", "star"])(function(key) {
      return bind8(loadImage({
        key,
        path: "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/src/games/firstgame/assets/" + (key + ".png")
      })(scene))(loadSpritesheet({
        key: "dude",
        path: "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/src/games/firstgame/assets/dude.png"
      })({
        frameWidth: 32,
        frameHeight: 48
      }));
    }));
  };
  var move = function() {
    return function() {
      return function(cursors) {
        return function(sprite) {
          var stop = bind8(setVelocityX2(0)(sprite))(playAnimation2({
            key: "turn",
            ignoreIfPlaying: false
          }));
          var moveRight = bind8(setVelocityX2(150)(sprite))(playAnimation2({
            key: "right",
            ignoreIfPlaying: true
          }));
          var moveLeft = bind8(setVelocityX2(-150)(sprite))(playAnimation2({
            key: "left",
            ignoreIfPlaying: true
          }));
          return $$void6(function __do() {
            var isRight = isDown(cursors.right)();
            var isLeft = isDown(cursors.left)();
            if (isRight) {
              return moveRight();
            }
            ;
            if (isLeft) {
              return moveLeft();
            }
            ;
            return stop();
          });
        };
      };
    };
  };
  var move1 = /* @__PURE__ */ move()();
  var getPlayer = function(scene) {
    return getChildByName2("player")(scene);
  };
  var getPlatform = function(scene) {
    return getChildByName2("moving_platform")(scene);
  };
  var update2 = function(cursors) {
    return function(scene) {
      var movePlayer = function() {
        var jump = setVelocityY2(-350);
        return function __do() {
          var player = getPlayer(scene)();
          if (player instanceof Just) {
            return $$void6(function __do2() {
              var touching = getTouching2(player.value0)();
              var isUp = isDown(cursors.up)();
              move1(cursors)(player.value0)();
              var $48 = isUp && touching.down;
              if ($48) {
                return jump(player.value0)();
              }
              ;
              return player.value0;
            })();
          }
          ;
          if (player instanceof Nothing) {
            return log4("Sprite not found!")();
          }
          ;
          throw new Error("Failed pattern match at Main (line 142, column 5 - line 152, column 41): " + [player.constructor.name]);
        };
      }();
      var movePlatform = function __do() {
        var platform = getPlatform(scene)();
        if (platform instanceof Just) {
          var x = getX2(platform.value0)();
          (function() {
            var $51 = x >= 500;
            if ($51) {
              return $$void6(setVelocityX2(-50)(platform.value0))();
            }
            ;
            return unit;
          })();
          var $52 = x <= 300;
          if ($52) {
            return $$void6(setVelocityX2(50)(platform.value0))();
          }
          ;
          return unit;
        }
        ;
        if (platform instanceof Nothing) {
          return log4("Platform image not found!")();
        }
        ;
        throw new Error("Failed pattern match at Main (line 158, column 5 - line 169, column 49): " + [platform.constructor.name]);
      };
      return function __do() {
        movePlayer();
        return movePlatform();
      };
    };
  };
  var collectStar = function(_a) {
    return function(b) {
      return bind8(disableBody2(b))($$const(pure5(unit)));
    };
  };
  var oncreate = function(scene) {
    var setupCollisions = function(player) {
      return function(stars) {
        return function(platformsGroup) {
          return function(movingPlatform) {
            return composeKleisli6(addCollider2(player)(platformsGroup))(composeKleisli6(addCollider2(player)(movingPlatform))(composeKleisli6(addCollider2(stars)(movingPlatform))(composeKleisli6(addCollider2(stars)(platformsGroup))(addOverlap2(player)(stars)(collectStar)))));
          };
        };
      };
    };
    var createStars = function(phy) {
      return function __do() {
        var starsEff = sequence2(map2(function(n) {
          return bind8(bind8(createArcadeImage({
            x: 50 + toNumber(n) * 40,
            y: 100
          })("star")(phy))(setBounce2(0.4)))(setCollideWorldBounds2(true));
        })(range(1)(15)))();
        return starsEff;
      };
    };
    var createPlayer = function(phy) {
      return bind8(bind8(bind8(createArcadeSprite({
        x: 50,
        y: 500
      })("dude")(phy))(setBounce2(0.4)))(setCollideWorldBounds2(true)))(setName2("player"));
    };
    var createPlatform = function(phy) {
      return bind8(bind8(bind8(bind8(createArcadeImage({
        x: 400,
        y: 400
      })("platform")(phy))(setImmovable2(true)))(setAllowGravity2(false)))(setVelocityX2(50)))(setName2("moving_platform"));
    };
    var createFloor = function(group2) {
      return $$void6(bind8(bind8(createChild2({
        x: 400,
        y: 568
      })("platform")(group2))(setScale2({
        x: 2,
        y: 2
      })))(refreshBody2));
    };
    var createBg = $$void6(bind8(create("sky")(scene))(setPosition2({
      x: 400,
      y: 300
    })));
    var createAnimations = $$void6(function __do() {
      var leftWalkFrames = generateFrameNumbers("dude")(0)(3)(scene)();
      var rightWalkFrames = generateFrameNumbers("dude")(5)(8)(scene)();
      $$void6(createAnimation("left")(leftWalkFrames)(10)(-1 | 0)(scene))();
      $$void6(createAnimation("turn")([{
        key: "dude",
        frame: 4
      }])(10)(-1 | 0)(scene))();
      return $$void6(createAnimation("right")(rightWalkFrames)(10)(-1 | 0)(scene))();
    });
    return $$void6(function __do() {
      var phy = getPhysicsPlugin(scene)();
      createBg();
      var platformsGroup = createStaticGroup(phy)();
      createFloor(platformsGroup)();
      var movingPlatform = createPlatform(phy)();
      var player = createPlayer(phy)();
      var stars = createStars(phy)();
      var cursors = createCursorKeys(scene)();
      createAnimations();
      $$void6(setupCollisions(player)(stars)(platformsGroup)(movingPlatform)(phy))();
      return update(update2(cursors))(scene)();
    });
  };
  var mainScene = /* @__PURE__ */ bind8(/* @__PURE__ */ bind8(/* @__PURE__ */ newScene("main"))(/* @__PURE__ */ create2(oncreate)))(/* @__PURE__ */ preload(onpreload));
  var main = /* @__PURE__ */ function() {
    var physicsConfig$prime = append1(physicsConfig["default"]("arcade"))(physicsConfig.arcade({
      debug: false,
      gravity: {
        x: 0,
        y: 100
      }
    }));
    return function __do() {
      var scene = mainScene();
      return createWithConfig(append1(config.width(800))(append1(config.height(600))(append1(config.scene([scene]))(config.physics(physicsConfig$prime)))))();
    };
  }();

  // <stdin>
  main();
})();
