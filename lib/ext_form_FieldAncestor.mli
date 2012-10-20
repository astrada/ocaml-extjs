(** A mixin for Ext.container.Container components tha ...
  
  {% <p>A mixin for <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a> components that are likely to have form fields in their
items subtree. Adds the following capabilities:</p>

<ul>
<li>Methods for handling the addition and removal of <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> and <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a>
instances at any depth within the container.</li>
<li>Events (<a href="#!/api/Ext.form.FieldAncestor-event-fieldvaliditychange" rel="Ext.form.FieldAncestor-event-fieldvaliditychange" class="docClass">fieldvaliditychange</a> and <a href="#!/api/Ext.form.FieldAncestor-event-fielderrorchange" rel="Ext.form.FieldAncestor-event-fielderrorchange" class="docClass">fielderrorchange</a>) for handling changes to the state
of individual fields at the container level.</li>
<li>Automatic application of <a href="#!/api/Ext.form.FieldAncestor-cfg-fieldDefaults" rel="Ext.form.FieldAncestor-cfg-fieldDefaults" class="docClass">fieldDefaults</a> config properties to each field added within the
container, to facilitate uniform configuration of all fields.</li>
</ul>


<p>This mixin is primarily for internal use by <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a> and <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a>,
and should not normally need to be used directly.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method initFieldAncestor : unit Js.meth
  (** {% <p>Initializes the FieldAncestor's state; this must be called from the initComponent method of any components
importing this mixin.</p> %}
    *)
  method onFieldAdded : #Ext_form_field_Field.t Js.t -> unit Js.meth
  (** {% <p>Called when a <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> instance is added to the container's subtree.</p> %}
    
    {b Parameters}:
    {ul {- field: [#Ext_form_field_Field.t Js.t]
    {% <p>The field which was added</p> %}
    }
    }
    *)
  method onFieldErrorChange : Ext_form_Labelable.t Js.t -> Js.js_string Js.t
    -> unit Js.meth
  (** {% <p>Fired when the error message of any field within the container changes.</p> %}
    
    {b Parameters}:
    {ul {- field: [Ext_form_Labelable.t Js.t]
    {% <p>The sub-field whose active error changed</p> %}
    }
    {- error: [Js.js_string Js.t]
    {% <p>The new active error message</p> %}
    }
    }
    *)
  method onFieldRemoved : #Ext_form_field_Field.t Js.t -> unit Js.meth
  (** {% <p>Called when a <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> instance is removed from the container's subtree.</p> %}
    
    {b Parameters}:
    {ul {- field: [#Ext_form_field_Field.t Js.t]
    {% <p>The field which was removed</p> %}
    }
    }
    *)
  method onFieldValidityChange : #Ext_form_field_Field.t Js.t -> bool Js.t ->
    unit Js.meth
  (** {% <p>Fired when the validity of any field within the container changes.</p> %}
    
    {b Parameters}:
    {ul {- field: [#Ext_form_field_Field.t Js.t]
    {% <p>The sub-field whose validity changed</p> %}
    }
    {- valid: [bool Js.t] {% <p>The new validity state</p> %}
    }
    }
    *)
  method onLabelableAdded : Ext_form_Labelable.t Js.t -> unit Js.meth
  (** {% <p>Called when a <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> instance is added to the container's subtree.</p> %}
    
    {b Parameters}:
    {ul {- labelable: [Ext_form_Labelable.t Js.t]
    {% <p>The instance that was added</p> %}
    }
    }
    *)
  method onLabelableRemoved : Ext_form_Labelable.t Js.t -> unit Js.meth
  (** {% <p>Called when a <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> instance is removed from the container's subtree.</p> %}
    
    {b Parameters}:
    {ul {- labelable: [Ext_form_Labelable.t Js.t]
    {% <p>The instance that was removed</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method fieldDefaults : _ Js.t Js.prop
  (** {% <p>If specified, the properties in this object are used as default config values for each <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a>
instance (e.g. <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a> or <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a>) that is added as a descendant of
this container. Corresponding values specified in an individual field's own configuration, or from the <a href="#!/api/Ext.container.Container-cfg-defaults" rel="Ext.container.Container-cfg-defaults" class="docClass">defaults config</a> of its parent container, will take precedence. See the
documentation for <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> to see what config options may be specified in the fieldDefaults.</p>

<p>Example:</p>

<pre><code>new <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>({
    fieldDefaults: {
        labelAlign: 'left',
        labelWidth: 100
    },
    items: [{
        xtype: 'fieldset',
        defaults: {
            labelAlign: 'top'
        },
        items: [{
            name: 'field1'
        }, {
            name: 'field2'
        }]
    }, {
        xtype: 'fieldset',
        items: [{
            name: 'field3',
            labelWidth: 150
        }, {
            name: 'field4'
        }]
    }]
});
</code></pre>

<p>In this example, field1 and field2 will get labelAlign:'top' (from the fieldset's defaults) and labelWidth:100
(from fieldDefaults), field3 and field4 will both get labelAlign:'left' (from fieldDefaults and field3 will use
the labelWidth:150 from its own config.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  method fielderrorchange : (t Js.t -> Ext_form_Labelable.t Js.t ->
    Js.js_string Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the active error message is changed for any one of the <a href="#!/api/Ext.form.Labelable" rel="Ext.form.Labelable" class="docClass">Ext.form.Labelable</a> instances
within this container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_FieldAncestor.t Js.t]
    }
    {- the: [Ext_form_Labelable.t Js.t]
    {% <p>Labelable instance whose active error was changed</p> %}
    }
    {- error: [Js.js_string Js.t]
    {% <p>The active error message</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method fieldvaliditychange : (t Js.t -> Ext_form_Labelable.t Js.t ->
    Js.js_string Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the validity state of any one of the <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> instances within this
container changes.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_form_FieldAncestor.t Js.t]
    }
    {- the: [Ext_form_Labelable.t Js.t]
    {% <p>Field instance whose validity changed</p> %}
    }
    {- isValid: [Js.js_string Js.t]
    {% <p>The field's new validity state</p> %}
    }
    {- eOpts: [_ Js.t]
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

