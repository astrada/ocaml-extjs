(** A basic text field.  Can be used as a direct repla ...
  
  {% <p>A basic text field.  Can be used as a direct replacement for traditional text inputs,
or as the base class for more sophisticated input controls (like <a href="#!/api/Ext.form.field.TextArea" rel="Ext.form.field.TextArea" class="docClass">Ext.form.field.TextArea</a>
and <a href="#!/api/Ext.form.field.ComboBox" rel="Ext.form.field.ComboBox" class="docClass">Ext.form.field.ComboBox</a>). Has support for empty-field placeholder values (see <a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a>).</p>

<h1>Validation</h1>

<p>The Text field has a useful set of validations built in:</p>

<ul>
<li><a href="#!/api/Ext.form.field.Text-cfg-allowBlank" rel="Ext.form.field.Text-cfg-allowBlank" class="docClass">allowBlank</a> for making the field required</li>
<li><a href="#!/api/Ext.form.field.Text-cfg-minLength" rel="Ext.form.field.Text-cfg-minLength" class="docClass">minLength</a> for requiring a minimum value length</li>
<li><a href="#!/api/Ext.form.field.Text-cfg-maxLength" rel="Ext.form.field.Text-cfg-maxLength" class="docClass">maxLength</a> for setting a maximum value length (with <a href="#!/api/Ext.form.field.Text-cfg-enforceMaxLength" rel="Ext.form.field.Text-cfg-enforceMaxLength" class="docClass">enforceMaxLength</a> to add it
as the <code>maxlength</code> attribute on the input element)</li>
<li><a href="#!/api/Ext.form.field.Text-cfg-regex" rel="Ext.form.field.Text-cfg-regex" class="docClass">regex</a> to specify a custom regular expression for validation</li>
</ul>


<p>In addition, custom validations may be added:</p>

<ul>
<li><a href="#!/api/Ext.form.field.Text-cfg-vtype" rel="Ext.form.field.Text-cfg-vtype" class="docClass">vtype</a> specifies a virtual type implementation from <a href="#!/api/Ext.form.field.VTypes" rel="Ext.form.field.VTypes" class="docClass">Ext.form.field.VTypes</a> which can contain
custom validation logic</li>
<li><a href="#!/api/Ext.form.field.Text-cfg-validator" rel="Ext.form.field.Text-cfg-validator" class="docClass">validator</a> allows a custom arbitrary function to be called during validation</li>
</ul>


<p>The details around how and when each of these validation options get used are described in the
documentation for <a href="#!/api/Ext.form.field.Text-method-getErrors" rel="Ext.form.field.Text-method-getErrors" class="docClass">getErrors</a>.</p>

<p>By default, the field value is checked for validity immediately while the user is typing in the
field. This can be controlled with the <a href="#!/api/Ext.form.field.Text-cfg-validateOnChange" rel="Ext.form.field.Text-cfg-validateOnChange" class="docClass">validateOnChange</a>, <a href="#!/api/Ext.form.field.Text-cfg-checkChangeEvents" rel="Ext.form.field.Text-cfg-checkChangeEvents" class="docClass">checkChangeEvents</a>, and
<a href="#!/api/Ext.form.field.Text-cfg-checkChangeBuffer" rel="Ext.form.field.Text-cfg-checkChangeBuffer" class="docClass">checkChangeBuffer</a> configurations. Also see the details on Form Validation in the
<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a> class documentation.</p>

<h1>Masking and Character Stripping</h1>

<p>Text fields can be configured with custom regular expressions to be applied to entered values before
validation: see <a href="#!/api/Ext.form.field.Text-cfg-maskRe" rel="Ext.form.field.Text-cfg-maskRe" class="docClass">maskRe</a> and <a href="#!/api/Ext.form.field.Text-cfg-stripCharsRe" rel="Ext.form.field.Text-cfg-stripCharsRe" class="docClass">stripCharsRe</a> for details.</p>

<h1>Example usage</h1>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>', {
    title: 'Contact Info',
    width: 300,
    bodyPadding: 10,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    items: [{
        xtype: 'textfield',
        name: 'name',
        fieldLabel: 'Name',
        allowBlank: false  // requires a non-empty value
    }, {
        xtype: 'textfield',
        name: 'email',
        fieldLabel: 'Email Address',
        vtype: 'email'  // requires value to be a valid email address format
    }]
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_form_field_Base.t
  
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Called by the layout system after the Component has been layed out.</p> %}
    
    {b Parameters}:
    {ul {- width: [Js.number Js.t]
    {% <p>The width that was set</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The height that was set</p> %}
    }
    {- oldWidth: [Js.number Js.t]
    {% <p>The old width. <code>undefined</code> if this was the initial layout.</p> %}
    }
    {- oldHeight: [Js.number Js.t]
    {% <p>The old height. <code>undefined</code> if this was the initial layout.</p> %}
    }
    }
    *)
  method afterRender : unit Js.meth
  (** {% <p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method applyState : 'a Js.t -> unit Js.meth
  (** {% <p>Applies the state to the object. This should be overridden in subclasses to do
more complex state operations. By default it applies the state properties onto
the current object.</p> %}
    
    {b Parameters}:
    {ul {- state: ['a Js.t] {% <p>The state</p> %}
    }
    }
    *)
  method autoSize : unit Js.meth
  (** {% <p>Automatically grows the field to accomodate the width of the text up to the maximum field width allowed. This
only takes effect if <a href="#!/api/Ext.form.field.Text-cfg-grow" rel="Ext.form.field.Text-cfg-grow" class="docClass">grow</a> = true, and fires the <a href="#!/api/Ext.form.field.Text-event-autosize" rel="Ext.form.field.Text-event-autosize" class="docClass">autosize</a> event if the width changes.</p> %}
    *)
  method getErrors : 'a Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  (** {% <p>Validates a value according to the field's validation rules and returns an array of errors
for any failing validations. Validation rules are processed in the following order:</p>

<ol>
<li><p><strong>Field specific validator</strong></p>

<p> A validator offers a way to customize and reuse a validation specification.
 If a field is configured with a <code><a href="#!/api/Ext.form.field.Text-cfg-validator" rel="Ext.form.field.Text-cfg-validator" class="docClass">validator</a></code>
 function, it will be passed the current field value.  The <code><a href="#!/api/Ext.form.field.Text-cfg-validator" rel="Ext.form.field.Text-cfg-validator" class="docClass">validator</a></code>
 function is expected to return either:</p>

<ul>
<li>Boolean <code>true</code>  if the value is valid (validation continues).</li>
<li>a String to represent the invalid message if invalid (validation halts).</li>
</ul>
</li>
<li><p><strong>Basic Validation</strong></p>

<p> If the <code><a href="#!/api/Ext.form.field.Text-cfg-validator" rel="Ext.form.field.Text-cfg-validator" class="docClass">validator</a></code> has not halted validation,
 basic validation proceeds as follows:</p>

<ul>
<li><p><code><a href="#!/api/Ext.form.field.Text-cfg-allowBlank" rel="Ext.form.field.Text-cfg-allowBlank" class="docClass">allowBlank</a></code> : (Invalid message = <code><a href="#!/api/Ext.form.field.Text-cfg-blankText" rel="Ext.form.field.Text-cfg-blankText" class="docClass">blankText</a></code>)</p>

<p>  Depending on the configuration of <code><a href="#!/api/Ext.form.field.Text-cfg-allowBlank" rel="Ext.form.field.Text-cfg-allowBlank" class="docClass">allowBlank</a></code>, a
  blank field will cause validation to halt at this step and return
  Boolean true or false accordingly.</p></li>
<li><p><code><a href="#!/api/Ext.form.field.Text-cfg-minLength" rel="Ext.form.field.Text-cfg-minLength" class="docClass">minLength</a></code> : (Invalid message = <code><a href="#!/api/Ext.form.field.Text-cfg-minLengthText" rel="Ext.form.field.Text-cfg-minLengthText" class="docClass">minLengthText</a></code>)</p>

<p>  If the passed value does not satisfy the <code><a href="#!/api/Ext.form.field.Text-cfg-minLength" rel="Ext.form.field.Text-cfg-minLength" class="docClass">minLength</a></code>
  specified, validation halts.</p></li>
<li><p><code><a href="#!/api/Ext.form.field.Text-cfg-maxLength" rel="Ext.form.field.Text-cfg-maxLength" class="docClass">maxLength</a></code> : (Invalid message = <code><a href="#!/api/Ext.form.field.Text-cfg-maxLengthText" rel="Ext.form.field.Text-cfg-maxLengthText" class="docClass">maxLengthText</a></code>)</p>

<p> If the passed value does not satisfy the <code><a href="#!/api/Ext.form.field.Text-cfg-maxLength" rel="Ext.form.field.Text-cfg-maxLength" class="docClass">maxLength</a></code>
 specified, validation halts.</p></li>
</ul>
</li>
<li><p><strong>Preconfigured Validation Types (VTypes)</strong></p>

<p> If none of the prior validation steps halts validation, a field
 configured with a <code><a href="#!/api/Ext.form.field.Text-cfg-vtype" rel="Ext.form.field.Text-cfg-vtype" class="docClass">vtype</a></code> will utilize the
 corresponding <a href="#!/api/Ext.form.field.VTypes" rel="Ext.form.field.VTypes" class="docClass">VTypes</a> validation function.
 If invalid, either the field's <code><a href="#!/api/Ext.form.field.Text-cfg-vtypeText" rel="Ext.form.field.Text-cfg-vtypeText" class="docClass">vtypeText</a></code> or
 the VTypes vtype Text property will be used for the invalid message.
 Keystrokes on the field will be filtered according to the VTypes
 vtype Mask property.</p></li>
<li><p><strong>Field specific regex test</strong></p>

<p> If none of the prior validation steps halts validation, a field's
 configured <code><a href="#!/api/Ext.form.field.Text-cfg-regex" rel="Ext.form.field.Text-cfg-regex" class="docClass">regex</a></code> test will be processed.
 The invalid message for this test is configured with <code><a href="#!/api/Ext.form.field.Text-cfg-regexText" rel="Ext.form.field.Text-cfg-regexText" class="docClass">regexText</a></code></p></li>
</ol> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to validate. The processed raw value will be used if nothing is passed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t Js.js_array Js.t]
    {% <p>Array of any validation errors</p> %}
    }
    }
    *)
  method getRawValue : Js.js_string Js.t Js.meth
  (** {% <p>Returns the raw String value of the field, without performing any normalization, conversion, or validation. Gets
the current value of the input element if the field has been rendered, ignoring the value if it is the
<a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a>. To get a normalized and converted value see <a href="#!/api/Ext.form.field.Text-method-getValue" rel="Ext.form.field.Text-method-getValue" class="docClass">getValue</a>.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The raw String value of the field</p> %}
    }
    }
    *)
  method getState : 'a Js.t Js.meth
  (** {% <p>The supplied default state gathering method for the AbstractComponent class.</p>

<p>This method returns dimension settings such as <code>flex</code>, <code>anchor</code>, <code>width</code> and <code>height</code> along with <code>collapsed</code>
state.</p>

<p>Subclasses which implement more complex state should call the superclass's implementation, and apply their state
to the result if this basic state is to be saved.</p>

<p>Note that Component state will only be saved if the Component has a <a href="#!/api/Ext.form.field.Text-cfg-stateId" rel="Ext.form.field.Text-cfg-stateId" class="docClass">stateId</a> and there as a StateProvider
configured for the document.</p> %}
    *)
  method getSubTplData : 'a Js.t Js.meth
  (** {% <p>Creates and returns the data object to be used when rendering the <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">fieldSubTpl</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The template data</p> %}
    }
    }
    *)
  method initComponent : unit Js.meth
  (** {% <p>The initComponent template method is an important initialization step for a Component. It is intended to be
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
  method processRawValue_str : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Performs any necessary manipulation of a raw String value to prepare it for conversion and/or
<a href="#!/api/Ext.form.field.Text-method-validate" rel="Ext.form.field.Text-method-validate" class="docClass">validation</a>. For text fields this applies the configured <a href="#!/api/Ext.form.field.Text-cfg-stripCharsRe" rel="Ext.form.field.Text-cfg-stripCharsRe" class="docClass">stripCharsRe</a>
to the raw value.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The unprocessed string value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The processed string value</p> %}
    }
    }
    *)
  method reset : unit Js.meth
  (** {% <p>Resets the current field value to the originally-loaded value and clears any validation messages.
Also adds <strong><a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a></strong> and <strong><a href="#!/api/Ext.form.field.Text-cfg-emptyCls" rel="Ext.form.field.Text-cfg-emptyCls" class="docClass">emptyCls</a></strong> if the original value was blank.</p> %}
    *)
  method selectText : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Selects text in this field</p> %}
    
    {b Parameters}:
    {ul {- start: [Js.number Js.t]
    {% <p>The index where the selection should start</p> %}
     Defaults to: 0
    }
    {- _end: [Js.number Js.t]
    {% <p>The index where the selection should end (defaults to the text length)</p> %}
    }
    }
    *)
  method setValue : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets a data value into the field and runs the change detection and validation. Also applies any configured
