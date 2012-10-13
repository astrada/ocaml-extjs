(** This mixin provides a common interface for the log ...
  
  {% <p>This mixin provides a common interface for the logical behavior and state of form fields, including:</p>

<ul>
<li>Getter and setter methods for field values</li>
<li>Events and methods for tracking value and validity changes</li>
<li>Methods for triggering validation</li>
</ul>


<p><strong>NOTE</strong>: When implementing custom fields, it is most likely that you will want to extend the <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>
component class rather than using this mixin directly, as BaseField contains additional logic for generating an
actual DOM complete with <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">label and error message</a> display and a form input field,
plus methods that bind the Field value getters and setters to the input field's value.</p>

<p>If you do want to implement this mixin directly and don't want to extend <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>, then
you will most likely want to override the following methods with custom implementations: <a href="#!/api/Ext.form.field.Field-method-getValue" rel="Ext.form.field.Field-method-getValue" class="docClass">getValue</a>,
<a href="#!/api/Ext.form.field.Field-method-setValue" rel="Ext.form.field.Field-method-setValue" class="docClass">setValue</a>, and <a href="#!/api/Ext.form.field.Field-method-getErrors" rel="Ext.form.field.Field-method-getErrors" class="docClass">getErrors</a>. Other methods may be overridden as needed but their base
implementations should be sufficient for common cases. You will also need to make sure that <a href="#!/api/Ext.form.field.Field-method-initField" rel="Ext.form.field.Field-method-initField" class="docClass">initField</a>
is called during the component's initialization.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method isFormField : bool Js.t Js.prop
  (** {% <p>Flag denoting that this component is a Field. Always true.</p> %}
    
    Defaults to: [true]
    *)
  method originalValue : 'a Js.t Js.prop
  (** {% <p>The original value of the field as configured in the <a href="#!/api/Ext.form.field.Field-cfg-value" rel="Ext.form.field.Field-cfg-value" class="docClass">value</a> configuration, or as loaded by the last
form load operation if the form's <a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a> setting is <code>true</code>.</p> %}
    *)
  method batchChanges : 'a Js.t -> unit Js.meth
  (** {% <p>A utility for grouping a set of modifications which may trigger value changes into a single transaction, to
prevent excessive firing of <a href="#!/api/Ext.form.field.Field-event-change" rel="Ext.form.field.Field-event-change" class="docClass">change</a> events. This is useful for instance if the field has sub-fields which
are being updated as a group; you don't want the container field to check its own changed state for each subfield
change.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.t]
    {% <p>A function containing the transaction code</p> %}
    }
    }
    *)
  method beforeReset : unit Js.meth
  (** {% <p>Template method before a field is reset.</p> %}
    *)
  method checkChange : unit Js.meth
  (** {% <p>Checks whether the value of the field has changed since the last time it was checked.
If the value has changed, it:</p>

<ol>
<li>Fires the <a href="#!/api/Ext.form.field.Field-event-change" rel="Ext.form.field.Field-event-change" class="docClass">change event</a>,</li>
<li>Performs validation if the <a href="#!/api/Ext.form.field.Field-cfg-validateOnChange" rel="Ext.form.field.Field-cfg-validateOnChange" class="docClass">validateOnChange</a> config is enabled, firing the
<a href="#!/api/Ext.form.field.Field-event-validitychange" rel="Ext.form.field.Field-event-validitychange" class="docClass">validitychange event</a> if the validity has changed, and</li>
<li>Checks the <a href="#!/api/Ext.form.field.Field-method-isDirty" rel="Ext.form.field.Field-method-isDirty" class="docClass">dirty state</a> of the field and fires the <a href="#!/api/Ext.form.field.Field-event-dirtychange" rel="Ext.form.field.Field-event-dirtychange" class="docClass">dirtychange event</a>
if it has changed.</li>
</ol> %}
    *)
  method checkDirty : unit Js.meth
  (** {% <p>Checks the <a href="#!/api/Ext.form.field.Field-method-isDirty" rel="Ext.form.field.Field-method-isDirty" class="docClass">isDirty</a> state of the field and if it has changed since the last time it was checked,
fires the <a href="#!/api/Ext.form.field.Field-event-dirtychange" rel="Ext.form.field.Field-event-dirtychange" class="docClass">dirtychange</a> event.</p> %}
    *)
  method clearInvalid : unit Js.meth
  (** {% <p>Clear any invalid styles/messages for this field. Components using this mixin should implement this method to
update the components rendering to clear any existing messages.</p>

<p><strong>Note</strong>: this method does not cause the Field's <a href="#!/api/Ext.form.field.Field-method-validate" rel="Ext.form.field.Field-method-validate" class="docClass">validate</a> or <a href="#!/api/Ext.form.field.Field-method-isValid" rel="Ext.form.field.Field-method-isValid" class="docClass">isValid</a> methods to return <code>true</code>
if the value does not <em>pass</em> validation. So simply clearing a field's errors will not necessarily allow
submission of forms submitted with the <a href="#!/api/Ext.form.action.Submit-cfg-clientValidation" rel="Ext.form.action.Submit-cfg-clientValidation" class="docClass">Ext.form.action.Submit.clientValidation</a> option set.</p> %}
    *)
  method extractFileInput : Dom_html.element Js.t Js.meth
  (** {% <p>Only relevant if the instance's <a href="#!/api/Ext.form.field.Field-method-isFileUpload" rel="Ext.form.field.Field-method-isFileUpload" class="docClass">isFileUpload</a> method returns true. Returns a reference to the file input
DOM element holding the user's selected file. The input will be appended into the submission form and will not be
returned, so this method should also create a replacement.</p> %}
    *)
  method getErrors : 'a Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  (** {% <p>Runs this field's validators and returns an array of error messages for any validation failures. This is called
internally during validation and would not usually need to be used manually.</p>

<p>Each subclass should override or augment the return value to provide their own errors.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to get errors for (defaults to the current field value)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t Js.js_array Js.t]
    {% <p>All error messages for this field; an empty Array if none.</p> %}
    }
    }
    *)
  method getModelData : 'a Js.t Js.meth
  (** {% <p>Returns the value(s) that should be saved to the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> instance for this field, when <a href="#!/api/Ext.form.Basic-method-updateRecord" rel="Ext.form.Basic-method-updateRecord" class="docClass">Ext.form.Basic.updateRecord</a> is called. Typically this will be an object with a single name-value pair, the name
being this field's <a href="#!/api/Ext.form.field.Field-method-getName" rel="Ext.form.field.Field-method-getName" class="docClass">name</a> and the value being its current data value. More advanced field
implementations may return more than one name-value pair. The returned values will be saved to the corresponding
field names in the Model.</p>

<p>Note that the values returned from this method are not guaranteed to have been successfully <a href="#!/api/Ext.form.field.Field-method-validate" rel="Ext.form.field.Field-method-validate" class="docClass">validated</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>A mapping of submit parameter names to values; each value should be a string, or an array of
strings if that particular name has multiple values. It can also return null if there are no parameters to be
submitted.</p> %}
    }
    }
    *)
  method getName : Js.js_string Js.t Js.meth
  (** {% <p>Returns the <a href="#!/api/Ext.form.field.Field-cfg-name" rel="Ext.form.field.Field-cfg-name" class="docClass">name</a> attribute of the field. This is used as the parameter name
when including the field value in a <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">form submit()</a>.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>name The field <a href="#!/api/Ext.form.field.Field-cfg-name" rel="Ext.form.field.Field-cfg-name" class="docClass">name</a></p> %}
    }
    }
    *)
  method getSubmitData : 'a Js.t Js.meth
  (** {% <p>Returns the parameter(s) that would be included in a standard form submit for this field. Typically this will be
an object with a single name-value pair, the name being this field's <a href="#!/api/Ext.form.field.Field-method-getName" rel="Ext.form.field.Field-method-getName" class="docClass">name</a> and the value being
its current stringified value. More advanced field implementations may return more than one name-value pair.</p>

<p>Note that the values returned from this method are not guaranteed to have been successfully <a href="#!/api/Ext.form.field.Field-method-validate" rel="Ext.form.field.Field-method-validate" class="docClass">validated</a>.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>A mapping of submit parameter names to values; each value should be a string, or an array of
strings if that particular name has multiple values. It can also return null if there are no parameters to be
submitted.</p> %}
    }
    }
    *)
  method getValue : 'a Js.t Js.meth
  (** {% <p>Returns the current data value of the field. The type of value returned is particular to the type of the
particular field (e.g. a Date object for <a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Ext.form.field.Date</a>).</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>value The field value</p> %}
    }
    }
    *)
  method initField : unit Js.meth
  (** {% <p>Initializes this Field mixin on the current instance. Components using this mixin should call this method during
their own initialization process.</p> %}
    *)
  method initValue : unit Js.meth
  (** {% <p>Initializes the field's value based on the initial config.</p> %}
    *)
  method isDirty : bool Js.t Js.meth
  (** {% <p>Returns true if the value of this Field has been changed from its <a href="#!/api/Ext.form.field.Field-property-originalValue" rel="Ext.form.field.Field-property-originalValue" class="docClass">originalValue</a>.
Will always return false if the field is disabled.</p>

<p>Note that if the owning <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">form</a> was configured with
<a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a> then the <a href="#!/api/Ext.form.field.Field-property-originalValue" rel="Ext.form.field.Field-property-originalValue" class="docClass">originalValue</a> is updated when
the values are loaded by <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a>.<a href="#!/api/Ext.form.Basic-method-setValues" rel="Ext.form.Basic-method-setValues" class="docClass">setValues</a>.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this field has been changed from its original value (and is not disabled),
false otherwise.</p> %}
    }
    }
    *)
  method isEqual : 'a Js.t -> 'b Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether two field <a href="#!/api/Ext.form.field.Field-method-getValue" rel="Ext.form.field.Field-method-getValue" class="docClass">values</a> are logically equal. Field implementations may override this
