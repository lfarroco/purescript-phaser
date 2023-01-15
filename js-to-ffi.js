const doctrine = require("doctrine");
const http = require("https");

const fs = require("fs");
const https = require("https");
const extract = require("extract-comments");

const basePath =
  "https://raw.githubusercontent.com/photonstorm/phaser/master/src/";

const filesToConvert = [
  // {
  //   path: "gameobjects/shape/isobox/IsoBox.js",
  //   destination: "./src/Graphics/GameObjects/IsoBox.purs",
  //   moduleName: "GameObjects.IsoBox",
  // },
  // {
  //   path: "animations/Animation.js",
  //   destination: "./src/Graphics/Animation/Animation.purs",
  //   moduleName: "Animation",
  // },
  // {
  //   path: "animations/AnimationManager.js",
  //   destination: "./src/Graphics/Animation/AnimationManager.purs",
  //   moduleName: "AnimationManager",
  // },
  // {
  //   path: "animations/AnimationFrame.js",
  //   destination: "./src/Graphics/Animation/AnimationFrame.purs",
  //   moduleName: "AnimationFrame",
  // },
  {
    path: "animations/AnimationState.js",
    destination: "./src/Graphics/Animation/AnimationState.purs",
    moduleName: "AnimationState",
  },

];

const extractName = (name) => {
  const [name_] = name.split("#").reverse();
  return name_;
};

const reservedKeywords = ["type"];

const convertType = (type) =>
  type == "Phaser.Scene"
    ? "PhaserScene"
    : type == "number"
    ? "Number"
    : type == "string"
    ? "String"
    : type == "boolean"
    ? "Boolean"
    : type == "unit"
    ? "Unit"
    : type;