<a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a> for text fields. To set the value directly without these inspections see <a href="#!/api/Ext.form.field.Text-method-setRawValue" rel="Ext.form.field.Text-method-setRawValue" class="docClass">setRawValue</a>.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to set</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_field_Text.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_form_field_Base.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterComponentLayout] *)
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
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
  method allowBlank : bool Js.t Js.prop
  (** {% <p>Specify false to validate that the value's length is > 0</p> %}
    
    Defaults to: [true]
    *)
  method blankText : Js.js_string Js.t Js.prop
  (** {% <p>The error text to display if the <strong><a href="#!/api/Ext.form.field.Text-cfg-allowBlank" rel="Ext.form.field.Text-cfg-allowBlank" class="docClass">allowBlank</a></strong> validation fails</p> %}
    
    Defaults to: ['This field is required']
    *)
  method disableKeyFilter : bool Js.t Js.prop
  (** {% <p>Specify true to disable input keystroke filtering</p> %}
    
    Defaults to: [false]
    *)
  method emptyCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to an empty field to style the <strong><a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a></strong>.
This class is automatically added and removed as needed depending on the current field value.</p> %}
    
    Defaults to: ['x-form-empty-field']
    *)
  method emptyText : Js.js_string Js.t Js.prop
  (** {% <p>The default text to place into an empty field.</p>

<p>Note that normally this value will be submitted to the server if this field is enabled; to prevent this you can
set the <a href="#!/api/Ext.form.action.Action-cfg-submitEmptyText" rel="Ext.form.action.Action-cfg-submitEmptyText" class="docClass">submitEmptyText</a> option of <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">Ext.form.Basic.submit</a> to
false.</p>

<p>Also note that if you use <a href="#!/api/Ext.form.field.Text-cfg-inputType" rel="Ext.form.field.Text-cfg-inputType" class="docClass">inputType</a>:'file', <a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a> is not supported and should be
avoided.</p>

<p>Note that for browsers that support it, setting this property will use the HTML 5 placeholder attribute, and for
older browsers that don't support the HTML 5 placeholder attribute the value will be placed directly into the input
element itself as the raw value. This means that older browsers will obfuscate the <a href="#!/api/Ext.form.field.Text-cfg-emptyText" rel="Ext.form.field.Text-cfg-emptyText" class="docClass">emptyText</a> value for
password input fields.</p> %}
    *)
  method enableKeyEvents : bool Js.t Js.prop
  (** {% <p>true to enable the proxying of key events for the HTML input field</p> %}
    
    Defaults to: [false]
    *)
  method enforceMaxLength : bool Js.t Js.prop
  (** {% <p>True to set the maxLength property on the underlying input field. Defaults to false</p> %}
    *)
  method grow : bool Js.t Js.prop
  (** {% <p>true if this field should automatically grow and shrink to its content</p> %}
    
    Defaults to: [false]
    *)
  method growAppend : Js.js_string Js.t Js.prop
  (** {% <p>A string that will be appended to the field's current value for the purposes of calculating the target field
size. Only used when the <a href="#!/api/Ext.form.field.Text-cfg-grow" rel="Ext.form.field.Text-cfg-grow" class="docClass">grow</a> config is true. Defaults to a single capital "W" (the widest character in
common fonts) to leave enough space for the next typed character and avoid the field value shifting before the
width is adjusted.</p> %}
    
    Defaults to: ['W']
    *)
  method growMax : Js.number Js.t Js.prop
  (** {% <p>The maximum width to allow when <code><a href="#!/api/Ext.form.field.Text-cfg-grow" rel="Ext.form.field.Text-cfg-grow" class="docClass">grow</a> = true</code></p> %}
    
    Defaults to: [800]
    *)
  method growMin : Js.number Js.t Js.prop
  (** {% <p>The minimum width to allow when <code><a href="#!/api/Ext.form.field.Text-cfg-grow" rel="Ext.form.field.Text-cfg-grow" class="docClass">grow</a> = true</code></p> %}
    
    Defaults to: [30]
    *)
  method maskRe : Regexp.regexp Js.t Js.prop
  (** {% <p>An input mask regular expression that will be used to filter keystrokes (character being
typed) that do not match.
Note: It does not filter characters already in the input.</p> %}
    *)
  method maxLength : Js.number Js.t Js.prop
  (** {% <p>Maximum input field length allowed by validation. This behavior is intended to
provide instant feedback to the user by improving usability to allow pasting and editing or overtyping and back
tracking. To restrict the maximum number of characters that can be entered into the field use the
<strong><a href="#!/api/Ext.form.field.Text-cfg-enforceMaxLength" rel="Ext.form.field.Text-cfg-enforceMaxLength" class="docClass">enforceMaxLength</a></strong> option.</p>

<p>Defaults to Number.MAX_VALUE.</p> %}
    *)
  method maxLengthText : Js.js_string Js.t Js.prop
  (** {% <p>Error text to display if the <strong><a href="#!/api/Ext.form.field.Text-cfg-maxLength" rel="Ext.form.field.Text-cfg-maxLength" class="docClass">maximum length</a></strong> validation fails</p> %}
    
    Defaults to: ['The maximum length for this field is {0}']
    *)
  method minLength : Js.number Js.t Js.prop
  (** {% <p>Minimum input field length required</p> %}
    
    Defaults to: [0]
    *)
  method minLengthText : Js.js_string Js.t Js.prop
  (** {% <p>Error text to display if the <strong><a href="#!/api/Ext.form.field.Text-cfg-minLength" rel="Ext.form.field.Text-cfg-minLength" class="docClass">minimum length</a></strong> validation fails.</p> %}
    *)
  method regex : Regexp.regexp Js.t Js.prop
  (** {% <p>A JavaScript RegExp object to be tested against the field value during validation.
If the test fails, the field will be marked invalid using
either <strong><a href="#!/api/Ext.form.field.Text-cfg-regexText" rel="Ext.form.field.Text-cfg-regexText" class="docClass">regexText</a></strong> or <strong><a href="#!/api/Ext.form.field.Text-cfg-invalidText" rel="Ext.form.field.Text-cfg-invalidText" class="docClass">invalidText</a></strong>.</p> %}
    *)
  method regexText : Js.js_string Js.t Js.prop
  (** {% <p>The error text to display if <strong><a href="#!/api/Ext.form.field.Text-cfg-regex" rel="Ext.form.field.Text-cfg-regex" class="docClass">regex</a></strong> is used and the test fails during validation</p> %}
    
    Defaults to: ['']
    *)
  method requiredCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to a required field, i.e. a field where <strong><a href="#!/api/Ext.form.field.Text-cfg-allowBlank" rel="Ext.form.field.Text-cfg-allowBlank" class="docClass">allowBlank</a></strong> is false.</p> %}
    
    Defaults to: ['x-form-required-field']
    *)
  method selectOnFocus : bool Js.t Js.prop
  (** {% <p>true to automatically select any existing field text when the field receives input focus</p> %}
    
    Defaults to: [false]
    *)
  method size : Js.number Js.t Js.prop
  (** {% <p>An initial value for the 'size' attribute on the text input element. This is only used if the field has no
configured <a href="#!/api/Ext.form.field.Text-cfg-width" rel="Ext.form.field.Text-cfg-width" class="docClass">width</a> and is not given a width by its container's layout. Defaults to 20.</p> %}
    
    Defaults to: [20]
    *)
  method stripCharsRe : Regexp.regexp Js.t Js.prop
  (** {% <p>A JavaScript RegExp object used to strip unwanted content from the value
during input. If <code>stripCharsRe</code> is specified,
every <em>character sequence</em> matching <code>stripCharsRe</code> will be removed.</p> %}
    *)
  method validator : 'a Js.callback Js.prop
  (** {% <p>A custom validation function to be called during field validation (<a href="#!/api/Ext.form.field.Text-method-getErrors" rel="Ext.form.field.Text-method-getErrors" class="docClass">getErrors</a>).
If specified, this function will be called first, allowing the developer to override the default validation
process.</p>

<p>This function will be passed the following parameters:</p> %}
    *)
  method vtype : Js.js_string Js.t Js.prop
  (** {% <p>A validation type name as defined in <a href="#!/api/Ext.form.field.VTypes" rel="Ext.form.field.VTypes" class="docClass">Ext.form.field.VTypes</a></p> %}
    *)
  method vtypeText : Js.js_string Js.t Js.prop
  (** {% <p>A custom error message to display in place of the default message provided for the <strong><code><a href="#!/api/Ext.form.field.Text-cfg-vtype" rel="Ext.form.field.Text-cfg-vtype" class="docClass">vtype</a></code></strong> currently
set for this field. <strong>Note</strong>: only applies if <strong><code><a href="#!/api/Ext.form.field.Text-cfg-vtype" rel="Ext.form.field.Text-cfg-vtype" class="docClass">vtype</a></code></strong> is set, else ignored.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_form_field_Base.events
  
  method autosize : (t Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the <strong><a href="#!/api/Ext.form.field.Text-method-autoSize" rel="Ext.form.field.Text-method-autoSize" class="docClass">autoSize</a></strong> function is triggered and the field is resized according to the
<a href="#!/api/Ext.form.field.Text-cfg-grow" rel="Ext.form.field.Text-cfg-grow" class="docClass">grow</a>/<a href="#!/api/Ext.form.field.Text-cfg-growMin" rel="Ext.form.field.Text-cfg-growMin" class="docClass">growMin</a>/<a href="#!/api/Ext.form.field.Text-cfg-growMax" rel="Ext.form.field.Text-cfg-growMax" class="docClass">growMax</a> configs as a result. This event provides a hook for the
developer to apply additional logic at runtime to resize the field if needed.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Text.t Js.t]
    {% <p>This text field</p> %}
    }
    {- width: [Js.number Js.t]
    {% <p>The new field width</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keydown : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Keydown input field event. This event only fires if <strong><a href="#!/api/Ext.form.field.Text-cfg-enableKeyEvents" rel="Ext.form.field.Text-cfg-enableKeyEvents" class="docClass">enableKeyEvents</a></strong> is set to true.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Text.t Js.t]
    {% <p>This text field</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keypress : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Keypress input field event. This event only fires if <strong><a href="#!/api/Ext.form.field.Text-cfg-enableKeyEvents" rel="Ext.form.field.Text-cfg-enableKeyEvents" class="docClass">enableKeyEvents</a></strong> is set to true.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Text.t Js.t]
    {% <p>This text field</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method keyup : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Keyup input field event. This event only fires if <strong><a href="#!/api/Ext.form.field.Text-cfg-enableKeyEvents" rel="Ext.form.field.Text-cfg-enableKeyEvents" class="docClass">enableKeyEvents</a></strong> is set to true.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Text.t Js.t]
    {% <p>This text field</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
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
  inherit Ext_form_field_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

