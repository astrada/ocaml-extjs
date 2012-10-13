(** A mixin which allows a component to be configured ...
  
  {% <p>A mixin which allows a component to be configured and decorated with a label and/or error message as is
common for form fields. This is used by e.g. <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> and <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a>
to let them be managed by the Field layout.</p>

<p>NOTE: This mixin is mainly for internal library use and most users should not need to use it directly. It
is more likely you will want to use one of the component classes that import this mixin, such as
<a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> or <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a>.</p>

<p>Use of this mixin does not make a component a field in the logical sense, meaning it does not provide any
logic or state related to values or validation; that is handled by the related <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a>
mixin. These two mixins may be used separately (for example <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a> is Labelable but not a
Field), or in combination (for example <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> implements both and has logic for connecting the
two.)</p>

<p>Component classes which use this mixin should use the Field layout
or a derivation thereof to properly size and position the label and message according to the component config.
They must also call the <a href="#!/api/Ext.form.Labelable-method-initLabelable" rel="Ext.form.Labelable-method-initLabelable" class="docClass">initLabelable</a> method during component initialization to ensure the mixin gets
set up correctly.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method bodyEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The div Element wrapping the component's contents. Only available after the component has been rendered.</p> %}
    *)
  method errorEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The div Element that will contain the component's error message(s). Note that depending on the configured
<a href="#!/api/Ext.form.Labelable-cfg-msgTarget" rel="Ext.form.Labelable-cfg-msgTarget" class="docClass">msgTarget</a>, this element may be hidden in favor of some other form of presentation, but will always
be present in the DOM for use by assistive technologies.</p> %}
    *)
  method isFieldLabelable : bool Js.t Js.prop
  (** {% <p>Flag denoting that this object is labelable as a field. Always true.</p> %}
    
    Defaults to: [true]
    *)
  method labelCell : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The <code>&lt;TD&gt;</code> Element which contains the label Element for this component. Only available after the component has been rendered.</p> %}
    *)
  method labelEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The label Element for this component. Only available after the component has been rendered.</p> %}
    *)
  method getActiveError : Js.js_string Js.t Js.meth
  (** {% <p>Gets the active error message for this component, if any. This does not trigger validation on its own, it merely
returns any message that the component may already hold.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The active error message on the component; if there is no error, an empty string is returned.</p> %}
    }
    }
    *)
  method getActiveErrors : Js.js_string Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets an Array of any active error messages currently applied to the field. This does not trigger validation on
its own, it merely returns any messages that the component may already hold.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t Js.js_array Js.t]
    {% <p>The active error messages on the component; if there are no errors, an empty Array is
returned.</p> %}
    }
    }
    *)
  method getFieldLabel : Js.js_string Js.t Js.meth
  (** {% <p>Returns the label for the field. Defaults to simply returning the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> config. Can be overridden
to provide a custom generated label.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The configured field label, or empty string if not defined</p> %}
    }
    }
    *)
  method getInputId : Js.js_string Js.t Js.meth
  (** {% <p>Get the input id, if any, for this component. This is used as the "for" attribute on the label element.
Implementing subclasses may also use this as e.g. the id for their own input element.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The input id</p> %}
    }
    }
    *)
  method getLabelableRenderData : 'a Js.t Js.meth
  (** {% <p>Generates the arguments for the field decorations <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">rendering template</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The template arguments</p> %}
    }
    }
    *)
  method getSubTplMarkup : Js.js_string Js.t Js.meth
  (** {% <p>Gets the markup to be inserted into the outer template's bodyEl. Defaults to empty string, should be implemented
by classes including this mixin as needed.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The markup to be inserted</p> %}
    }
    }
    *)
  method hasActiveError : bool Js.t Js.meth
  (** {% <p>Tells whether the field currently has an active error message. This does not trigger validation on its own, it
merely looks for any message that the component may already hold.</p> %}
    *)
  method hasVisibleLabel : bool Js.t Js.meth
  (** {% <p>Checks if the field has a visible label</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the field has a visible label</p> %}
    }
    }
    *)
  method initLabelable : unit Js.meth
  (** {% <p>Performs initialization of this mixin. Component classes using this mixin should call this method during their
own initialization.</p> %}
    *)
  method setActiveError : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the active error message to the given string. This replaces the entire error message contents with the given
