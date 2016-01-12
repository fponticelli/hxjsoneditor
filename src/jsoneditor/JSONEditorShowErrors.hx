package jsoneditor;

@:enum
abstract JSONEditorShowErrors(String) {
  var Always = "always";
  var Never = "never";
  var Interaction = "interaction";
  var Change = "change";
}
