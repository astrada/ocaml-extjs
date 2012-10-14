(** Base class for form fields that provides default e ...
  
  {% <p>Base class for form fields that provides default event handling, rendering, and other common functionality
needed by all form field types. Utilizes the <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> mixin for value handling and validation,
and the <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> mixin to provide label and error message display.</p>

<p>In most cases you will want to use a subclass, such as <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a> or <a href="#!/api/Ext.form.field.Checkbox" rel="Ext.form.field.Checkbox" class="docClass">Ext.form.field.Checkbox</a>,
rather than creating instances of this class directly. However if you are implementing a custom form field,
using this as the parent class is recommended.</p>

<h1>Values and Conversions</h1>

<p>Because Base implements the Field mixin, it has a main value that can be initialized with the
<a href="#!/api/Ext.form.field.Base-cfg-value" rel="Ext.form.field.Base-cfg-value" class="docClass">value</a> config and manipulated via the <a href="#!/api/Ext.form.field.Base-method-getValue" rel="Ext.form.field.Base-method-getValue" class="docClass">getValue</a> and <a href="#!/api/Ext.form.field.Base-method-setValue" rel="Ext.form.field.Base-method-setValue" class="docClass">setValue</a> methods. This main
value can be one of many data types appropriate to the current field, for instance a <a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Date</a>
field would use a JavaScript Date object as its value type. However, because the field is rendered as a HTML
input, this value data type can not always be directly used in the rendered field.</p>

<p>Therefore Base introduces the concept of a "raw value". This is the value of the rendered HTML input field,
and is normally a String. The <a href="#!/api/Ext.form.field.Base-method-getRawValue" rel="Ext.form.field.Base-method-getRawValue" class="docClass">getRawValue</a> and <a href="#!/api/Ext.form.field.Base-method-setRawValue" rel="Ext.form.field.Base-method-setRawValue" class="docClass">setRawValue</a> methods can be used to directly
work with the raw value, though it is recommended to use getValue and setValue in most cases.</p>

<p>Conversion back and forth between the main value and the raw value is handled by the <a href="#!/api/Ext.form.field.Base-method-valueToRaw" rel="Ext.form.field.Base-method-valueToRaw" class="docClass">valueToRaw</a> and
<a href="#!/api/Ext.form.field.Base-method-rawToValue" rel="Ext.form.field.Base-method-rawToValue" class="docClass">rawToValue</a> methods. If you are implementing a subclass that uses a non-String value data type, you
should override these methods to handle the conversion.</p>

<h1>Rendering</h1>

<p>The content of the field body is defined by the <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">fieldSubTpl</a> XTemplate, with its argument data
created by the <a href="#!/api/Ext.form.field.Base-method-getSubTplData" rel="Ext.form.field.Base-method-getSubTplData" class="docClass">getSubTplData</a> method. Override this template and/or method to create custom
field renderings.</p>

<h1>Example usage:</h1>

<pre class='inline-example '><code>// A simple subclass of Base that creates a HTML5 search field. Redirects to the
// searchUrl when the Enter key is pressed.222
<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.form.SearchField', {
    extend: '<a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>',
    alias: 'widget.searchfield',

    inputType: 'search',

    // Config defining the search URL
    searchUrl: 'http://www.google.com/search?q={0}',

    // Add specialkey listener
    initComponent: function() {
        this.callParent();
        this.on('specialkey', this.checkEnterKey, this);
    },

    // Handle enter key presses, execute the search if the field has a value
    checkEnterKey: function(field, e) {
        var value = this.getValue();
        if (e.getKey() === e.ENTER &amp;&amp; !<a href="#!/api/Ext-method-isEmpty" rel="Ext-method-isEmpty" class="docClass">Ext.isEmpty</a>(value)) {
            location.href = <a href="#!/api/Ext.String-method-format" rel="Ext.String-method-format" class="docClass">Ext.String.format</a>(this.searchUrl, value);
        }
    }
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>', {
    title: 'Base Example',
    bodyPadding: 5,
    width: 250,

    // Fields will be arranged vertically, stretched to full width
    layout: 'anchor',
    defaults: {
        anchor: '100%'
    },
    items: [{
        xtype: 'searchfield',
        fieldLabel: 'Search',
        name: 'query'
    }],
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_form_Labelable.t
  inherit Ext_form_field_Field.t
  
  method inputEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The input Element for this Field. Only available after the field has been rendered.</p> %}
    *)
  method maskOnDisable : bool Js.t Js.prop
  (** {% <p>This is an internal flag that you use when creating custom components. By default this is set to true which means
that every component gets a mask when it's disabled. Components like FieldContainer, FieldSet, Field, Button, Tab
override this property to false since they want to implement custom disable logic.</p> %}
    
    Defaults to: [false]
    *)
  method clearInvalid : unit Js.meth
  (** {% <p>Clear any invalid styles/messages for this field.</p>

<p><strong>Note</strong>: this method does not cause the Field's <a href="#!/api/Ext.form.field.Base-method-validate" rel="Ext.form.field.Base-method-validate" class="docClass">validate</a> or <a href="#!/api/Ext.form.field.Base-method-isValid" rel="Ext.form.field.Base-method-isValid" class="docClass">isValid</a> methods to return <code>true</code>
if the value does not <em>pass</em> validation. So simply clearing a field's errors will not necessarily allow
submission of forms submitted with the <a href="#!/api/Ext.form.action.Submit-cfg-clientValidation" rel="Ext.form.action.Submit-cfg-clientValidation" class="docClass">Ext.form.action.Submit.clientValidation</a> option set.</p> %}
    *)
  method doComponentLayout_container : #Ext_container_Container.t Js.t
    Js.meth
  (** {% <p>This method needs to be called whenever you change something on this component that requires the Component's
layout to be recalculated.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method extractFileInput : Dom_html.element Js.t Js.meth
  (** {% <p>Only relevant if the instance's <a href="#!/api/Ext.form.field.Base-method-isFileUpload" rel="Ext.form.field.Base-method-isFileUpload" class="docClass">isFileUpload</a> method returns true. Returns a reference to the file input
DOM element holding the user's selected file. The input will be appended into the submission form and will not be
returned, so this method should also create a replacement.</p> %}
    *)
  method getRawValue : Js.js_string Js.t Js.meth
  (** {% <p>Returns the raw value of the field, without performing any normalization, conversion, or validation. To get a
normalized and converted value see <a href="#!/api/Ext.form.field.Base-method-getValue" rel="Ext.form.field.Base-method-getValue" class="docClass">getValue</a>.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>value The raw String value of the field</p> %}
    }
    }
    *)
  method getSubTplData : 'a Js.t Js.meth
  (** {% <p>Creates and returns the data object to be used when rendering the <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">fieldSubTpl</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The template data</p> %}
    }
    }
    *)
  method getSubmitData : 'a Js.t Js.meth
  (** {% <p>private override to use getSubmitValue() as a convenience</p>

<p>Returns the parameter(s) that would be included in a standard form submit for this field. Typically this will be
an object with a single name-value pair, the name being this field's <a href="#!/api/Ext.form.field.Base-method-getName" rel="Ext.form.field.Base-method-getName" class="docClass">name</a> and the value being
its current stringified value. More advanced field implementations may return more than one name-value pair.</p>

<p>Note that the values returned from this method are not guaranteed to have been successfully <a href="#!/api/Ext.form.field.Base-method-validate" rel="Ext.form.field.Base-method-validate" class="docClass">validated</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>A mapping of submit parameter names to values; each value should be a string, or an array of
strings if that particular name has multiple values. It can also return null if there are no parameters to be
submitted.</p> %}
    }
    }
    *)
  method getSubmitValue : Js.js_string Js.t Js.meth
  (** {% <p>Returns the value that would be included in a standard form submit for this field. This will be combined with the
field's name to form a name=value pair in the <a href="#!/api/Ext.form.field.Base-method-getSubmitData" rel="Ext.form.field.Base-method-getSubmitData" class="docClass">submitted parameters</a>. If an empty string is
returned then just the name= will be submitted; if null is returned then nothing will be submitted.</p>

<p>Note that the value returned will have been <a href="#!/api/Ext.form.field.Base-method-processRawValue" rel="Ext.form.field.Base-method-processRawValue" class="docClass">processed</a> but may or may not have been
successfully <a href="#!/api/Ext.form.field.Base-method-validate" rel="Ext.form.field.Base-method-validate" class="docClass">validated</a>.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The value to be submitted, or null.</p> %}
    }
    }
    *)
  method getValue : 'a Js.t Js.meth
  (** {% <p>Returns the current data value of the field. The type of value returned is particular to the type of the
particular field (e.g. a Date object for <a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Ext.form.field.Date</a>), as the result of calling <a href="#!/api/Ext.form.field.Base-method-rawToValue" rel="Ext.form.field.Base-method-rawToValue" class="docClass">rawToValue</a> on
the field's <a href="#!/api/Ext.form.field.Base-method-processRawValue" rel="Ext.form.field.Base-method-processRawValue" class="docClass">processed</a> String value. To return the raw String value, see <a href="#!/api/Ext.form.field.Base-method-getRawValue" rel="Ext.form.field.Base-method-getRawValue" class="docClass">getRawValue</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>value The field value</p> %}
    }
    }
    *)
  method initComponent : unit Js.meth
  (** {% <p>private</p>

<p>The initComponent template method is an important initialization step for a Component. It is intended to be
implemented by each subclass of <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to provide any needed constructor logic. The
initComponent method of the class being created is called first, with each initComponent method
up the hierarchy to <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> being called thereafter. This makes it easy to implement and,
if needed, override the constructor logic of the Component at any step in the hierarchy.</p>

<p>The initComponent method <strong>must</strong> contain a call to <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">callParent</a> in order
to ensure that the parent class' initComponent method is also called.</p>

<p>All config options passed to the constructor are applied to <code>this</code> before initComponent is called,
so you can simply access them with <code>this.someOption</code>.</p>

<p>The following example demonstrates using a dynamic string for the text of a button at the time of
instantiation of the class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() {
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    }
});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() {
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
});
</code></pre> %}
    *)
  method isFileUpload : bool Js.t Js.meth
  (** {% <p>Returns whether this Field is a file upload field; if it returns true, forms will use special techniques for
<a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submitting the form</a> via AJAX. See <a href="#!/api/Ext.form.Basic-method-hasUpload" rel="Ext.form.Basic-method-hasUpload" class="docClass">Ext.form.Basic.hasUpload</a> for details. If
this returns true, the <a href="#!/api/Ext.form.field.Base-method-extractFileInput" rel="Ext.form.field.Base-method-extractFileInput" class="docClass">extractFileInput</a> method must also be implemented to return the corresponding file
input element.</p> %}
    *)
  method isValid : bool Js.t Js.meth
  (** {% <p>Returns whether or not the field value is currently valid by <a href="#!/api/Ext.form.field.Base-method-getErrors" rel="Ext.form.field.Base-method-getErrors" class="docClass">validating</a> the
<a href="#!/api/Ext.form.field.Base-method-processRawValue" rel="Ext.form.field.Base-method-processRawValue" class="docClass">processed raw value</a> of the field. <strong>Note</strong>: <a href="#!/api/Ext.form.field.Base-cfg-disabled" rel="Ext.form.field.Base-cfg-disabled" class="docClass">disabled</a> fields are
always treated as valid.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the value is valid, else false</p> %}
    }
    }
    *)
  method markInvalid : 'a Js.t -> unit Js.meth
  (** {% <p>Display one or more error messages associated with this field, using <a href="#!/api/Ext.form.field.Base-cfg-msgTarget" rel="Ext.form.field.Base-cfg-msgTarget" class="docClass">msgTarget</a> to determine how to
display the messages and applying <a href="#!/api/Ext.form.field.Base-cfg-invalidCls" rel="Ext.form.field.Base-cfg-invalidCls" class="docClass">invalidCls</a> to the field's UI element.</p>

<p><strong>Note</strong>: this method does not cause the Field's <a href="#!/api/Ext.form.field.Base-method-validate" rel="Ext.form.field.Base-method-validate" class="docClass">validate</a> or <a href="#!/api/Ext.form.field.Base-method-isValid" rel="Ext.form.field.Base-method-isValid" class="docClass">isValid</a> methods to return <code>false</code>
if the value does <em>pass</em> validation. So simply marking a Field as invalid will not prevent submission of forms
submitted with the <a href="#!/api/Ext.form.action.Submit-cfg-clientValidation" rel="Ext.form.action.Submit-cfg-clientValidation" class="docClass">Ext.form.action.Submit.clientValidation</a> option set.</p> %}
    
    {b Parameters}:
    {ul {- errors: ['a Js.t]
    {% <p>The validation message(s) to display.</p> %}
    }
    }
    *)
  method onDisable : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the disable operation.
After calling the superclass’s onDisable, the Component will be disabled.</p> %}
    *)
  method onEnable : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the enable operation.