string. Also see <a href="#!/api/Ext.form.Labelable-method-setActiveErrors" rel="Ext.form.Labelable-method-setActiveErrors" class="docClass">setActiveErrors</a> which accepts an Array of messages and formats them according to the
<a href="#!/api/Ext.form.Labelable-cfg-activeErrorsTpl" rel="Ext.form.Labelable-cfg-activeErrorsTpl" class="docClass">activeErrorsTpl</a>. Note that this only updates the error message element's text and attributes, you'll
have to call doComponentLayout to actually update the field's layout to match. If the field extends <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> you should call <a href="#!/api/Ext.form.field.Base-method-markInvalid" rel="Ext.form.field.Base-method-markInvalid" class="docClass">markInvalid</a> instead.</p> %}
    
    {b Parameters}:
    {ul {- msg: [Js.js_string Js.t] {% <p>The error message</p> %}
    }
    }
    *)
  method setActiveErrors : Js.js_string Js.t Js.js_array Js.t -> unit Js.meth
  (** {% <p>Set the active error message to an Array of error messages. The messages are formatted into a single message
string using the <a href="#!/api/Ext.form.Labelable-cfg-activeErrorsTpl" rel="Ext.form.Labelable-cfg-activeErrorsTpl" class="docClass">activeErrorsTpl</a>. Also see <a href="#!/api/Ext.form.Labelable-method-setActiveError" rel="Ext.form.Labelable-method-setActiveError" class="docClass">setActiveError</a> which allows setting the entire error
contents with a single string. Note that this only updates the error message element's text and attributes,
you'll have to call doComponentLayout to actually update the field's layout to match. If the field extends
<a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> you should call <a href="#!/api/Ext.form.field.Base-method-markInvalid" rel="Ext.form.field.Base-method-markInvalid" class="docClass">markInvalid</a> instead.</p> %}
    
    {b Parameters}:
    {ul {- errors: [Js.js_string Js.t Js.js_array Js.t]
    {% <p>The error messages</p> %}
    }
    }
    *)
  method setFieldDefaults : 'a Js.t -> unit Js.meth
  (** {% <p>Applies a set of default configuration values to this Labelable instance. For each of the properties in the given
object, check if this component hasOwnProperty that config; if not then it's inheriting a default value from its
prototype and we should apply the default value.</p> %}
    
    {b Parameters}:
    {ul {- defaults: ['a Js.t]
    {% <p>The defaults to apply to the object.</p> %}
    }
    }
    *)
  method setFieldLabel : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Set the label of this field.</p> %}
    
    {b Parameters}:
    {ul {- label: [Js.js_string Js.t]
    {% <p>The new label. The <a href="#!/api/Ext.form.Labelable-cfg-labelSeparator" rel="Ext.form.Labelable-cfg-labelSeparator" class="docClass">labelSeparator</a> will be automatically appended to the label
string.</p> %}
    }
    }
    *)
  method trimLabelSeparator : Js.js_string Js.t Js.meth
  (** {% <p>Returns the trimmed label by slicing off the label separator character. Can be overridden.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The trimmed field label, or empty string if not defined</p> %}
    }
    }
    *)
  method unsetActiveError : unit Js.meth
  (** {% <p>Clears the active error message(s). Note that this only clears the error message element's text and attributes,
you'll have to call doComponentLayout to actually update the field's layout to match. If the field extends <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> you should call <a href="#!/api/Ext.form.field.Base-method-clearInvalid" rel="Ext.form.field.Base-method-clearInvalid" class="docClass">clearInvalid</a> instead.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method getFieldLabel : ('self Js.t, unit -> Js.js_string Js.t)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.getFieldLabel] *)
  method activeError : Js.js_string Js.t Js.prop
  (** {% <p>If specified, then the component will be displayed with this value as its active error when first rendered. Use
<a href="#!/api/Ext.form.Labelable-method-setActiveError" rel="Ext.form.Labelable-method-setActiveError" class="docClass">setActiveError</a> or <a href="#!/api/Ext.form.Labelable-method-unsetActiveError" rel="Ext.form.Labelable-method-unsetActiveError" class="docClass">unsetActiveError</a> to change it after component creation.</p> %}
    *)
  method activeErrorsTpl : 'a Js.t Js.prop
  (** {% <p>The template used to format the Array of error messages passed to <a href="#!/api/Ext.form.Labelable-method-setActiveErrors" rel="Ext.form.Labelable-method-setActiveErrors" class="docClass">setActiveErrors</a> into a single HTML
string. By default this renders each message as an item in an unordered list.</p> %}
    
    Defaults to: [['<tpl if="errors && errors.length">', '<ul><tpl for="errors"><li>{.}</li></tpl></ul>', '</tpl>']]
    *)
  method afterBodyEl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
at the end of the input containing element. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method afterLabelTextTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
after the label text. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method afterLabelTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
after the label element. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method afterSubTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
after the <a href="#!/api/Ext.form.Labelable-method-getSubTplMarkup" rel="Ext.form.Labelable-method-getSubTplMarkup" class="docClass">subTpl markup</a>. If an <code>XTemplate</code> is used, the
component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a> serves as the context.</p> %}
    *)
  method autoFitErrors : bool Js.t Js.prop
  (** {% <p>Whether to adjust the component's body area to make room for 'side' or 'under' <a href="#!/api/Ext.form.Labelable-cfg-msgTarget" rel="Ext.form.Labelable-cfg-msgTarget" class="docClass">error messages</a>.</p> %}
    
    Defaults to: [true]
    *)
  method baseBodyCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to be applied to the body content element.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-item-body']
    *)
  method beforeBodyEl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
at the beginning of the input containing element. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method beforeLabelTextTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
before the label text. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method beforeLabelTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
before the label element. If an <code>XTemplate</code> is used, the component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a>
serves as the context.</p> %}
    *)
  method beforeSubTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