to provide custom comparison logic appropriate for the particular field's data type.</p> %}
    
    {b Parameters}:
    {ul {- value1: ['a Js.t]
    {% <p>The first value to compare</p> %}
    }
    {- value2: ['a Js.t]
    {% <p>The second value to compare</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the values are equal, false if inequal.</p> %}
    }
    }
    *)
  method isFileUpload : bool Js.t Js.meth
  (** {% <p>Returns whether this Field is a file upload field; if it returns true, forms will use special techniques for
<a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submitting the form</a> via AJAX. See <a href="#!/api/Ext.form.Basic-method-hasUpload" rel="Ext.form.Basic-method-hasUpload" class="docClass">Ext.form.Basic.hasUpload</a> for details. If
this returns true, the <a href="#!/api/Ext.form.field.Field-method-extractFileInput" rel="Ext.form.field.Field-method-extractFileInput" class="docClass">extractFileInput</a> method must also be implemented to return the corresponding file
input element.</p> %}
    *)
  method isValid : bool Js.t Js.meth
  (** {% <p>Returns whether or not the field value is currently valid by <a href="#!/api/Ext.form.field.Field-method-getErrors" rel="Ext.form.field.Field-method-getErrors" class="docClass">validating</a> the field's current
value. The <a href="#!/api/Ext.form.field.Field-event-validitychange" rel="Ext.form.field.Field-event-validitychange" class="docClass">validitychange</a> event will not be fired; use <a href="#!/api/Ext.form.field.Field-method-validate" rel="Ext.form.field.Field-method-validate" class="docClass">validate</a> instead if you want the event
to fire. <strong>Note</strong>: <a href="#!/api/Ext.form.field.Field-cfg-disabled" rel="Ext.form.field.Field-cfg-disabled" class="docClass">disabled</a> fields are always treated as valid.</p>

<p>Implementations are encouraged to ensure that this method does not have side-effects such as triggering error
message display.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the value is valid, else false</p> %}
    }
    }
    *)
  method markInvalid : 'a Js.t -> unit Js.meth
  (** {% <p>Associate one or more error messages with this field. Components using this mixin should implement this method to
update the component's rendering to display the messages.</p>

<p><strong>Note</strong>: this method does not cause the Field's <a href="#!/api/Ext.form.field.Field-method-validate" rel="Ext.form.field.Field-method-validate" class="docClass">validate</a> or <a href="#!/api/Ext.form.field.Field-method-isValid" rel="Ext.form.field.Field-method-isValid" class="docClass">isValid</a> methods to return <code>false</code>
if the value does <em>pass</em> validation. So simply marking a Field as invalid will not prevent submission of forms
submitted with the <a href="#!/api/Ext.form.action.Submit-cfg-clientValidation" rel="Ext.form.action.Submit-cfg-clientValidation" class="docClass">Ext.form.action.Submit.clientValidation</a> option set.</p> %}
    
    {b Parameters}:
    {ul {- errors: ['a Js.t]
    {% <p>The error message(s) for the field.</p> %}
    }
    }
    *)
  method reset : unit Js.meth
  (** {% <p>Resets the current field value to the originally loaded value and clears any validation messages. See <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a>.<a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a></p> %}
    *)
  method resetOriginalValue : unit Js.meth
  (** {% <p>Resets the field's <a href="#!/api/Ext.form.field.Field-property-originalValue" rel="Ext.form.field.Field-property-originalValue" class="docClass">originalValue</a> property so it matches the current <a href="#!/api/Ext.form.field.Field-method-getValue" rel="Ext.form.field.Field-method-getValue" class="docClass">value</a>. This is
called by <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a>.<a href="#!/api/Ext.form.Basic-method-setValues" rel="Ext.form.Basic-method-setValues" class="docClass">setValues</a> if the form's
<a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a> property is set to true.</p> %}
    *)
  method setValue : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets a data value into the field and runs the change detection and validation.</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The value to set</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_field_Field.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method transformOriginalValue : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Allows for any necessary modifications before the original
value is set</p> %}
    
    {b Parameters}:
    {ul {- value: ['a Js.t]
    {% <p>The initial value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The modified initial value</p> %}
    }
    }
    *)
  method validate : bool Js.t Js.meth
  (** {% <p>Returns whether or not the field value is currently valid by <a href="#!/api/Ext.form.field.Field-method-getErrors" rel="Ext.form.field.Field-method-getErrors" class="docClass">validating</a> the field's current
value, and fires the <a href="#!/api/Ext.form.field.Field-event-validitychange" rel="Ext.form.field.Field-event-validitychange" class="docClass">validitychange</a> event if the field's validity has changed since the last validation.
<strong>Note</strong>: <a href="#!/api/Ext.form.field.Field-cfg-disabled" rel="Ext.form.field.Field-cfg-disabled" class="docClass">disabled</a> fields are always treated as valid.</p>

<p>Custom implementations of this method are allowed to have side-effects such as triggering error message display.
To validate without side-effects, use <a href="#!/api/Ext.form.field.Field-method-isValid" rel="Ext.form.field.Field-method-isValid" class="docClass">isValid</a>.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the value is valid, else false</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method disabled : bool Js.t Js.prop
  (** {% <p>True to disable the field. Disabled Fields will not be <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submitted</a>.</p> %}
    
    Defaults to: [false]
    *)
  method name : Js.js_string Js.t Js.prop
  (** {% <p>The name of the field. By default this is used as the parameter name when including the
<a href="#!/api/Ext.form.field.Field-method-getSubmitData" rel="Ext.form.field.Field-method-getSubmitData" class="docClass">field value</a> in a <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">form submit()</a>. To prevent the field from
being included in the form submit, set <a href="#!/api/Ext.form.field.Field-cfg-submitValue" rel="Ext.form.field.Field-cfg-submitValue" class="docClass">submitValue</a> to false.</p> %}
    *)
  method submitValue : bool Js.t Js.prop
  (** {% <p>Setting this to false will prevent the field from being <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submitted</a> even when it is
not disabled.</p> %}
    
    Defaults to: [true]
    *)
  method validateOnChange : bool Js.t Js.prop
  (** {% <p>Specifies whether this field should be validated immediately whenever a change in its value is detected.
If the validation results in a change in the field's validity, a <a href="#!/api/Ext.form.field.Field-event-validitychange" rel="Ext.form.field.Field-event-validitychange" class="docClass">validitychange</a> event will be
fired. This allows the field to show feedback about the validity of its contents immediately as the user is
typing.</p>

<p>When set to false, feedback will not be immediate. However the form will still be validated before submitting if
the clientValidation option to <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">Ext.form.Basic.doAction</a> is enabled, or if the field or form are validated
manually.</p>

<p>See also <a href="#!/api/Ext.form.field.Base-cfg-checkChangeEvents" rel="Ext.form.field.Base-cfg-checkChangeEvents" class="docClass">Ext.form.field.Base.checkChangeEvents</a> for controlling how changes to the field's value are
detected.</p> %}
    
    Defaults to: [true]
    *)
  method value : 'a Js.t Js.prop
  (** {% <p>A value to initialize this field with.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  method change : (t Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the value of a field is changed via the <a href="#!/api/Ext.form.field.Field-method-setValue" rel="Ext.form.field.Field-method-setValue" class="docClass">setValue</a> method.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Field.t Js.t]
    }
    {- newValue: ['a Js.t] {% <p>The new value</p> %}
    }
    {- oldValue: ['a Js.t]
    {% <p>The original value</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method dirtychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a change in the field's <a href="#!/api/Ext.form.field.Field-method-isDirty" rel="Ext.form.field.Field-method-isDirty" class="docClass">isDirty</a> state is detected.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Field.t Js.t]
    }
    {- isDirty: [bool Js.t]
    {% <p>Whether or not the field is now dirty</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method validitychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when a change in the field's validity is detected.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_field_Field.t Js.t]
    }
    {- isValid: [bool Js.t]
    {% <p>Whether or not the field is now valid</p> %}
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