After calling the superclass’s onEnable, the Component will be enabled.</p> %}
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>private</p>

<p>Template method called when this Component's DOM structure is created.</p>

<p>At this point, this Component's (and all descendants') DOM structure <em>exists</em> but it has not
been layed out (positioned and sized).</p>

<p>Subclasses which override this to gain access to the structure at render time should
call the parent class's method before attempting to access any child elements of the Component.</p> %}
    
    {b Parameters}:
    {ul {- parentNode: [Ext_dom_Element.t Js.t]
    {% <p>The parent Element in which this Component's encapsulating element is contained.</p> %}
    }
    {- containerIdx: [Js.number Js.t]
    {% <p>The index within the parent Container's child collection of this Component.</p> %}
    }
    }
    *)
  method processRawValue : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Performs any necessary manipulation of a raw field value to prepare it for <a href="#!/api/Ext.form.field.Base-method-rawToValue" rel="Ext.form.field.Base-method-rawToValue" class="docClass">conversion</a> and/or
<a href="#!/api/Ext.form.field.Base-method-validate" rel="Ext.form.field.Base-method-validate" class="docClass">validation</a>, for instance stripping out ignored characters. In the base implementation it does
nothing; individual subclasses may override this as needed.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The unprocessed string value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The processed string value</p> %}
    }
    }
    *)
  method rawToValue : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Converts a raw input field value into a mixed-type value that is suitable for this particular field type. This