before the <a href="#!/api/Ext.form.Labelable-method-getSubTplMarkup" rel="Ext.form.Labelable-method-getSubTplMarkup" class="docClass">subTpl markup</a>. If an <code>XTemplate</code> is used, the
component's <a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a> serves as the context.</p> %}
    *)
  method clearCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to be applied to the special clearing div rendered directly after the field contents wrapper to
provide field clearing.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'clear']
    *)
  method errorMsgCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to be applied to the error message element.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-error-msg']
    *)
  method fieldBodyCls : Js.js_string Js.t Js.prop
  (** {% <p>An extra CSS class to be applied to the body content element in addition to <a href="#!/api/Ext.form.Labelable-cfg-baseBodyCls" rel="Ext.form.Labelable-cfg-baseBodyCls" class="docClass">baseBodyCls</a>.</p> %}
    
    Defaults to: ['']
    *)
  method fieldLabel : Js.js_string Js.t Js.prop
  (** {% <p>The label for the field. It gets appended with the <a href="#!/api/Ext.form.Labelable-cfg-labelSeparator" rel="Ext.form.Labelable-cfg-labelSeparator" class="docClass">labelSeparator</a>, and its position and sizing is
determined by the <a href="#!/api/Ext.form.Labelable-cfg-labelAlign" rel="Ext.form.Labelable-cfg-labelAlign" class="docClass">labelAlign</a>, <a href="#!/api/Ext.form.Labelable-cfg-labelWidth" rel="Ext.form.Labelable-cfg-labelWidth" class="docClass">labelWidth</a>, and <a href="#!/api/Ext.form.Labelable-cfg-labelPad" rel="Ext.form.Labelable-cfg-labelPad" class="docClass">labelPad</a> configs.</p> %}
    *)
  method formItemCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to be applied to the outermost element to denote that it is participating in the form field layout.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-item']
    *)
  method hideEmptyLabel : bool Js.t Js.prop
  (** {% <p>When set to true, the label element (<a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> and <a href="#!/api/Ext.form.Labelable-cfg-labelSeparator" rel="Ext.form.Labelable-cfg-labelSeparator" class="docClass">labelSeparator</a>) will be automatically
hidden if the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> is empty. Setting this to false will cause the empty label element to be
rendered and space to be reserved for it; this is useful if you want a field without a label to line up with
other labeled fields in the same form.</p>

<p>If you wish to unconditionall hide the label even if a non-empty fieldLabel is configured, then set the
<a href="#!/api/Ext.form.Labelable-cfg-hideLabel" rel="Ext.form.Labelable-cfg-hideLabel" class="docClass">hideLabel</a> config to true.</p> %}
    
    Defaults to: [true]
    *)
  method hideLabel : bool Js.t Js.prop
  (** {% <p>Set to true to completely hide the label element (<a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> and <a href="#!/api/Ext.form.Labelable-cfg-labelSeparator" rel="Ext.form.Labelable-cfg-labelSeparator" class="docClass">labelSeparator</a>). Also see
<a href="#!/api/Ext.form.Labelable-cfg-hideEmptyLabel" rel="Ext.form.Labelable-cfg-hideEmptyLabel" class="docClass">hideEmptyLabel</a>, which controls whether space will be reserved for an empty fieldLabel.</p> %}
    
    Defaults to: [false]
    *)
  method invalidCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to use when marking the component invalid.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-invalid']
    *)
  method labelAlign : Js.js_string Js.t Js.prop
  (** {% <p>Controls the position and alignment of the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a>. Valid values are:</p>

<ul>
<li>"left" (the default) - The label is positioned to the left of the field, with its text aligned to the left.
Its width is determined by the <a href="#!/api/Ext.form.Labelable-cfg-labelWidth" rel="Ext.form.Labelable-cfg-labelWidth" class="docClass">labelWidth</a> config.</li>
<li>"top" - The label is positioned above the field.</li>
<li>"right" - The label is positioned to the left of the field, with its text aligned to the right.
Its width is determined by the <a href="#!/api/Ext.form.Labelable-cfg-labelWidth" rel="Ext.form.Labelable-cfg-labelWidth" class="docClass">labelWidth</a> config.</li>
</ul> %}
    
    Defaults to: ['left']
    *)
  method labelAttrTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
