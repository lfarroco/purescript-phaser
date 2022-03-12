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
  exports["bind"] = bind;
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

  //------------------------------------------------------------------------------
  // Array size ------------------------------------------------------------------
  //------------------------------------------------------------------------------

  exports.length = function (xs) {
    return xs.length;
  };
})(PS["Data.Array"] = PS["Data.Array"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Array"] = $PS["Data.Array"] || {};
  var exports = $PS["Data.Array"];
  var $foreign = $PS["Data.Array"];
  exports["range"] = $foreign.range;
  exports["length"] = $foreign.length;
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
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Effect.Console"] = $PS["Effect.Console"] || {};
  var exports = $PS["Effect.Console"];
  var $foreign = $PS["Effect.Console"];
  exports["log"] = $foreign.log;
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
  var get = function (name) {
      return function (obj) {
          return Data_Foreign_EasyFFI.unsafeForeignFunction([ "obj", "" ])("obj." + name)(obj);
      };
  };
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
  var return1 = function (expr) {
      return function (v1) {
          return function (obj) {
              return Data_Foreign_EasyFFI.unsafeForeignFunction(argsN(1))("obj." + expr)(v1)(obj);
          };
      };
  };
  var method1 = function (expr) {
      return function (value) {
          return function (obj) {
              return function __do() {
                  Data_Functor["void"](Effect.functorEffect)(return1(expr)(value)(obj))();
                  return obj;
              };
          };
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
  exports["return1"] = return1;
  exports["method1"] = method1;
  exports["return2"] = return2;
  exports["get"] = get;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.Loader"] = $PS["Graphics.Phaser.Loader"] || {};
  var exports = $PS["Graphics.Phaser.Loader"];
  var Utils_FFI = $PS["Utils.FFI"];                         
  var loadImage = Utils_FFI.method1("load.image(v1.key,v1.path)");
  exports["loadImage"] = loadImage;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.TileMap"] = $PS["Graphics.Phaser.TileMap"] || {};
  var exports = $PS["Graphics.Phaser.TileMap"];
  var Option = $PS["Option"];
  var Utils_FFI = $PS["Utils.FFI"];                
  var tilesets = Utils_FFI.get("tilesets");
  var makeTileMap = function (dictFromRecord) {
      return function (mapConfig) {
          return function (scene) {
              var config = Option.fromRecord(dictFromRecord)(mapConfig);
              return Utils_FFI.return1("make.tilemap(v1)")(config)(scene);
          };
      };
  };
  var createLayer = Utils_FFI.return2("createLayer(v1,v2)");
  var addTilesetImage = function (dictFromRecord) {
      return function (tilesetName) {
          return function (tilesetDesc) {
              return function (tileMap) {
                  var config = Option.fromRecord(dictFromRecord)(tilesetDesc);
                  return Utils_FFI.return2("\x0a      addTilesetImage(\x0a        v1,\x0a        v2.key,\x0a        v2.tileWidth,\x0a        v2.tileHeight,\x0a        v2.tileMargin,\x0a        v2.tileSpacing,\x0a        v2.gid\x0a      )")(tilesetName)(config)(tileMap);
              };
          };
      };
  };
  exports["makeTileMap"] = makeTileMap;
  exports["createLayer"] = createLayer;
  exports["addTilesetImage"] = addTilesetImage;
  exports["tilesets"] = tilesets;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var exports = $PS["Main"];
  var Data_Array = $PS["Data.Array"];
  var Data_Functor = $PS["Data.Functor"];
  var Data_Show = $PS["Data.Show"];
  var Data_Unit = $PS["Data.Unit"];
  var Effect = $PS["Effect"];
  var Effect_Console = $PS["Effect.Console"];
  var Graphics_Phaser = $PS["Graphics.Phaser"];
  var Graphics_Phaser_Loader = $PS["Graphics.Phaser.Loader"];
  var Graphics_Phaser_TileMap = $PS["Graphics.Phaser.TileMap"];
  var Option = $PS["Option"];                
  var tileName = "mario-tiles";
  var tileMapKey = "tile map 1";
  var mainSceneKey = "main key";
  var create = function (scene) {
      var level = [ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 2, 3, 0, 0, 0, 1, 2, 3, 0 ], [ 0, 5, 6, 7, 0, 0, 0, 5, 6, 7, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 14, 13, 14, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 14, 14, 14, 14, 14, 0, 0, 0, 15 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15 ], [ 35, 36, 37, 0, 0, 0, 0, 0, 15, 15, 15 ], [ 39, 39, 39, 39, 39, 39, 39, 39, 39, 39, 39 ] ];
      return function __do() {
          Effect_Console.log("create")();
          var tileMap = Graphics_Phaser_TileMap.makeTileMap(Option.fromRecordAny(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "data";
              }
          })(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "key";
              }
          })(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "tileHeight";
              }
          })(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "tileWidth";
              }
          })(Option.fromRecordOptionNil)()()())()()())()()())()()())(Option.fromRecordRequiredNil)()()())({
              key: tileMapKey,
              data: level,
              tileHeight: 16,
              tileWidth: 16
          })(scene)();
          var tileset = Graphics_Phaser_TileMap.addTilesetImage(Option.fromRecordAny(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "tileHeight";
              }
          })(Option.fromRecordOptionCons({
              reflectSymbol: function () {
                  return "tileWidth";
              }
          })(Option.fromRecordOptionNil)()()())()()())(Option.fromRecordRequiredNil)()()())(tileName)({
              tileWidth: 16,
              tileHeight: 16
          })(tileMap)();
          var tilesetsList = Graphics_Phaser_TileMap.tilesets(tileMap)();
          Effect_Console.log("Found " + (Data_Show.show(Data_Show.showInt)(Data_Array.length(tilesetsList)) + " tileset"))();
          var _layer = Graphics_Phaser_TileMap.createLayer("layer")([ tileset ])(tileMap)();
          return Data_Unit.unit;
      };
  };
  var main = Data_Functor["void"](Effect.functorEffect)(Graphics_Phaser.create(Option.fromRecordAny(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "height";
      }
  })(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "scene";
      }
  })(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "width";
      }
  })(Option.fromRecordOptionNil)()()())()()())()()())(Option.fromRecordRequiredNil)()()())({
      height: 200.0,
      width: 200.0,
      scene: Option.fromRecord(Option.fromRecordAny(Option.fromRecordOptionCons({
          reflectSymbol: function () {
              return "create";
          }
      })(Option.fromRecordOptionCons({
          reflectSymbol: function () {
              return "preload";
          }
      })(Option.fromRecordOptionNil)()()())()()())(Option.fromRecordRequiredNil)()()())({
          create: create,
          preload: function (scene) {
              return Data_Functor["void"](Effect.functorEffect)(Graphics_Phaser_Loader.loadImage({
                  key: tileName,
                  path: "assets/super-mario.png"
              })(scene));
          }
      })
  }));
  exports["tileName"] = tileName;
  exports["tileMapKey"] = tileMapKey;
  exports["mainSceneKey"] = mainSceneKey;
  exports["main"] = main;
  exports["create"] = create;
})(PS);
PS["Main"].main();