allows controlling the normalization and conversion of user-entered values into field-type-appropriate values,
e.g. a Date object for <a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Ext.form.field.Date</a>, and is invoked by <a href="#!/api/Ext.form.field.Base-method-getValue" rel="Ext.form.field.Base-method-getValue" class="docClass">getValue</a>.</p>

<p>It is up to individual implementations to decide how to handle raw values that cannot be successfully converted
to the desired object type.</p>

<p>See <a href="#!/api/Ext.form.field.Base-method-valueToRaw" rel="Ext.form.field.Base-method-valueToRaw" class="docClass">valueToRaw</a> for the opposite conversion.</p>

<p>The base implementation does no conversion, returning the raw value untouched.</p> %}
    
    {b Parameters}:
    {ul {- rawValue: ['a Js.t]
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The converted value.</p> %}
    }
    }
    *)
  method setFieldStyle : 'a Js.t -> unit Js.meth
  (** {% <p>Set the <a href="#!/api/Ext.form.field.Base-cfg-fieldStyle" rel="Ext.form.field.Base-cfg-fieldStyle" class="docClass">CSS style</a> of the <a href="#!/api/Ext.form.field.Base-property-inputEl" rel="Ext.form.field.Base-property-inputEl" class="docClass">field input element</a>.</p> %}
    
    {b Parameters}:
    {ul {- style: ['a Js.t]
    {% <p>The style(s) to apply. Should be a valid argument to <a href="#!/api/Ext.dom.Element-method-applyStyles" rel="Ext.dom.Element-method-applyStyles" class="docClass">Ext.Element.applyStyles</a>.</p> %}
    }
    }
    *)
  method setRawValue : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Sets the field's raw value directly, bypassing <a href="#!/api/Ext.form.field.Base-method-valueToRaw" rel="Ext.form.field.Base-method-valueToRaw" class="docClass">value conversion</a>, change detection, and
validation. To set the value with these additional inspections see <a href="#!/api/Ext.form.field.Base-method-setValue" rel="Ext.form.field.Base-method-setValue" class="docClass">setValue</a>.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to set</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>value The field value that is set</p> %}
    }
    }
    *)
  method setReadOnly : bool Js.t -> unit Js.meth
  (** {% <p>Sets the read only state of this field.</p> %}
    
    {b Parameters}:
    {ul {- readOnly: [bool Js.t]
    {% <p>Whether the field should be read only.</p> %}
    }
    }
    *)
  method setValue : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets a data value into the field and runs the change detection and validation. To set the value directly
