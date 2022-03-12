// Generated by purs bundle 0.14.4
var PS = {};
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Apply"] = $PS["Control.Apply"] || {};
  var exports = $PS["Control.Apply"];
  var apply = function (dict) {
      return dict.apply;
  };
  exports["apply"] = apply;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Applicative"] = $PS["Control.Applicative"] || {};
  var exports = $PS["Control.Applicative"];
  var Control_Apply = $PS["Control.Apply"];          
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
  exports["pure"] = pure;
  exports["liftA1"] = liftA1;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Bind"] = $PS["Control.Bind"] || {};
  var exports = $PS["Control.Bind"];
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
  exports["bind"] = bind;
  exports["composeKleisli"] = composeKleisli;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Semigroupoid"] = $PS["Control.Semigroupoid"] || {};
  var exports = $PS["Control.Semigroupoid"];
  var semigroupoidFn = {
      compose: function (f) {
          return function (g) {
              return function (x) {
                  return f(g(x));
              };
          };
      }
  };
  exports["semigroupoidFn"] = semigroupoidFn;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Category"] = $PS["Control.Category"] || {};
  var exports = $PS["Control.Category"];
  var Control_Semigroupoid = $PS["Control.Semigroupoid"];                
  var identity = function (dict) {
      return dict.identity;
  };
  var categoryFn = {
      identity: function (x) {
          return x;
      },
      Semigroupoid0: function () {
          return Control_Semigroupoid.semigroupoidFn;
      }
  };
  exports["identity"] = identity;
  exports["categoryFn"] = categoryFn;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Monad"] = $PS["Control.Monad"] || {};
  var exports = $PS["Control.Monad"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Control_Bind = $PS["Control.Bind"];
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
  exports["ap"] = ap;
})(PS);
(function(exports) {
  "use strict";

  //------------------------------------------------------------------------------
  // Array creation --------------------------------------------------------------
  //------------------------------------------------------------------------------

  exports.range = function (start) {
    return function (end) {
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
})(PS["Data.Array"] = PS["Data.Array"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Array"] = $PS["Data.Array"] || {};
  var exports = $PS["Data.Array"];
  var $foreign = $PS["Data.Array"];
  exports["range"] = $foreign.range;
})(PS);
(function(exports) {
  /* global exports */
  "use strict";

  exports.unsafeForeignProcedure = function(args) {
      return function (stmt) {
          return Function(wrap(args.slice()))();
          function wrap() {
              return !args.length ? stmt : 'return function (' + args.shift() + ') { ' + wrap() + ' };';
          }
      };
  };
})(PS["Data.Foreign.EasyFFI"] = PS["Data.Foreign.EasyFFI"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Foreign.EasyFFI"] = $PS["Data.Foreign.EasyFFI"] || {};
  var exports = $PS["Data.Foreign.EasyFFI"];
  var $foreign = $PS["Data.Foreign.EasyFFI"];
  var unsafeForeignFunction = function (args) {
      return function (expr) {
          return $foreign.unsafeForeignProcedure(args)("return " + (expr + ";"));
      };
  };
  exports["unsafeForeignFunction"] = unsafeForeignFunction;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Function"] = $PS["Data.Function"] || {};
  var exports = $PS["Data.Function"];
  var $$const = function (a) {
      return function (v) {
          return a;
      };
  };
  exports["const"] = $$const;
})(PS);
(function(exports) {
  "use strict";

  exports.runFn4 = function (fn) {
    return function (a) {
      return function (b) {
        return function (c) {
          return function (d) {
            return fn(a, b, c, d);
          };
        };
      };
    };
  };
})(PS["Data.Function.Uncurried"] = PS["Data.Function.Uncurried"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Function.Uncurried"] = $PS["Data.Function.Uncurried"] || {};
  var exports = $PS["Data.Function.Uncurried"];
  var $foreign = $PS["Data.Function.Uncurried"];
  exports["runFn4"] = $foreign.runFn4;
})(PS);
(function(exports) {
  "use strict";

  exports.arrayMap = function (f) {
    return function (arr) {
      var l = arr.length;
      var result = new Array(l);
      for (var i = 0; i < l; i++) {
        result[i] = f(arr[i]);
      }
      return result;
    };
  };
})(PS["Data.Functor"] = PS["Data.Functor"] || {});
(function(exports) {
  "use strict";

  exports.unit = {};
})(PS["Data.Unit"] = PS["Data.Unit"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Unit"] = $PS["Data.Unit"] || {};
  var exports = $PS["Data.Unit"];
  var $foreign = $PS["Data.Unit"];
  exports["unit"] = $foreign.unit;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Functor"] = $PS["Data.Functor"] || {};
  var exports = $PS["Data.Functor"];
  var $foreign = $PS["Data.Functor"];
  var Data_Function = $PS["Data.Function"];
  var Data_Unit = $PS["Data.Unit"];                  
  var map = function (dict) {
      return dict.map;
  };
  var $$void = function (dictFunctor) {
      return map(dictFunctor)(Data_Function["const"](Data_Unit.unit));
  };
  var functorArray = {
      map: $foreign.arrayMap
  };
  exports["map"] = map;
  exports["void"] = $$void;
  exports["functorArray"] = functorArray;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Maybe"] = $PS["Data.Maybe"] || {};
  var exports = $PS["Data.Maybe"];                 
  var Nothing = (function () {
      function Nothing() {

      };
      Nothing.value = new Nothing();
      return Nothing;
  })();
  var Just = (function () {
      function Just(value0) {
          this.value0 = value0;
      };
      Just.create = function (value0) {
          return new Just(value0);
      };
      return Just;
  })();
  exports["Nothing"] = Nothing;
  exports["Just"] = Just;
})(PS);
(function(exports) {
  /* eslint-disable no-eq-null, eqeqeq */

  "use strict";          

  exports.nullable = function (a, r, f) {
    return a == null ? r : f(a);
  };
})(PS["Data.Nullable"] = PS["Data.Nullable"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Nullable"] = $PS["Data.Nullable"] || {};
  var exports = $PS["Data.Nullable"];
  var $foreign = $PS["Data.Nullable"];
  var Data_Maybe = $PS["Data.Maybe"];                                   
  var toMaybe = function (n) {
      return $foreign.nullable(n, Data_Maybe.Nothing.value, Data_Maybe.Just.create);
  };
  exports["toMaybe"] = toMaybe;
})(PS);
(function(exports) {
  "use strict";

  exports.concatArray = function (xs) {
    return function (ys) {
      if (xs.length === 0) return ys;
      if (ys.length === 0) return xs;
      return xs.concat(ys);
    };
  };
})(PS["Data.Semigroup"] = PS["Data.Semigroup"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Semigroup"] = $PS["Data.Semigroup"] || {};
  var exports = $PS["Data.Semigroup"];
  var $foreign = $PS["Data.Semigroup"];
  var semigroupArray = {
      append: $foreign.concatArray
  };
  var append = function (dict) {
      return dict.append;
  };
  exports["append"] = append;
  exports["semigroupArray"] = semigroupArray;
})(PS);
(function(exports) {
  "use strict";

  exports.showIntImpl = function (n) {
    return n.toString();
  };
})(PS["Data.Show"] = PS["Data.Show"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Show"] = $PS["Data.Show"] || {};
  var exports = $PS["Data.Show"];
  var $foreign = $PS["Data.Show"];
  var showInt = {
      show: $foreign.showIntImpl
  };
  var show = function (dict) {
      return dict.show;
  };
  exports["show"] = show;
  exports["showInt"] = showInt;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Symbol"] = $PS["Data.Symbol"] || {};
  var exports = $PS["Data.Symbol"];                  
  var SProxy = (function () {
      function SProxy() {

      };
      SProxy.value = new SProxy();
      return SProxy;
  })();
  var reflectSymbol = function (dict) {
      return dict.reflectSymbol;
  };
  exports["reflectSymbol"] = reflectSymbol;
  exports["SProxy"] = SProxy;
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
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Effect"] = $PS["Effect"] || {};
  var exports = $PS["Effect"];
  var $foreign = $PS["Effect"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Control_Monad = $PS["Control.Monad"];                  
  var monadEffect = {
      Applicative0: function () {
          return applicativeEffect;
      },
      Bind1: function () {
          return bindEffect;
      }
  };
  var bindEffect = {
      bind: $foreign.bindE,
      Apply0: function () {
          return applyEffect;
      }
  };
  var applyEffect = {
      apply: Control_Monad.ap(monadEffect),
      Functor0: function () {
          return functorEffect;
      }
  };
  var applicativeEffect = {
      pure: $foreign.pureE,
      Apply0: function () {
          return applyEffect;
      }
  };
  var functorEffect = {
      map: Control_Applicative.liftA1(applicativeEffect)
  };
  exports["functorEffect"] = functorEffect;
  exports["bindEffect"] = bindEffect;
})(PS);
(function(exports) {
  "use strict";

  exports._copyST = function (m) {
    return function () {
      var r = {};
      for (var k in m) {
        if (hasOwnProperty.call(m, k)) {
          r[k] = m[k];
        }
      }
      return r;
    };
  };

  exports.empty = {};

  exports.runST = function (f) {
    return f();
  };

  exports._lookup = function (no, yes, k, m) {
    return k in m ? yes(m[k]) : no;
  };
})(PS["Foreign.Object"] = PS["Foreign.Object"] || {});
(function(exports) {
  "use strict";

  exports.poke = function (k) {
    return function (v) {
      return function (m) {
        return function () {
          m[k] = v;
          return m;
        };
      };
    };
  };

  exports["delete"] = function (k) {
    return function (m) {
      return function () {
        delete m[k];
        return m;
      };
    };
  };
})(PS["Foreign.Object.ST"] = PS["Foreign.Object.ST"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Foreign.Object.ST"] = $PS["Foreign.Object.ST"] || {};
  var exports = $PS["Foreign.Object.ST"];
  var $foreign = $PS["Foreign.Object.ST"];
  exports["poke"] = $foreign.poke;
  exports["delete"] = $foreign["delete"];
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Foreign.Object"] = $PS["Foreign.Object"] || {};
  var exports = $PS["Foreign.Object"];
  var $foreign = $PS["Foreign.Object"];
  var Data_Function_Uncurried = $PS["Data.Function.Uncurried"];
  var Data_Maybe = $PS["Data.Maybe"];
  var Foreign_Object_ST = $PS["Foreign.Object.ST"];              
  var thawST = $foreign["_copyST"];
  var mutate = function (f) {
      return function (m) {
          return $foreign.runST(function __do() {
              var s = thawST(m)();
              f(s)();
              return s;
          });
      };
  };
  var lookup = Data_Function_Uncurried.runFn4($foreign["_lookup"])(Data_Maybe.Nothing.value)(Data_Maybe.Just.create);
  var insert = function (k) {
      return function (v) {
          return mutate(Foreign_Object_ST.poke(k)(v));
      };
  };
  var $$delete = function (k) {
      return mutate(Foreign_Object_ST["delete"](k));
  };
  var alter = function (f) {
      return function (k) {
          return function (m) {
              var v = f(lookup(k)(m));
              if (v instanceof Data_Maybe.Nothing) {
                  return $$delete(k)(m);
              };
              if (v instanceof Data_Maybe.Just) {
                  return insert(k)(v.value0)(m);
              };
              throw new Error("Failed pattern match at Foreign.Object (line 209, column 15 - line 211, column 25): " + [ v.constructor.name ]);
          };
      };
  };
  exports["lookup"] = lookup;
  exports["alter"] = alter;
  exports["empty"] = $foreign.empty;
})(PS);
(function(exports) {
  "use strict";

  // TODO: put this in a `util` module
  function mapThis(obj) {
    var newObj = {};
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        newObj[key.toString()] = function () {
          obj[key](this)();
        };
      }
    }
    return newObj;
  }

  exports.createImpl = function (config) {
    if (config.scene != undefined) {
      config.scene = mapThis(config.scene);
    }
    return new Phaser.Game(config);
  };
})(PS["Graphics.Phaser"] = PS["Graphics.Phaser"] || {});
(function(exports) {
  "use strict";

  exports.unsafeGet = function (label) {
    return function (rec) {
      return rec[label];
    };
  };
})(PS["Record.Unsafe"] = PS["Record.Unsafe"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Record.Unsafe"] = $PS["Record.Unsafe"] || {};
  var exports = $PS["Record.Unsafe"];
  var $foreign = $PS["Record.Unsafe"];
  exports["unsafeGet"] = $foreign.unsafeGet;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Record"] = $PS["Record"] || {};
  var exports = $PS["Record"];
  var Data_Symbol = $PS["Data.Symbol"];
  var Record_Unsafe = $PS["Record.Unsafe"];
  var get = function (dictIsSymbol) {
      return function (dictCons) {
          return function (l) {
              return function (r) {
                  return Record_Unsafe.unsafeGet(Data_Symbol.reflectSymbol(dictIsSymbol)(l))(r);
              };
          };
      };
  };
  exports["get"] = get;
})(PS);
(function(exports) {
  "use strict";

  exports.copyRecord = function(rec) {
    var copy = {};
    for (var key in rec) {
      if ({}.hasOwnProperty.call(rec, key)) {
        copy[key] = rec[key];
      }
    }
    return copy;
  };
})(PS["Record.Builder"] = PS["Record.Builder"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Record.Builder"] = $PS["Record.Builder"] || {};
  var exports = $PS["Record.Builder"];
  var $foreign = $PS["Record.Builder"];
  var Control_Category = $PS["Control.Category"];
  var categoryBuilder = Control_Category.categoryFn;
  var build = function (v) {
      return function (r1) {
          return v($foreign.copyRecord(r1));
      };
  };
  exports["build"] = build;
  exports["categoryBuilder"] = categoryBuilder;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Option"] = $PS["Option"] || {};
  var exports = $PS["Option"];
  var Control_Category = $PS["Control.Category"];
  var Data_Maybe = $PS["Data.Maybe"];
  var Data_Symbol = $PS["Data.Symbol"];
  var Foreign_Object = $PS["Foreign.Object"];
  var Record_1 = $PS["Record"];
  var Record_Builder = $PS["Record.Builder"];                      
  var $$Proxy = (function () {
      function $$Proxy() {

      };
      $$Proxy.value = new $$Proxy();
      return $$Proxy;
  })();
  var required = function (record$prime) {
      return record$prime.required;
  };
  var recordFromRecordAndOption = function (record) {
      return {
          optional: record.optional,
          required: record.required
      };
  };
  var optional = function (record$prime) {
      return record$prime.optional;
  };
  var fromRecordRequiredNil = {
      fromRecordRequired: function (v) {
          return function (v1) {
              return Control_Category.identity(Record_Builder.categoryBuilder);
          };
      }
  };
  var fromRecordRequired = function (dict) {
      return dict.fromRecordRequired;
  };
  var fromRecordOption = function (dict) {
      return dict.fromRecordOption;
  };
  var fromRecordAny = function (dictFromRecordOption) {
      return function (dictFromRecordRequired) {
          return function (dictUnion) {
              return function (dictRowToList) {
                  return function (dictRowToList1) {
                      return {
                          "fromRecord'": function (record) {
                              return recordFromRecordAndOption({
                                  optional: fromRecordOption(dictFromRecordOption)($$Proxy.value)(record),
                                  required: Record_Builder.build(fromRecordRequired(dictFromRecordRequired)($$Proxy.value)(record))({})
                              });
                          }
                      };
                  };
              };
          };
      };
  };
  var fromRecord$prime = function (dict) {
      return dict["fromRecord'"];
  };
  var fromRecord = function (dictFromRecord) {
      return function (record$prime) {
          var record = fromRecord$prime(dictFromRecord)(record$prime);
          return optional(record);
      };
  };
  var empty = Foreign_Object.empty;
  var fromRecordOptionNil = {
      fromRecordOption: function (v) {
          return function (v1) {
              return empty;
          };
      }
  };
  var alter$prime$prime = function (dict) {
      return dict["alter''"];
  };
  var alter$prime = function (dictIsSymbol) {
      return function (f) {
          return function (v) {
              return function (v1) {
                  var key = Data_Symbol.reflectSymbol(dictIsSymbol)(Data_Symbol.SProxy.value);
                  var go = function (value$prime) {
                      return f(value$prime);
                  };
                  var option = Foreign_Object.alter(go)(key)(v1);
                  var value = f(Foreign_Object.lookup(key)(v1));
                  return {
                      option: option,
                      value: value
                  };
              };
          };
      };
  };                                     
  var get = function (dictIsSymbol) {
      return function (dictCons) {
          return function (proxy) {
              return function (option) {
                  var go = function (value) {
                      return value;
                  };
                  return (alter$prime(dictIsSymbol)(go)(proxy)(option)).value;
              };
          };
      };
  };
  var insert = function (dictIsSymbol) {
      return function (dictCons) {
          return function (dictLacks) {
              return function (proxy) {
                  return function (value) {
                      return function (option) {
                          var go = function (v) {
                              return new Data_Maybe.Just(value);
                          };
                          return (alter$prime(dictIsSymbol)(go)(proxy)(option)).option;
                      };
                  };
              };
          };
      };
  };
  var fromRecordOptionCons = function (dictIsSymbol) {
      return function (dictFromRecordOption) {
          return function (dictCons) {
              return function (dictCons1) {
                  return function (dictLacks) {
                      return {
                          fromRecordOption: function (v) {
                              return function (record) {
                                  var option = fromRecordOption(dictFromRecordOption)($$Proxy.value)(record);
                                  var value = Record_1.get(dictIsSymbol)()(Data_Symbol.SProxy.value)(record);
                                  return insert(dictIsSymbol)()()(Data_Symbol.SProxy.value)(value)(option);
                              };
                          }
                      };
                  };
              };
          };
      };
  };                                           
  var alter = function (dictAlter) {
      return function (record) {
          return function (option) {
              return alter$prime$prime(dictAlter)(record)(option);
          };
      };
  };
  exports["fromRecord"] = fromRecord;
  exports["fromRecordAny"] = fromRecordAny;
  exports["fromRecordOptionNil"] = fromRecordOptionNil;
  exports["fromRecordOptionCons"] = fromRecordOptionCons;
  exports["fromRecordRequiredNil"] = fromRecordRequiredNil;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser"] = $PS["Graphics.Phaser"] || {};
  var exports = $PS["Graphics.Phaser"];
  var $foreign = $PS["Graphics.Phaser"];
  var Option = $PS["Option"];
  var create = function (dictFromRecord) {
      return function (config) {
          return function () {
              return $foreign.createImpl(Option.fromRecord(dictFromRecord)(config));
          };
      };
  };
  exports["create"] = create;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Utils.FFI"] = $PS["Utils.FFI"] || {};
  var exports = $PS["Utils.FFI"];
  var Data_Array = $PS["Data.Array"];
  var Data_Foreign_EasyFFI = $PS["Data.Foreign.EasyFFI"];
  var Data_Functor = $PS["Data.Functor"];
  var Data_Semigroup = $PS["Data.Semigroup"];
  var Data_Show = $PS["Data.Show"];
  var Effect = $PS["Effect"];
  var argsN = function (n) {
      var values = (function () {
          var $1 = n < 1;
          if ($1) {
              return [  ];
          };
          return Data_Functor.map(Data_Functor.functorArray)(function (v) {
              return "v" + Data_Show.show(Data_Show.showInt)(n);
          })(Data_Array.range(1)(n));
      })();
      return Data_Semigroup.append(Data_Semigroup.semigroupArray)(values)([ "obj", "" ]);
  };
  var return0 = function (expr) {
      return function (obj) {
          return Data_Foreign_EasyFFI.unsafeForeignFunction(argsN(0))("obj." + expr)(obj);
      };
  };
  var return2 = function (expr) {
      return function (v1) {
          return function (v2) {
              return function (obj) {
                  return Data_Foreign_EasyFFI.unsafeForeignFunction(argsN(2))("obj." + expr)(v1)(v2)(obj);
              };
          };
      };
  };
  var method2 = function (expr) {
      return function (v1) {
          return function (v2) {
              return function (obj) {
                  return function __do() {
                      Data_Functor["void"](Effect.functorEffect)(return2(expr)(v1)(v2)(obj))();
                      return obj;
                  };
              };
          };
      };
  };
  exports["return0"] = return0;
  exports["method2"] = method2;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.Graphics"] = $PS["Graphics.Phaser.Graphics"] || {};
  var exports = $PS["Graphics.Phaser.Graphics"];
  var Utils_FFI = $PS["Utils.FFI"];                                            
  var fillStyle = Utils_FFI.method2("fillStyle(v1,v2)");
  var fillRect = Utils_FFI.method2("fillRect(v1.x, v1.y, v2.width, v2.height)");                                      
  var create = Utils_FFI.return0("add.graphics()");
  exports["create"] = create;
  exports["fillStyle"] = fillStyle;
  exports["fillRect"] = fillRect;
})(PS);
(function(exports) {
  "use strict";

  // TODO: put this in a `util` module
  function mapThis(obj) {
    var newObj = {};
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        newObj[key.toString()] = function () {
          obj[key](this)();
        };
      }
    }
    return newObj;
  }

  exports.addSceneImpl = function (key, sceneConfig, autoStart, game) {
    // Map only the existing fields into calls taking `this` which is the
    // PhaserScene.
    // TODO: replace with `mkEffectFn1`
    return game.scene.add(key, mapThis(sceneConfig), autoStart);
  };
})(PS["Graphics.Phaser.SceneManager"] = PS["Graphics.Phaser.SceneManager"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.SceneManager"] = $PS["Graphics.Phaser.SceneManager"] || {};
  var exports = $PS["Graphics.Phaser.SceneManager"];
  var $foreign = $PS["Graphics.Phaser.SceneManager"];
  var Data_Functor = $PS["Data.Functor"];
  var Data_Nullable = $PS["Data.Nullable"];
  var Effect = $PS["Effect"];
  var Option = $PS["Option"];                
  var Start = (function () {
      function Start() {

      };
      Start.value = new Start();
      return Start;
  })();
  var NoStart = (function () {
      function NoStart() {

      };
      NoStart.value = new NoStart();
      return NoStart;
  })();                                                                   
  var addScene = function (dictFromRecord) {
      return function (key) {
          return function (sceneConfig) {
              return function (autoStart) {
                  return function (game) {
                      var start = (function () {
                          if (autoStart instanceof Start) {
                              return true;
                          };
                          if (autoStart instanceof NoStart) {
                              return false;
                          };
                          throw new Error("Failed pattern match at Graphics.Phaser.SceneManager (line 100, column 15 - line 102, column 25): " + [ autoStart.constructor.name ]);
                      })();
                      return Data_Functor.map(Effect.functorEffect)(Data_Nullable.toMaybe)(function () {
                          return $foreign.addSceneImpl(key, Option.fromRecord(dictFromRecord)(sceneConfig), start, game);
                      });
                  };
              };
          };
      };
  };
  exports["addScene"] = addScene;
  exports["Start"] = Start;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var exports = $PS["Main"];
  var Control_Bind = $PS["Control.Bind"];
  var Data_Functor = $PS["Data.Functor"];
  var Data_Unit = $PS["Data.Unit"];
  var Effect = $PS["Effect"];
  var Graphics_Phaser = $PS["Graphics.Phaser"];
  var Graphics_Phaser_Graphics = $PS["Graphics.Phaser.Graphics"];
  var Graphics_Phaser_SceneManager = $PS["Graphics.Phaser.SceneManager"];
  var Option = $PS["Option"];                
  var drawRedRect = Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser_Graphics.fillStyle("0xff0000")(0.5))(Graphics_Phaser_Graphics.fillRect({
      x: 250.0,
      y: 200.0
  })({
      width: 400.0,
      height: 256.0
  }));
  var drawGreenRect = Control_Bind.composeKleisli(Effect.bindEffect)(Graphics_Phaser_Graphics.fillStyle("0x00ff00")(1.0))(Graphics_Phaser_Graphics.fillRect({
      x: 100.0,
      y: 100.0
  })({
      width: 256.0,
      height: 256.0
  }));
  var create = function (scene) {
      return Data_Functor["void"](Effect.functorEffect)(Control_Bind.bind(Effect.bindEffect)(Control_Bind.bind(Effect.bindEffect)(Graphics_Phaser_Graphics.create(scene))(drawGreenRect))(drawRedRect));
  };
  var main = function __do() {
      var game = Graphics_Phaser.create(Option.fromRecordAny(Option.fromRecordOptionCons({
          reflectSymbol: function () {
              return "height";
          }
      })(Option.fromRecordOptionCons({
          reflectSymbol: function () {
              return "width";
          }
      })(Option.fromRecordOptionNil)()()())()()())(Option.fromRecordRequiredNil)()()())({
          width: 800.0,
          height: 600.0
      })();
      var _maybeScene = Graphics_Phaser_SceneManager.addScene(Option.fromRecordAny(Option.fromRecordOptionCons({
          reflectSymbol: function () {
              return "create";
          }
      })(Option.fromRecordOptionNil)()()())(Option.fromRecordRequiredNil)()()())("scene 1")({
          create: create
      })(Graphics_Phaser_SceneManager.Start.value)(game)();
      return Data_Unit.unit;
  };
  exports["main"] = main;
  exports["create"] = create;
  exports["drawGreenRect"] = drawGreenRect;
  exports["drawRedRect"] = drawRedRect;
})(PS);
PS["Main"].main();