filesToConvert.forEach(({ path, destination, moduleName }) => {
  http.get(`${basePath}${path}`).on("response", function (response) {
    var body = "";
    response.on("data", function (chunk) {
      body += chunk;
    });
    response.on("end", function () {
      const comments = extract(body);

      var output = "";

      var classInfo = {
        name: "",
        desc: "",
        constructor: [],
        methods: [],
        props: [],
        memberof: "",
      };

      var libs = {};

      comments.forEach((comment) => {
        var ast = doctrine.parse(comment.value, {
          unwrap: false,
          sloppy: true,
        });

        // console.log(ast)

        // console.log(ast);
        if (ast) {
          const isPrivate = ast.tags.some((t) => t.title == "private");
          if (isPrivate) return;

          var [first, ...rest] = ast.tags;

          if (!first) {
            // this is a regular comment
            return;
          }

          if (first?.title == "author") {
          } else if (first.title == "name") {
            var prop = {
              name: "",
              type: "",
              desc: ast.description,
            };

            ast.tags.forEach((t) => {
              if (t.title === "name") {
                prop.name = extractName(t.name);
              } else if (t.title === "type") {
                prop.type = convertType(t.type.name);
              }
            });

            classInfo.props.push(prop);
          } else if (first.title == "classdesc") {
            classInfo.desc = first.description;

            ast.tags.forEach((t) => {
              if (t.title == "class") {
                classInfo.name = t.name;
              } else if (t.title == "param") {
                  const type = t.type?.expression?.name
                    ? t.type.expression.name
                    : t.type.type == "UnionType"
                    ? t.type.elements[0].name
                    : t.type.name;

                const required = t.type.type != "OptionalType";

                const [validatedType] = type.includes(".")
                  ? type.split(".").reverse()
                  : [type];

                if (required)
                  classInfo.constructor.push({
                    name: t.name,
                    type: validatedType,
                    default: t.default,
                    required,
                  });
              } else if (first.title == "classdesc") {
                const [validatedParent] = ast.tags
                  .find((t) => t.title == "memberof")
                  .description.split(".")
                  .reverse();
                classInfo.memberof = validatedParent;
              } else {
                console.log("??", first);
                // classdesc
                // extends
                // memberof
                // constructor
              }
            });
          } else if (first.title === "method") {
            console.log(ast);
            classInfo.methods.push({
              name: first.name,
              desc: ast.description,
              args: rest
                .filter((r) => r.title == "param")
                .map((r) => {
                  if (first.name.includes("addFrame")) {
                  }
                  const type = r.type?.expression?.name
                    ? r.type.expression.name
                    : r.type.type == "UnionType"
                    ? r.type.elements[0].name
                    : r.type.name;

                  const required = r.type.type != "OptionalType";

                  return {
                    name: r.name,
                    type,
                    required,
                    desc: r.description,
                  };
                })
                .filter((r) => r.required),
              returns: (() => {
                return (
                  rest.find((r) => r.title == "return")?.type?.name || "unit"
                );
              })(),
            });
          } else {
            // console.log("?????????", first);
          }
        }
      });

      // console.log("##################");
      // console.log(JSON.stringify(classInfo, null, 2));
      // console.log("##################");
      //
      output += `foreign import data ${classInfo.name} :: Type
`;

      constructorArgs = classInfo.constructor
        .map((c) => c.type)
        .map(convertType);

      const classDesc = "-- | " + classInfo.desc.split("\n").join("\n-- | ");

      const newFn = `_new${constructorArgs.length}`;

      libs[newFn] = 1;

      output += `
${classDesc}
new :: ${classInfo.memberof} -> ${constructorArgs.join(" -> ")} -> Effect ${
        classInfo.name
      }
new = ${newFn} "${classInfo.name}"
`;

      classInfo.props.forEach((prop) => {
        const name = extractName(prop.name);
        const validatedName = reservedKeywords.includes(name)
          ? name + "'"
          : name;

        // get prop
        output += `
-- | ${prop.desc.split("\n").join("\n-- | ")}
${validatedName} :: ${classInfo.name} -> Effect ${prop.type}
${validatedName} = _getProp "${prop.name}"
`;
        // const nameInCamelCase =
        //   prop.name.slice(0, 1).toUpperCase() +
        //   prop.name.slice(1, prop.name.length);
        // // set prop
        // output += `
// -- | ${prop.desc.split("\n").join("\n-- | ")}
// set${nameInCamelCase}' :: ${prop.type} -> ${classInfo.name} -> Effect ${
        //   classInfo.name
        // }
// set${nameInCamelCase}' = _setProp "${prop.name}"
// `;
      });

      classInfo.methods.forEach((method) => {
        
        const argTypes = [
          ...method.args.map((a) => {

            const [name]= a.type.split(".").reverse()

            return name

          }),
          classInfo.name,
        ].map(convertType);
        const argNames = method.args.map((a) => a.name);

        const [returns] =
          method.returns == "this" ? [classInfo.name] : method.returns.split(".").reverse();

        const methodDesc = "-- | " + method.desc.split("\n").join("\n-- | ");
        const argsDesc = method.args
          .map(
            (arg) =>
              `-- |     ${arg.name} - ${convertType(arg.type)} - ${arg.desc}`
          )
          .join("\n");
        const name = extractName(method.name);
        const validatedName = reservedKeywords.includes(name)
          ? name + "'"
          : name;
        const argDescString =
          argsDesc.length > 0
            ? `
-- | Parameters:
${argsDesc}`
          : "";

        const fnType = returns === classInfo.name ? "_method" : "_return"

        const methodFn = `${fnType}${argNames.length}`;
        libs[methodFn] = 1;
        output += `
${methodDesc}${argDescString}
-- |
${validatedName} :: ${argTypes.join(" -> ")} -> Effect ${convertType(returns)}
${validatedName} = ${methodFn} "${name}"
`;
      });

      // console.log(output);
      const fns = Object.keys(libs).sort().join(", ");

      output =
        `module Graphics.Phaser.${moduleName} where

-- | (Mostly) autogenerated from ${basePath}${path}
import Prelude
import Effect (Effect)
import Utils.FFI (_getProp, ${fns})
` + output;

      fs.writeFile(destination + "_", output, () => {
        console.log(classInfo.name, "complete");
      });
    });
  });
});