without these inspections see <a href="#!/api/Ext.form.field.Base-method-setRawValue" rel="Ext.form.field.Base-method-setRawValue" class="docClass">setRawValue</a>.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to set</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_form_field_Field.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method transformRawValue : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Transform the raw value before it is set</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The value to set</p> %}
    }
    }
    *)
  method validateValue : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Uses <a href="#!/api/Ext.form.field.Base-method-getErrors" rel="Ext.form.field.Base-method-getErrors" class="docClass">getErrors</a> to build an array of validation errors. If any errors are found, they are passed to
<a href="#!/api/Ext.form.field.Base-method-markInvalid" rel="Ext.form.field.Base-method-markInvalid" class="docClass">markInvalid</a> and false is returned, otherwise true is returned.</p>

<p>Previously, subclasses were invited to provide an implementation of this to process validations - from 3.2
onwards <a href="#!/api/Ext.form.field.Base-method-getErrors" rel="Ext.form.field.Base-method-getErrors" class="docClass">getErrors</a> should be overridden instead.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to validate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if all validations passed, false if one or more failed</p> %}
    }
    }
    *)
  method valueToRaw : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Converts a mixed-type value to a raw representation suitable for displaying in the field. This allows controlling
how value objects passed to <a href="#!/api/Ext.form.field.Base-method-setValue" rel="Ext.form.field.Base-method-setValue" class="docClass">setValue</a> are shown to the user, including localization. For instance, for a
<a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Ext.form.field.Date</a>, this would control how a Date object passed to <a href="#!/api/Ext.form.field.Base-method-setValue" rel="Ext.form.field.Base-method-setValue" class="docClass">setValue</a> would be converted
to a String for display in the field.</p>

