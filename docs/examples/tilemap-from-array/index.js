// output/Data.Function/index.js
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
  function Cons(head, tail) {
    this.head = head;
    this.tail = tail;
  }
  var emptyList = {};
  function curryCons(head) {
    return function(tail) {
      return new Cons(head, tail);
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
var length = function(xs) {
  return xs.length;
};
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

// output/Data.Bounded/foreign.js
var topChar = String.fromCharCode(65535);
var bottomChar = String.fromCharCode(0);
var topNumber = Number.POSITIVE_INFINITY;
var bottomNumber = Number.NEGATIVE_INFINITY;

// output/Data.Show/foreign.js
var showIntImpl = function(n) {
  return n.toString();
};

// output/Data.Show/index.js
var showInt = {
  show: showIntImpl
};
var show = function(dict) {
  return dict.show;
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
var $runtime_lazy = function(name, moduleName, init) {
  var state = 0;
  var val;
  return function(lineNumber) {
    if (state === 2)
      return val;
    if (state === 1)
      throw new ReferenceError(name + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state = 1;
    val = init();
    state = 2;
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

// output/Effect.Console/foreign.js
var log = function(s) {
  return function() {
    console.log(s);
  };
};

// output/Data.Foreign.EasyFFI/foreign.js
function unsafeForeignProcedure(args) {
  return function(stmt) {
    return Function(wrap(args.slice()))();
    function wrap() {
      return !args.length ? stmt : "return function (" + args.shift() + ") { " + wrap() + " };";
    }
  };
}

// output/Data.Foreign.EasyFFI/index.js
var unsafeForeignFunction = function(args) {
  return function(expr) {
    return unsafeForeignProcedure(args)("return " + (expr + ";"));
  };
};

// output/Utils.FFI/index.js
var setProperty = function(name) {
  return function(value) {
    return function(obj) {
      return unsafeForeignFunction(["v1", "obj", ""])("obj." + (name + " = v1"))(value)(obj);
    };
  };
};
var getProperty = function(name) {
  return function(obj) {
    return unsafeForeignFunction(["obj", ""])("obj." + name)(obj);
  };
};
var argsN = function(n) {
  var values = function() {
    var $0 = n < 1;
    if ($0) {
      return [];
    }
    ;
    return map(functorArray)(function(i) {
      return "v" + show(showInt)(i);
    })(range(1)(n));
  }();
  return append(semigroupArray)(values)(["obj", ""]);
};
var return1 = function(expr) {
  return function(v1) {
    return function(obj) {
      return unsafeForeignFunction(argsN(1))("obj." + expr)(v1)(obj);
    };
  };
};
var method1 = function(expr) {
  return function(value) {
    return function(obj) {
      return function __do2() {
        $$void(functorEffect)(return1(expr)(value)(obj))();
        return obj;
      };
    };
  };
};
var return2 = function(expr) {
  return function(v1) {
    return function(v2) {
      return function(obj) {
        return unsafeForeignFunction(argsN(2))("obj." + expr)(v1)(v2)(obj);
      };
    };
  };
};
var return3 = function(expr) {
  return function(v1) {
    return function(v2) {
      return function(v3) {
        return function(obj) {
          return unsafeForeignFunction(argsN(3))("obj." + expr)(v1)(v2)(v3)(obj);
        };
      };
    };
  };
};
var method3 = function(expr) {
  return function(v1) {
    return function(v2) {
      return function(v3) {
        return function(obj) {
          return function __do2() {
            $$void(functorEffect)(return3(expr)(v1)(v2)(v3)(obj))();
            return obj;
          };
        };
      };
    };
  };
};

// output/Graphics.Phaser/index.js
var setDimentions = function(v) {
  return function(game) {
    return function __do2() {
      setProperty("config.width=v1")(v.width)(game)();
      setProperty("config.height=v1")(v.height)(game)();
      return game;
    };
  };
};
var create = /* @__PURE__ */ unsafeForeignProcedure([""])("return new Phaser.Game()");
var addScene = /* @__PURE__ */ method3("scene.add(v1,v2,v3)");

// output/Graphics.Phaser.Loader/index.js
var loadImage = /* @__PURE__ */ method1("load.image(v1.key,v1.path)");

// output/Graphics.Phaser.Scene/index.js
var preload = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(unsafeForeignProcedure(["callback", "scene", ""])("scene.preload = () => callback(scene)()")(callback)(scene))();
      return scene;
    };
  };
};
var newScene = /* @__PURE__ */ unsafeForeignProcedure(["key", ""])("return new Phaser.Scene(key)");
var create2 = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(unsafeForeignProcedure(["callback", "scene", ""])("scene.create = (data) => callback(scene)()")(callback)(scene))();
      return scene;
    };
  };
};

// output/Graphics.Phaser.TileMap/index.js
var tilesets = /* @__PURE__ */ getProperty("tilesets");
var makeTileMap = function(config) {
  return function(scene) {
    return return1("make.tilemap(v1)")(config)(scene);
  };
};
var createLayer = /* @__PURE__ */ return2("createLayer(v1,v2)");
var addTilesetImage = function(tilesetName) {
  return function(config) {
    return function(tileMap) {
      return return2(" addTilesetImage(\n        v1,\n        v2.key,\n        v2.tileWidth,\n        v2.tileHeight,\n        v2.tileMargin,\n        v2.tileSpacing,\n        v2.gid\n      )")(tilesetName)(config)(tileMap);
    };
  };
};

// output/Main/index.js
var tileName = "mario-tiles";
var tileMapKey = "tile map 1";
var preload2 = /* @__PURE__ */ loadImage({
  key: tileName,
  path: "assets/super-mario.png"
});
var create3 = function(scene) {
  var level = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 2, 3, 0, 0, 0, 1, 2, 3, 0], [0, 5, 6, 7, 0, 0, 0, 5, 6, 7, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 14, 13, 14, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 14, 14, 14, 14, 14, 0, 0, 0, 15], [0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15], [35, 36, 37, 0, 0, 0, 0, 0, 15, 15, 15], [39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39]];
  return function __do2() {
    log("create")();
    var tileMap = makeTileMap({
      key: tileMapKey,
      data: level,
      tileHeight: 16,
      tileWidth: 16,
      width: 16 * 11 | 0,
      height: 16 * 11 | 0,
      insertNull: false
    })(scene)();
    var tileset = addTilesetImage(tileName)({
      tileWidth: 16,
      tileHeight: 16,
      key: "mario-tiles",
      tileMargin: 0,
      tileSpacing: 0,
      gid: 0
    })(tileMap)();
    var tilesetsList = tilesets(tileMap)();
    log("Found " + (show(showInt)(length(tilesetsList)) + " tileset"))();
    var _layer = createLayer("layer")([tileset])(tileMap)();
    return scene;
  };
};
var mainScene = /* @__PURE__ */ bind(bindEffect)(/* @__PURE__ */ bind(bindEffect)(/* @__PURE__ */ newScene("main"))(/* @__PURE__ */ create2(create3)))(/* @__PURE__ */ preload(preload2));
var main = function __do() {
  var scene = mainScene();
  return bind(bindEffect)(bind(bindEffect)(create)(setDimentions({
    height: 16 * 11,
    width: 16 * 11
  })))(addScene("main")(scene)(true))();
};

// <stdin>
main();
