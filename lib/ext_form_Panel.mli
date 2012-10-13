(** FormPanel provides a standard container for forms. ...
  
  {% <p>FormPanel provides a standard container for forms. It is essentially a standard <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a> which
automatically creates a <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">BasicForm</a> for managing any <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a>
objects that are added as descendants of the panel. It also includes conveniences for configuring and
working with the BasicForm and the collection of Fields.</p>

<h1>Layout</h1>

<p>By default, FormPanel is configured with <code><a href="#!/api/Ext.layout.container.Anchor" rel="Ext.layout.container.Anchor" class="docClass">layout:'anchor'</a></code> for
the layout of its immediate child items. This can be changed to any of the supported container layouts.
The layout of sub-containers is configured in <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">the standard way</a>.</p>

<h1>BasicForm</h1>

<p>Although <strong>not listed</strong> as configuration options of FormPanel, the FormPanel class accepts all
of the config options supported by the <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> class, and will pass them along to
the internal BasicForm when it is created.</p>

<p>The following events fired by the BasicForm will be re-fired by the FormPanel and can therefore be
listened for on the FormPanel itself:</p>

<ul>
<li><a href="#!/api/Ext.form.Basic-event-beforeaction" rel="Ext.form.Basic-event-beforeaction" class="docClass">beforeaction</a></li>
<li><a href="#!/api/Ext.form.Basic-event-actionfailed" rel="Ext.form.Basic-event-actionfailed" class="docClass">actionfailed</a></li>
<li><a href="#!/api/Ext.form.Basic-event-actioncomplete" rel="Ext.form.Basic-event-actioncomplete" class="docClass">actioncomplete</a></li>
<li><a href="#!/api/Ext.form.Basic-event-validitychange" rel="Ext.form.Basic-event-validitychange" class="docClass">validitychange</a></li>
<li><a href="#!/api/Ext.form.Basic-event-dirtychange" rel="Ext.form.Basic-event-dirtychange" class="docClass">dirtychange</a></li>
</ul>


<h1>Field Defaults</h1>

<p>The <a href="#!/api/Ext.form.Panel-cfg-fieldDefaults" rel="Ext.form.Panel-cfg-fieldDefaults" class="docClass">fieldDefaults</a> config option conveniently allows centralized configuration of default values
for all fields added as descendants of the FormPanel. Any config option recognized by implementations
of <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> may be included in this object. See the <a href="#!/api/Ext.form.Panel-cfg-fieldDefaults" rel="Ext.form.Panel-cfg-fieldDefaults" class="docClass">fieldDefaults</a> documentation
for details of how the defaults are applied.</p>

<h1>Form Validation</h1>

<p>With the default configuration, form fields are validated on-the-fly while the user edits their values.
This can be controlled on a per-field basis (or via the <a href="#!/api/Ext.form.Panel-cfg-fieldDefaults" rel="Ext.form.Panel-cfg-fieldDefaults" class="docClass">fieldDefaults</a> config) with the field
config properties <a href="#!/api/Ext.form.field.Field-cfg-validateOnChange" rel="Ext.form.field.Field-cfg-validateOnChange" class="docClass">Ext.form.field.Field.validateOnChange</a> and <a href="#!/api/Ext.form.field.Base-cfg-checkChangeEvents" rel="Ext.form.field.Base-cfg-checkChangeEvents" class="docClass">Ext.form.field.Base.checkChangeEvents</a>,
and the FormPanel's config properties <a href="#!/api/Ext.form.Panel-cfg-pollForChanges" rel="Ext.form.Panel-cfg-pollForChanges" class="docClass">pollForChanges</a> and <a href="#!/api/Ext.form.Panel-cfg-pollInterval" rel="Ext.form.Panel-cfg-pollInterval" class="docClass">pollInterval</a>.</p>

<p>Any component within the FormPanel can be configured with <code>formBind: true</code>. This will cause that
component to be automatically disabled when the form is invalid, and enabled when it is valid. This is most
commonly used for Button components to prevent submitting the form in an invalid state, but can be used on
any component type.</p>

<p>For more information on form validation see the following:</p>

<ul>
<li><a href="#!/api/Ext.form.field.Field-cfg-validateOnChange" rel="Ext.form.field.Field-cfg-validateOnChange" class="docClass">Ext.form.field.Field.validateOnChange</a></li>
<li><a href="#!/api/Ext.form.Panel-cfg-pollForChanges" rel="Ext.form.Panel-cfg-pollForChanges" class="docClass">pollForChanges</a> and <a href="#!/api/Ext.form.Panel-cfg-pollInterval" rel="Ext.form.Panel-cfg-pollInterval" class="docClass">pollInterval</a></li>
<li><a href="#!/api/Ext.form.field.VTypes" rel="Ext.form.field.VTypes" class="docClass">Ext.form.field.VTypes</a></li>
<li><a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">BasicForm.doAction clientValidation notes</a></li>
</ul>


<h1>Form Submission</h1>

<p>By default, Ext Forms are submitted through Ajax, using <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>. See the documentation for
<a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> for details.</p>

<h1>Example usage</h1>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>', {
    title: 'Simple Form',
    bodyPadding: 5,
    width: 350,

    // The form will submit an AJAX request to this URL when submitted
    url: 'save-form.php',

    // Fields will be arranged vertically, stretched to full width
    layout: 'anchor',
    defaults: {
        anchor: '100%'
    },

    // The fields
    defaultType: 'textfield',
    items: [{
        fieldLabel: 'First Name',
        name: 'first',
        allowBlank: false
    },{
        fieldLabel: 'Last Name',
        name: 'last',
        allowBlank: false
    }],

    // Reset and Submit buttons
    buttons: [{
        text: 'Reset',
        handler: function() {
            this.up('form').getForm().reset();
        }
    }, {
        text: 'Submit',
        formBind: true, //only enabled once the form is valid
        disabled: true,
        handler: function() {
            var form = this.up('form').getForm();
            if (form.isValid()) {
                form.submit({
                    success: function(form, action) {
                       <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Success', action.result.msg);
                    },
                    failure: function(form, action) {
                        <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Failed', action.result.msg);
                    }
                });
            }
        }
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
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_form_FieldAncestor.t
  
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method checkChange : unit Js.meth
  (** {% <p>Forces each field within the form panel to
<a href="#!/api/Ext.form.field.Field-method-checkChange" rel="Ext.form.field.Field-method-checkChange" class="docClass">check if its value has changed</a>.</p> %}
    *)
  method getForm : Ext_form_Basic.t Js.t Js.meth
  (** {% <p>Provides access to the <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Form</a> which this Panel contains.</p> %}
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t]
    {% <p>The <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Form</a> which this Panel contains.</p> %}
    }
    }
    *)
  method getRecord : Ext_data_Model.t Js.t Js.meth
  (** {% <p>Returns the currently loaded <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> instance if one was loaded via <a href="#!/api/Ext.form.Panel-method-loadRecord" rel="Ext.form.Panel-method-loadRecord" class="docClass">loadRecord</a>.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>The loaded instance</p> %}
    }
    }
    *)
  method getValues : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Convenience function for fetching the current value of each field in the form. This is the same as calling
