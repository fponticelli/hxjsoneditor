package jsoneditor;

typedef JSONEditorBaseOptions = {
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
    schema : {},
  /**
  When to show validation errors in the UI. Valid values are interaction, change, always, and never. Default `"interaction"`.
  */
    ?show_errors : JSONEditorShowErrors,
  /**
  The JS template engine to use. See the Templates and Variables section below for more info. Default `"default"`.
  */
    ?template : String,
  /**
  The CSS theme to use. See the CSS Integration section below for more info. Default "`html`".
  */
    ?theme : String
}

typedef JSONEditorOptions = {>JSONEditorBaseOptions,
  /**
  Seed the editor with an initial value. This should be valid against the editor's schema. Default `null`.
  */
  ?startval : {},
};
