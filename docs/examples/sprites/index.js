// Generated by purs bundle 0.14.4
var PS = {};
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
  $PS["Data.Function"] = $PS["Data.Function"] || {};
  var exports = $PS["Data.Function"];
  var flip = function (f) {
      return function (b) {
          return function (a) {
              return f(a)(b);
          };
      };
  };
  var $$const = function (a) {
      return function (v) {
          return a;
      };
  };
  exports["flip"] = flip;
  exports["const"] = $$const;
})(PS);
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
  var Data_Function = $PS["Data.Function"];
  var Data_Unit = $PS["Data.Unit"];                  
  var map = function (dict) {
      return dict.map;
  };
  var $$void = function (dictFunctor) {
      return map(dictFunctor)(Data_Function["const"](Data_Unit.unit));
  };
  exports["map"] = map;
  exports["void"] = $$void;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Control.Apply"] = $PS["Control.Apply"] || {};
  var exports = $PS["Control.Apply"];
  var Control_Category = $PS["Control.Category"];
  var Data_Function = $PS["Data.Function"];
  var Data_Functor = $PS["Data.Functor"];
  var apply = function (dict) {
      return dict.apply;
  };
  var applySecond = function (dictApply) {
      return function (a) {
          return function (b) {
              return apply(dictApply)(Data_Functor.map(dictApply.Functor0())(Data_Function["const"](Control_Category.identity(Control_Category.categoryFn)))(a))(b);
          };
      };
  };
  exports["apply"] = apply;
  exports["applySecond"] = applySecond;
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

  exports.foldrArray = function (f) {
    return function (init) {
      return function (xs) {
        var acc = init;
        var len = xs.length;
        for (var i = len - 1; i >= 0; i--) {
          acc = f(xs[i])(acc);
        }
        return acc;
      };
    };
  };

  exports.foldlArray = function (f) {
    return function (init) {
      return function (xs) {
        var acc = init;
        var len = xs.length;
        for (var i = 0; i < len; i++) {
          acc = f(acc)(xs[i]);
        }
        return acc;
      };
    };
  };
})(PS["Data.Foldable"] = PS["Data.Foldable"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Monoid"] = $PS["Data.Monoid"] || {};
  var exports = $PS["Data.Monoid"];
  var mempty = function (dict) {
      return dict.mempty;
  };
  exports["mempty"] = mempty;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Semigroup"] = $PS["Data.Semigroup"] || {};
  var exports = $PS["Data.Semigroup"];
  var append = function (dict) {
      return dict.append;
  };
  exports["append"] = append;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Data.Foldable"] = $PS["Data.Foldable"] || {};
  var exports = $PS["Data.Foldable"];
  var $foreign = $PS["Data.Foldable"];
  var Control_Applicative = $PS["Control.Applicative"];
  var Control_Apply = $PS["Control.Apply"];
  var Data_Function = $PS["Data.Function"];
  var Data_Monoid = $PS["Data.Monoid"];
  var Data_Semigroup = $PS["Data.Semigroup"];
  var Data_Unit = $PS["Data.Unit"];                
  var foldr = function (dict) {
      return dict.foldr;
  };
  var traverse_ = function (dictApplicative) {
      return function (dictFoldable) {
          return function (f) {
              return foldr(dictFoldable)((function () {
                  var $316 = Control_Apply.applySecond(dictApplicative.Apply0());
                  return function ($317) {
                      return $316(f($317));
                  };
              })())(Control_Applicative.pure(dictApplicative)(Data_Unit.unit));
          };
      };
  };
  var for_ = function (dictApplicative) {
      return function (dictFoldable) {
          return Data_Function.flip(traverse_(dictApplicative)(dictFoldable));
      };
  };
  var foldMapDefaultR = function (dictFoldable) {
      return function (dictMonoid) {
          return function (f) {
              return foldr(dictFoldable)(function (x) {
                  return function (acc) {
                      return Data_Semigroup.append(dictMonoid.Semigroup0())(f(x))(acc);
                  };
              })(Data_Monoid.mempty(dictMonoid));
          };
      };
  };
  var foldableArray = {
      foldr: $foreign.foldrArray,
      foldl: $foreign.foldlArray,
      foldMap: function (dictMonoid) {
          return foldMapDefaultR(foldableArray)(dictMonoid);
      }
  };
  exports["for_"] = for_;
  exports["foldableArray"] = foldableArray;
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
  exports["applicativeEffect"] = applicativeEffect;
  exports["bindEffect"] = bindEffect;
})(PS);
(function(exports) {
  "use strict";

  exports.runEffectFn4 = function runEffectFn4(fn) {
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
})(PS["Effect.Uncurried"] = PS["Effect.Uncurried"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Effect.Uncurried"] = $PS["Effect.Uncurried"] || {};
  var exports = $PS["Effect.Uncurried"];
  var $foreign = $PS["Effect.Uncurried"];
  exports["runEffectFn4"] = $foreign.runEffectFn4;
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
  var Data_Foreign_EasyFFI = $PS["Data.Foreign.EasyFFI"];                
  var return4 = function (expr) {
      return function (v1) {
          return function (v2) {
              return function (v3) {
                  return function (v4) {
                      return function (obj) {
                          return Data_Foreign_EasyFFI.unsafeForeignFunction([ "v1", "v2", "v3", "v4", "obj", "" ])("obj." + expr)(v1)(v2)(v3)(v4)(obj);
                      };
                  };
              };
          };
      };
  };
  var return3 = function (expr) {
      return function (v1) {
          return function (v2) {
              return function (v3) {
                  return function (obj) {
                      return Data_Foreign_EasyFFI.unsafeForeignFunction([ "v1", "v2", "v3", "obj", "" ])("obj." + expr)(v1)(v2)(v3)(obj);
                  };
              };
          };
      };
  };
  var return2 = function (expr) {
      return function (v1) {
          return function (v2) {
              return function (obj) {
                  return Data_Foreign_EasyFFI.unsafeForeignFunction([ "v1", "v2", "obj", "" ])("obj." + expr)(v1)(v2)(obj);
              };
          };
      };
  };
  var return1 = function (expr) {
      return function (v1) {
          return function (obj) {
              return Data_Foreign_EasyFFI.unsafeForeignFunction([ "v1", "obj", "" ])("obj." + expr)(v1)(obj);
          };
      };
  };
  var method1 = function (expr) {
      return function (value) {
          return function (obj) {
              return function __do() {
                  return1(expr)(value)(obj)();
                  return obj;
              };
          };
      };
  };
  exports["method1"] = method1;
  exports["return2"] = return2;
  exports["return3"] = return3;
  exports["return4"] = return4;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.GameObject"] = $PS["Graphics.Phaser.GameObject"] || {};
  var exports = $PS["Graphics.Phaser.GameObject"];
  var Utils_FFI = $PS["Utils.FFI"];
  var setScale = function (dictGameObject) {
      return Utils_FFI.method1("setScale(v1.x,v1.y)");
  };
  exports["setScale"] = setScale;
})(PS);
(function(exports) {
  "use strict";

  exports.loadSpritesheetImpl = (key, textureURL, config, scene) => {
    scene.load.spritesheet(key, textureURL, config);
    return scene;
  };
})(PS["Graphics.Phaser.Loader"] = PS["Graphics.Phaser.Loader"] || {});
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Graphics.Phaser.Loader"] = $PS["Graphics.Phaser.Loader"] || {};
  var exports = $PS["Graphics.Phaser.Loader"];
  var $foreign = $PS["Graphics.Phaser.Loader"];
  var Effect_Uncurried = $PS["Effect.Uncurried"];                                           
  var loadSpritesheet = Effect_Uncurried.runEffectFn4($foreign.loadSpritesheetImpl);
  exports["loadSpritesheet"] = loadSpritesheet;
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
  $PS["Graphics.Phaser.Sprite"] = $PS["Graphics.Phaser.Sprite"] || {};
  var exports = $PS["Graphics.Phaser.Sprite"];
  var Utils_FFI = $PS["Utils.FFI"];                            
  var setFrame = Utils_FFI.method1("setFrame(v1)");           
  var playAnimation = Utils_FFI.method1("play(v1)");
  var generateFrameNumbers = Utils_FFI.return3("anims.generateFrameNumbers(v1, {start: v2, end: v3})");
  var createAnimation = Utils_FFI.return4("anims.create({ key: v1, frames: v2, frameRate: v3, repeat: v4, })");
  var add = Utils_FFI.return2("add.sprite(v2.x, v2.y, v1)");
  exports["add"] = add;
  exports["createAnimation"] = createAnimation;
  exports["playAnimation"] = playAnimation;
  exports["generateFrameNumbers"] = generateFrameNumbers;
  exports["setFrame"] = setFrame;
})(PS);
(function($PS) {
  // Generated by purs version 0.14.4
  "use strict";
  $PS["Main"] = $PS["Main"] || {};
  var exports = $PS["Main"];
  var Control_Bind = $PS["Control.Bind"];
  var Data_Foldable = $PS["Data.Foldable"];
  var Data_Functor = $PS["Data.Functor"];
  var Effect = $PS["Effect"];
  var Graphics_Phaser = $PS["Graphics.Phaser"];
  var Graphics_Phaser_GameObject = $PS["Graphics.Phaser.GameObject"];
  var Graphics_Phaser_Loader = $PS["Graphics.Phaser.Loader"];
  var Graphics_Phaser_SceneManager = $PS["Graphics.Phaser.SceneManager"];
  var Graphics_Phaser_Sprite = $PS["Graphics.Phaser.Sprite"];
  var Option = $PS["Option"];                
  var scale = function (dictGameObject) {
      return Graphics_Phaser_GameObject.setScale()({
          x: 3.0,
          y: 3.0
      });
  };
  var ghRoot = "https://raw.githubusercontent.com/photonstorm/phaser3-examples/master/public/assets/sprites/";
  var preload = function (scene) {
      return Data_Functor["void"](Effect.functorEffect)(Data_Foldable.for_(Effect.applicativeEffect)(Data_Foldable.foldableArray)([ Graphics_Phaser_Loader.loadSpritesheet("explosion")(ghRoot + "explosion.png")({
          frameWidth: 64.0,
          frameHeight: 64.0,
          startFrame: 0,
          endFrame: 23,
          margin: 0,
          spacing: 0
      }), Graphics_Phaser_Loader.loadSpritesheet("balls")(ghRoot + "balls.png")({
          frameWidth: 17.0,
          frameHeight: 17.0,
          startFrame: 0,
          endFrame: 4,
          margin: 0,
          spacing: 0
      }) ])(function (fn) {
          return fn(scene);
      }));
  };
  var explodeSpriteKey = "explosion";
  var explodeAnimationKey = "explodeAnimation";
  var create = function (scene) {
      return Data_Functor["void"](Effect.functorEffect)(function __do() {
          var explosionFrames = Graphics_Phaser_Sprite.generateFrameNumbers(explodeSpriteKey)(0)(23)(scene)();
          Graphics_Phaser_Sprite.createAnimation(explodeAnimationKey)(explosionFrames)(20.0)(-1 | 0)(scene)();
          Control_Bind.bind(Effect.bindEffect)(Control_Bind.bind(Effect.bindEffect)(Graphics_Phaser_Sprite.add(explodeSpriteKey)({
              x: 100.0,
              y: 100.0
          })(scene))(Graphics_Phaser_Sprite.playAnimation(explodeAnimationKey)))(scale())();
          return Control_Bind.bind(Effect.bindEffect)(Control_Bind.bind(Effect.bindEffect)(Graphics_Phaser_Sprite.add("balls")({
              x: 100.0,
              y: 100.0
          })(scene))(Graphics_Phaser_Sprite.setFrame(3)))(scale())();
      });
  };
  var main = Control_Bind.bind(Effect.bindEffect)(Graphics_Phaser.create(Option.fromRecordAny(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "height";
      }
  })(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "width";
      }
  })(Option.fromRecordOptionNil)()()())()()())(Option.fromRecordRequiredNil)()()())({
      width: 250.0,
      height: 250.0
  }))(Graphics_Phaser_SceneManager.addScene(Option.fromRecordAny(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "create";
      }
  })(Option.fromRecordOptionCons({
      reflectSymbol: function () {
          return "preload";
      }
  })(Option.fromRecordOptionNil)()()())()()())(Option.fromRecordRequiredNil)()()())("main")({
      create: create,
      preload: preload
  })(Graphics_Phaser_SceneManager.Start.value));
  exports["ghRoot"] = ghRoot;
  exports["preload"] = preload;
  exports["main"] = main;
  exports["explodeSpriteKey"] = explodeSpriteKey;
  exports["explodeAnimationKey"] = explodeAnimationKey;
  exports["scale"] = scale;
  exports["create"] = create;
})(PS);
PS["Main"].main();