inside the label element (as attributes). If an <code>XTemplate</code> is used, the component's
<a href="#!/api/Ext.AbstractComponent-cfg-renderData" rel="Ext.AbstractComponent-cfg-renderData" class="docClass">render data</a> serves as the context.</p> %}
    *)
  method labelCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to be applied to the label element. This (single) CSS class is used to formulate the renderSelector
and drives the field layout where it is concatenated with a hyphen ('-') and <a href="#!/api/Ext.form.Labelable-cfg-labelAlign" rel="Ext.form.Labelable-cfg-labelAlign" class="docClass">labelAlign</a>. To add
additional classes, use <a href="#!/api/Ext.form.Labelable-cfg-labelClsExtra" rel="Ext.form.Labelable-cfg-labelClsExtra" class="docClass">labelClsExtra</a>.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-item-label']
    *)
  method labelClsExtra : Js.js_string Js.t Js.prop
  (** {% <p>An optional string of one or more additional CSS classes to add to the label element. Defaults to empty.</p> %}
    *)
  method labelPad : Js.number Js.t Js.prop
  (** {% <p>The amount of space in pixels between the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> and the input field.</p> %}
    
    Defaults to: [5]
    *)
  method labelSeparator : Js.js_string Js.t Js.prop
  (** {% <p>Character(s) to be inserted at the end of the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">label text</a>.</p>

<p>Set to empty string to hide the separator completely.</p> %}
    
    Defaults to: [':']
    *)
  method labelStyle : Js.js_string Js.t Js.prop
  (** {% <p>A CSS style specification string to apply directly to this field's label.</p> %}
    *)
  method labelWidth : Js.number Js.t Js.prop
  (** {% <p>The width of the <a href="#!/api/Ext.form.Labelable-cfg-fieldLabel" rel="Ext.form.Labelable-cfg-fieldLabel" class="docClass">fieldLabel</a> in pixels. Only applicable if the <a href="#!/api/Ext.form.Labelable-cfg-labelAlign" rel="Ext.form.Labelable-cfg-labelAlign" class="docClass">labelAlign</a> is set to "left" or
"right".</p> %}
    
    Defaults to: [100]
    *)
  method msgTarget : Js.js_string Js.t Js.prop
  (** {% <p>The location where the error message text should display. Must be one of the following values:</p>

<ul>
<li><p><code>qtip</code> Display a quick tip containing the message when the user hovers over the field.
This is the default.</p>

<p><strong><a href="#!/api/Ext.tip.QuickTipManager-method-init" rel="Ext.tip.QuickTipManager-method-init" class="docClass">Ext.tip.QuickTipManager.init</a> must have been called for this setting to work.</strong></p></li>
<li><p><code>title</code> Display the message in a default browser title attribute popup.</p></li>
<li><code>under</code> Add a block div beneath the field containing the error message.</li>
<li><code>side</code> Add an error icon to the right of the field, displaying the message in a popup on hover.</li>
<li><code>none</code> Don't display any error message. This might be useful if you are implementing custom error display.</li>
<li><code>[element id]</code> Add the error message directly to the innerHTML of the specified element.</li>
</ul> %}
    
    Defaults to: ['qtip']
    *)
  method preventMark : bool Js.t Js.prop
  (** {% <p>true to disable displaying any <a href="#!/api/Ext.form.Labelable-method-setActiveError" rel="Ext.form.Labelable-method-setActiveError" class="docClass">error message</a> set on this object.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  method errorchange : (t Js.t -> Js.js_string Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the active error message is changed via <a href="#!/api/Ext.form.Labelable-method-setActiveError" rel="Ext.form.Labelable-method-setActiveError" class="docClass">setActiveError</a>.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Labelable.t Js.t]
    }
    {- error: [Js.js_string Js.t]
    {% <p>The active error message</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

