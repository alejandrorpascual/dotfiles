var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __markAsModule = (target) => __defProp(target, "__esModule", { value: true });
var __reExport = (target, module2, desc) => {
  if (module2 && typeof module2 === "object" || typeof module2 === "function") {
    for (let key of __getOwnPropNames(module2))
      if (!__hasOwnProp.call(target, key) && key !== "default")
        __defProp(target, key, { get: () => module2[key], enumerable: !(desc = __getOwnPropDesc(module2, key)) || desc.enumerable });
  }
  return target;
};
var __toModule = (module2) => {
  return __reExport(__markAsModule(__defProp(module2 != null ? __create(__getProtoOf(module2)) : {}, "default", module2 && module2.__esModule && "default" in module2 ? { get: () => module2.default, enumerable: true } : { value: module2, enumerable: true })), module2);
};
var import_promises = __toModule(require("fs/promises"));
var import_path = __toModule(require("path"));
var import_js_yaml = __toModule(require("js-yaml"));
var import_deepcopy = __toModule(require("deepcopy"));
async function readFile(filePath2, theme2) {
  if (!theme2) {
    throw new Error("Enter dawnfox or nightfox as a second argument");
  }
  try {
    console.log("path.dirname(filePath) :>> ", import_path.default.dirname(filePath2));
    await import_promises.default.copyFile(filePath2, "alacritty-backup.yml");
    const fileContents = await import_promises.default.readFile(filePath2, "utf-8");
    const oldObj = import_js_yaml.default.load(fileContents);
    const newObj = (0, import_deepcopy.default)(oldObj);
    if (theme2 === "dawnfox") {
      newObj.colors = newObj.schemes.DawnFox;
    } else {
      newObj.colors = newObj.schemes.NighFox;
    }
    console.log(import_js_yaml.default.dump(newObj, { indent: 2 }));
  } catch (e) {
    console.error(e);
  }
}
const [, , filePath, theme] = process.argv;
readFile(filePath, theme);
//# sourceMappingURL=main.js.map