<p>See <a href="#!/api/Ext.form.field.Base-method-rawToValue" rel="Ext.form.field.Base-method-rawToValue" class="docClass">rawToValue</a> for the opposite conversion.</p>

<p>The base implementation simply does a standard toString conversion, and converts <a href="#!/api/Ext-method-isEmpty" rel="Ext-method-isEmpty" class="docClass">empty values</a>
to an empty string.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The mixed-type value to convert to the raw representation.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The converted raw value.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_form_Labelable.configs
  inherit Ext_form_field_Field.configs
  
  method getSubTplData : ('self Js.t, unit -> 'a Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.getSubTplData] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDisable] *)
  method onEnable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onEnable] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this components's element. This will also be prepended to elements within this
component like Panel's body will get a class x-panel-body. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the baseCls x-panel and use
componentCls to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'field']
    *)
  method checkChangeBuffer : Js.number Js.t Js.prop
  (** {% <p>Defines a timeout in milliseconds for buffering <a href="#!/api/Ext.form.field.Base-cfg-checkChangeEvents" rel="Ext.form.field.Base-cfg-checkChangeEvents" class="docClass">checkChangeEvents</a> that fire in rapid succession.
Defaults to 50 milliseconds.</p> %}
    
    Defaults to: [50]
    *)
  method checkChangeEvents : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>A list of event names that will be listened for on the field's <a href="#!/api/Ext.form.field.Base-property-inputEl" rel="Ext.form.field.Base-property-inputEl" class="docClass">input element</a>, which will cause
