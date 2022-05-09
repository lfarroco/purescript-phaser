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
var composeKleisli = function(dictBind) {
  return function(f) {
    return function(g) {
      return function(a) {
        return bind(dictBind)(f(a))(g);
      };
    };
  };
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

// output/Effect.Console/foreign.js
var log = function(s) {
  return function() {
    console.log(s);
  };
};

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

// output/Effect.Class.Console/index.js
var log2 = function(dictMonadEffect) {
  var $33 = liftEffect(dictMonadEffect);
  return function($34) {
    return $33(log($34));
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

// output/Data.Bounded/foreign.js
var topChar = String.fromCharCode(65535);
var bottomChar = String.fromCharCode(0);
var topNumber = Number.POSITIVE_INFINITY;
var bottomNumber = Number.NEGATIVE_INFINITY;

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
var return0 = function(expr) {
  return function(obj) {
    return unsafeForeignFunction(argsN(0))("obj." + expr)(obj);
  };
};
var method0 = function(expr) {
  return function(obj) {
    return function __do2() {
      $$void(functorEffect)(return0(expr)(obj))();
      return obj;
    };
  };
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
var method2 = function(expr) {
  return function(v1) {
    return function(v2) {
      return function(obj) {
        return function __do2() {
          $$void(functorEffect)(return2(expr)(v1)(v2)(obj))();
          return obj;
        };
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

// output/Graphics.Phaser.Events/index.js
var on2 = function() {
  return method2("on(v1,v2)");
};
var createEventListener0 = /* @__PURE__ */ unsafeForeignFunction(["fn"])("arg=>fn()");

// output/Graphics.Phaser.GameObject/index.js
var setPosition = function() {
  return method1("setPosition(v1.x,v1.y)");
};
var setInteractive = function() {
  return method0("setInteractive()");
};
var setDisplaySize = function() {
  return method1("setDisplaySize(v1.width, v1.height)");
};
var setAngle = function() {
  return method1("setAngle(v1)");
};

// output/Graphics.Phaser.Image/index.js
var create2 = /* @__PURE__ */ return1("add.image(0, 0, v1)");

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
var launch = /* @__PURE__ */ method2("launch(v1,v2)");
var getScenePlugin = function() {
  return getProperty("scene");
};
var create3 = function(callback) {
  return function(scene) {
    return function __do2() {
      $$void(functorEffect)(unsafeForeignProcedure(["callback", "scene", ""])("scene.create = (data) => callback(scene)()")(callback)(scene))();
      return scene;
    };
  };
};

// output/Graphics.Phaser.Text/index.js
var create4 = /* @__PURE__ */ return1("add.text(0,0,v1)");

// output/Main/index.js
var secondScene = /* @__PURE__ */ function() {
  var createLogo = composeKleisli(bindEffect)(create2("logo"))(composeKleisli(bindEffect)(setPosition()({
    x: 200,
    y: 200
  }))(composeKleisli(bindEffect)(setAngle()(30))(setDisplaySize()({
    width: 50,
    height: 50
  }))));
  return bind(bindEffect)(newScene("snd"))(create3(function(scene) {
    return bind(bindEffect)(createLogo(scene))($$const(pure(applicativeEffect)(scene)));
  }));
}();
var mainScene = /* @__PURE__ */ function() {
  var startButton = function(scene) {
    var callback = $$void(functorEffect)(function __do2() {
      log2(monadEffectEffect)("clicked!")();
      return bind(bindEffect)(getScenePlugin()(scene))(launch("snd")({}))();
    });
    var listener = createEventListener0(callback);
    return bind(bindEffect)(bind(bindEffect)(bind(bindEffect)(bind(bindEffect)(create2("logo")(scene))(setPosition()({
      x: 100,
      y: 100
    })))(setDisplaySize()({
      width: 50,
      height: 50
    })))(setInteractive()))(on2()("pointerdown")(listener));
  };
  return bind(bindEffect)(bind(bindEffect)(newScene("main"))(create3(function(scene) {
    return function __do2() {
      $$void(functorEffect)(create4("Click the logo to create a new scene")(scene))();
      $$void(functorEffect)(startButton(scene))();
      return scene;
    };
  })))(preload(loadImage({
    key: "logo",
    path: "https://upload.wikimedia.org/wikipedia/commons/6/64/PureScript_Logo.png"
  })));
}();
var main = function __do() {
  var main$prime = mainScene();
  var snd$prime = secondScene();
  return bind(bindEffect)(bind(bindEffect)(bind(bindEffect)(create)(setDimentions({
    width: 400,
    height: 400
  })))(addScene("main")(main$prime)(true)))(addScene("snd")(snd$prime)(false))();
};

// <stdin>
main();