<a href="#!/api/Ext.form.Basic-method-getValues" rel="Ext.form.Basic-method-getValues" class="docClass">this.getForm().getValues()</a>.</p>

<p>Retrieves the fields in the form as a set of key/value pairs, using their
<a href="#!/api/Ext.form.field.Field-method-getSubmitData" rel="Ext.form.field.Field-method-getSubmitData" class="docClass">getSubmitData()</a> method to collect the values.
If multiple fields return values under the same name those values will be combined into an Array.
This is similar to <a href="#!/api/Ext.form.Basic-method-getFieldValues" rel="Ext.form.Basic-method-getFieldValues" class="docClass">getFieldValues</a> except that this method
collects only String values for submission, while getFieldValues collects type-specific data
values (e.g. Date objects for date fields.)</p> %}
    
    {b Parameters}:
    {ul {- asString: [bool Js.t]
    {% <p>If true, will return the key/value collection as a single
URL-encoded param string.</p> %}
     Defaults to: false
    }
    {- dirtyOnly: [bool Js.t]
    {% <p>If true, only fields that are dirty will be included in the result.</p> %}
     Defaults to: false
    }
    {- includeEmptyText: [bool Js.t]
    {% <p>If true, the configured emptyText of empty fields will be used.</p> %}
     Defaults to: false
    }
    {- useDataValues: [bool Js.t]
    {% <p>If true, the <a href="#!/api/Ext.form.field.Field-method-getModelData" rel="Ext.form.field.Field-method-getModelData" class="docClass">getModelData</a>
method is used to retrieve values from fields, otherwise the <a href="#!/api/Ext.form.field.Field-method-getSubmitData" rel="Ext.form.field.Field-method-getSubmitData" class="docClass">getSubmitData</a>
method is used.</p> %}
     Defaults to: false
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
  method load : 'a Js.t -> unit Js.meth
  (** {% <p>This is a proxy for the underlying BasicForm's <a href="#!/api/Ext.form.Basic-method-load" rel="Ext.form.Basic-method-load" class="docClass">Ext.form.Basic.load</a> call.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>The options to pass to the action (see <a href="#!/api/Ext.form.Basic-method-load" rel="Ext.form.Basic-method-load" class="docClass">Ext.form.Basic.load</a> and
<a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">Ext.form.Basic.doAction</a> for details)</p> %}
    }
    }
    *)
  method loadRecord : Ext_data_Model.t Js.t -> Ext_form_Basic.t Js.t Js.meth
  (** {% <p>Loads an <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> into this form (internally just calls <a href="#!/api/Ext.form.Basic-method-loadRecord" rel="Ext.form.Basic-method-loadRecord" class="docClass">Ext.form.Basic.loadRecord</a>)
See also <a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a>.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The record to load</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t]
    {% <p>The <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> attached to this FormPanel</p> %}
    }
    }
    *)
  method startPolling : Js.number Js.t -> unit Js.meth
  (** {% <p>Start an interval task to continuously poll all the fields in the form for changes in their
values. This is normally started automatically by setting the <a href="#!/api/Ext.form.Panel-cfg-pollForChanges" rel="Ext.form.Panel-cfg-pollForChanges" class="docClass">pollForChanges</a> config.</p> %}
    
    {b Parameters}:
    {ul {- interval: [Js.number Js.t]
    {% <p>The interval in milliseconds at which the check should run.</p> %}
    }
    }
    *)
  method stopPolling : unit Js.meth
  (** {% <p>Stop a running interval task that was started by <a href="#!/api/Ext.form.Panel-method-startPolling" rel="Ext.form.Panel-method-startPolling" class="docClass">startPolling</a>.</p> %}
    *)
  method submit : 'a Js.t -> unit Js.meth
  (** {% <p>This is a proxy for the underlying BasicForm's <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">Ext.form.Basic.submit</a> call.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>The options to pass to the action (see <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">Ext.form.Basic.submit</a> and
<a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">Ext.form.Basic.doAction</a> for details)</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  inherit Ext_form_FieldAncestor.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method layout_2 : Js.js_string Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">Ext.container.Container.layout</a> for the form panel's immediate child items.
Defaults to <code>'anchor'</code>.</p> %}
    
    Defaults to: ['anchor']
    *)
  method pollForChanges : bool Js.t Js.prop
  (** {% <p>If set to <code>true</code>, sets up an interval task (using the <a href="#!/api/Ext.form.Panel-cfg-pollInterval" rel="Ext.form.Panel-cfg-pollInterval" class="docClass">pollInterval</a>) in which the
panel's fields are repeatedly checked for changes in their values. This is in addition to the normal detection
each field does on its own input element, and is not needed in most cases. It does, however, provide a
means to absolutely guarantee detection of all changes including some edge cases in some browsers which
do not fire native events. Defaults to <code>false</code>.</p> %}
    *)
  method pollInterval : Js.number Js.t Js.prop
  (** {% <p>Interval in milliseconds at which the form's fields are checked for value changes. Only used if
the <a href="#!/api/Ext.form.Panel-cfg-pollForChanges" rel="Ext.form.Panel-cfg-pollForChanges" class="docClass">pollForChanges</a> option is set to <code>true</code>. Defaults to 500 milliseconds.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  inherit Ext_form_FieldAncestor.events
  
  method actioncomplete : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when an action is completed.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Basic.t Js.t]
    }
    {- action: [Ext_form_action_Action.t Js.t]
    {% <p>The <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a> that completed</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method actionfailed : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when an action fails.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Basic.t Js.t]
    }
    {- action: [Ext_form_action_Action.t Js.t]
    {% <p>The <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a> that failed</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeaction : (Ext_form_Basic.t Js.t ->
    Ext_form_action_Action.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before any action is performed. Return false to cancel the action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Basic.t Js.t]
    }
    {- action: [Ext_form_action_Action.t Js.t]
    {% <p>The <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a> to be performed</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method dirtychange : (Ext_form_Basic.t Js.t -> bool Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the dirty state of the entire form changes.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Basic.t Js.t]
    }
    {- dirty: [bool Js.t]
    {% <p><code>true</code> if the form is now dirty, <code>false</code> if it is no longer dirty.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method validitychange : (Ext_form_Basic.t Js.t -> bool Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the validity of the entire form changes.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_Basic.t Js.t]
    }
    {- valid: [bool Js.t]
    {% <p><code>true</code> if the form is now valid, <code>false</code> if it is now invalid.</p> %}
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
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  inherit Ext_form_FieldAncestor.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

