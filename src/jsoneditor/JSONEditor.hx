package jsoneditor;

import js.html.Element;

@:native("JSONEditor")
extern class JSONEditor {
  // Constructor
  function new(element : Element, options : JSONEditorOptions) : Void;

  var ready : Bool;

  // Access the options
  var options(default, null) : JSONEditorOptions;
  var element(default, null) : Element;
  var editors(default, null) : {};

  static var defaults(default, null) : {
    editors: Dynamic,
    resolvers: Array<{ type: String, format: String } -> Void>
  };

  // Get/Set Value
  function getValue() : Dynamic;
  function setValue(obj : Dynamic) : Void;
  function getEditor(name : String) : JSONEditor;
  var schema : {};

  // Validate
  function validate(?obj : Dynamic) : Array<JSONEditorError>;

  // Listen for Changes (Events)
  function on(eventName : String, callback : Void -> Void) : Void;
  function off(eventName : String, callback : Void -> Void) : Void;
  function watch(propertyPath : String, callback : Void -> Void) : Void;
  function unwatch(propertyPath : String, callback : Void -> Void) : Void;
  function onChange() : Void; // Force the onChange logic to run

  // Enable/Disable the Editor
  function enable() : Void;
  function disable() : Void;
  function isEnabled() : Bool;

  // Destroy
  function destroy() : Void;
}