the field's value to be checked for changes. If a change is detected, the <a href="#!/api/Ext.form.field.Base-event-change" rel="Ext.form.field.Base-event-change" class="docClass">change event</a> will be
fired, followed by validation if the <a href="#!/api/Ext.form.field.Base-cfg-validateOnChange" rel="Ext.form.field.Base-cfg-validateOnChange" class="docClass">validateOnChange</a> option is enabled.</p>

<p>Defaults to ['change', 'propertychange'] in Internet Explorer, and ['change', 'input', 'textInput', 'keyup',
'dragdrop'] in other browsers. This catches all the ways that field values can be changed in most supported
browsers; the only known exceptions at the time of writing are:</p>

<ul>
<li>Safari 3.2 and older: cut/paste in textareas via the context menu, and dragging text into textareas</li>
<li>Opera 10 and 11: dragging text into text fields and textareas, and cut via the context menu in text fields
and textareas</li>
<li>Opera 9: Same as Opera 10 and 11, plus paste from context menu in text fields and textareas</li>
</ul>


<p>If you need to guarantee on-the-fly change notifications including these edge cases, you can call the
<a href="#!/api/Ext.form.field.Base-method-checkChange" rel="Ext.form.field.Base-method-checkChange" class="docClass">checkChange</a> method on a repeating interval, e.g. using <a href="#!/api/Ext.TaskManager" rel="Ext.TaskManager" class="docClass">Ext.TaskManager</a>, or if the field is within
a <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>, you can use the FormPanel's <a href="#!/api/Ext.form.Panel-cfg-pollForChanges" rel="Ext.form.Panel-cfg-pollForChanges" class="docClass">Ext.form.Panel.pollForChanges</a> configuration to set up
such a task automatically.</p> %}
    *)
  method componentLayout_str : Js.js_string Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.form.field.Base-method-setSize" rel="Ext.form.field.Base-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['field']
    *)
  method dirtyCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to use when the field value <a href="#!/api/Ext.form.field.Base-method-isDirty" rel="Ext.form.field.Base-method-isDirty" class="docClass">is dirty</a>.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-dirty']
    *)
  method fieldCls : Js.js_string Js.t Js.prop
  (** {% <p>The default CSS class for the field input</p> %}
    
    Defaults to: ['x-form-field']
    *)
  method fieldStyle : Js.js_string Js.t Js.prop
  (** {% <p>Optional CSS style(s) to be applied to the <a href="#!/api/Ext.form.field.Base-property-inputEl" rel="Ext.form.field.Base-property-inputEl" class="docClass">field input element</a>. Should be a valid argument to
<a href="#!/api/Ext.dom.Element-method-applyStyles" rel="Ext.dom.Element-method-applyStyles" class="docClass">Ext.Element.applyStyles</a>. Defaults to undefined. See also the <a href="#!/api/Ext.form.field.Base-method-setFieldStyle" rel="Ext.form.field.Base-method-setFieldStyle" class="docClass">setFieldStyle</a> method for changing
the style after initialization.</p> %}
    *)
  method focusCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to use when the field receives focus</p> %}
    
    Defaults to: ['x-form-focus']
    *)
  method inputAttrTpl : 'a Js.t Js.prop
  (** {% <p>An optional string or <code>XTemplate</code> configuration to insert in the field markup
inside the input element (as attributes). If an <code>XTemplate</code> is used, the component's
<a href="#!/api/Ext.form.field.Base-method-getSubTplData" rel="Ext.form.field.Base-method-getSubTplData" class="docClass">subTpl data</a> serves as the context.</p> %}
    *)
  method inputId : Js.js_string Js.t Js.prop
  (** {% <p>The id that will be given to the generated input DOM element. Defaults to an automatically generated id. If you
configure this manually, you must make sure it is unique in the document.</p> %}
    *)
  method inputType : Js.js_string Js.t Js.prop
  (** {% <p>The type attribute for input fields -- e.g. radio, text, password, file. The extended types
supported by HTML5 inputs (url, email, etc.) may also be used, though using them will cause older browsers to
fall back to 'text'.</p>

<p>The type 'password' must be used to render that field type currently -- there is no separate Ext component for
that. You can use <a href="#!/api/Ext.form.field.File" rel="Ext.form.field.File" class="docClass">Ext.form.field.File</a> which creates a custom-rendered file upload field, but if you want
a plain unstyled file input you can use a Base with inputType:'file'.</p> %}
    
    Defaults to: ['text']
    *)
  method invalidText : Js.js_string Js.t Js.prop
  (** {% <p>The error text to use when marking a field invalid and no message is provided</p> %}
    
    Defaults to: ['The value in this field is invalid']
    *)
  method name : Js.js_string Js.t Js.prop
  (** {% <p>The name of the field. This is used as the parameter name when including the field value
in a <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">form submit()</a>. If no name is configured, it falls back to the <a href="#!/api/Ext.form.field.Base-cfg-inputId" rel="Ext.form.field.Base-cfg-inputId" class="docClass">inputId</a>.
To prevent the field from being included in the form submit, set <a href="#!/api/Ext.form.field.Base-cfg-submitValue" rel="Ext.form.field.Base-cfg-submitValue" class="docClass">submitValue</a> to false.</p> %}
    *)
  method readOnly : bool Js.t Js.prop
  (** {% <p>true to mark the field as readOnly in HTML.</p>

<p><strong>Note</strong>: this only sets the element's readOnly DOM attribute. Setting <code>readOnly=true</code>, for example, will not
disable triggering a ComboBox or Date; it gives you the option of forcing the user to choose via the trigger
without typing in the text box. To hide the trigger use <code><a href="#!/api/Ext.form.field.Trigger-cfg-hideTrigger" rel="Ext.form.field.Trigger-cfg-hideTrigger" class="docClass">hideTrigger</a></code>.</p> %}
    
    Defaults to: [false]
    *)
  method readOnlyCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class applied to the component's main element when it is <a href="#!/api/Ext.form.field.Base-cfg-readOnly" rel="Ext.form.field.Base-cfg-readOnly" class="docClass">readOnly</a>.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'form-readonly']
    *)
  method tabIndex : Js.number Js.t Js.prop
  (** {% <p>The tabIndex for this field. Note this only applies to fields that are rendered, not those which are built via
applyTo</p> %}
    *)
  method validateOnBlur : bool Js.t Js.prop
  (** {% <p>Whether the field should validate when it loses focus. This will cause fields to be validated
as the user steps through the fields in the form regardless of whether they are making changes to those fields
along the way. See also <a href="#!/api/Ext.form.field.Base-cfg-validateOnChange" rel="Ext.form.field.Base-cfg-validateOnChange" class="docClass">validateOnChange</a>.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_form_Labelable.events
  inherit Ext_form_field_Field.events
  
  method specialkey : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when any key related to navigation (arrows, tab, enter, esc, etc.) is pressed. To handle other keys
see <a href="#!/api/Ext.util.KeyMap" rel="Ext.util.KeyMap" class="docClass">Ext.util.KeyMap</a>. You can check <a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">Ext.EventObject.getKey</a> to determine which key was
pressed. For example:</p>

<pre><code>var form = new <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>({
    ...
    items: [{
            fieldLabel: 'Field 1',
            name: 'field1',
            allowBlank: false
        },{
            fieldLabel: 'Field 2',
            name: 'field2',
            listeners: {
                specialkey: function(field, e){
                    // e.HOME, e.END, e.PAGE_UP, e.PAGE_DOWN,
                    // e.TAB, e.ESC, arrow keys: e.LEFT, e.RIGHT, e.UP, e.DOWN
                    if (e.<a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">getKey()</a> == e.ENTER) {
                        var form = field.up('form').getForm();
                        form.submit();
                    }
                }
            }
        }
    ],
    ...
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_form_field_Base.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method writeablechange : (t Js.t -> bool Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when this field changes its read-only status.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_form_field_Base.t Js.t]
    }
    {- read: [bool Js.t] {% <p>only flag</p> %}
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
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_form_Labelable.statics
  inherit Ext_form_field_Field.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

