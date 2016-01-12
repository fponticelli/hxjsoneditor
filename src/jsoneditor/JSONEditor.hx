package jsoneditor;

import js.Browser;
import js.html.Element;

@:enum
abstract JSONEditorShowErrors(String) {
  var Always = "always";
  var Never = "never";
  var Interaction = "interaction";
  var Change = "change";
}

typedef JSONEditorOptions = {
/**
If true, JSON Editor will load external URLs in $ref via ajax. Default `false`.
*/
  ?ajax : Bool,
/**
If true, remove all "add row" buttons from arrays. Default `false`.
*/
  ?disable_array_add : Bool,
/**
If true, remove all "delete row" buttons from arrays. Default `false`.
*/
  ?disable_array_delete : Bool,
/**
If true, remove all "move up" and "move down" buttons from arrays. Default `false`.
*/
  ?disable_array_reorder : Bool,
/**
If true, remove all collapse buttons from objects and arrays. Default `false`.
*/
  ?disable_collapse : Bool,
/**
If true, remove all Edit JSON buttons from objects. Default `false`.
*/
  ?disable_edit_json : Bool,
/**
If true, remove all Edit Properties buttons from objects. Default `false`.
*/
  ?disable_properties : Bool,
/**
The first part of the `name` attribute of form inputs in the editor. An full example name is `root[person][name]` where "root" is the form_name_root. Default `root`.
*/
  ?form_name_root : String,
/**
The icon library to use for the editor. See the CSS Integration section below for more info. Default `null`.
*/
  ?iconlib : String,
/**
If true, objects can only contain properties defined with the properties keyword. Default `false`.
*/
  ?no_additional_properties : Bool,
/**
An object containing schema definitions for URLs. Allows you to pre-define external schemas. Default `{}`.
*/
  ?refs : {},
/**
If true, all schemas that don't explicitly set the required property will be required. Default `false`.
*/
  ?required_by_default : Bool,
/**
A valid JSON Schema to use for the editor. Version 3 and Version 4 of the draft specification are supported. Default `{}`.
*/
  ?schema : {},
/**
When to show validation errors in the UI. Valid values are interaction, change, always, and never. Default `"interaction"`.
*/
  ?show_errors : JSONEditorShowErrors,
/**
Seed the editor with an initial value. This should be valid against the editor's schema. Default `null`.
*/
  ?startval : {},
/**
The JS template engine to use. See the Templates and Variables section below for more info. Default `"default"`.
*/
  ?template : String,
/**
The CSS theme to use. See the CSS Integration section below for more info. Default "`html`".
*/
  ?theme : String
};

typedef JSONEditorError = {
  ?path: String,
  ?property : String,
  ?message : String
};

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

/*
class JSONEditorInit {
  static function init() {
    JSONEditor.defaults.resolvers.unshift(function(schema) {
      if (schema.format == "date") {
        return "bootstrapDatePicker";
      }
      return null;
    });

    JSONEditor.defaults.editors.bootstrapDatePicker = function() {
      return new BootstrapDatePicker();
    };
  }
}


@:native("JSONEditor.AbstractEditor")
extern class AbstractEditor {
}

class BootstrapDatePicker extends AbstractEditor {
  function new() {
  }
}
*/
