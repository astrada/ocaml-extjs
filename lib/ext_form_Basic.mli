(** Provides input field management, validation, submi ...
  
  {% <p>Provides input field management, validation, submission, and form loading services for the collection
of <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Field</a> instances within a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>. It is recommended
that you use a <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a> as the form container, as that has logic to automatically
hook up an instance of <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> (plus other conveniences related to field configuration.)</p>

<h2>Form Actions</h2>

<p>The Basic class delegates the handling of form loads and submits to instances of <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.
See the various Action implementations for specific details of each one's functionality, as well as the
documentation for <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a> which details the configuration options that can be specified in
each action call.</p>

<p>The default submit Action is <a href="#!/api/Ext.form.action.Submit" rel="Ext.form.action.Submit" class="docClass">Ext.form.action.Submit</a>, which uses an Ajax request to submit the
form's values to a configured URL. To enable normal browser submission of an Ext form, use the
<a href="#!/api/Ext.form.Basic-cfg-standardSubmit" rel="Ext.form.Basic-cfg-standardSubmit" class="docClass">standardSubmit</a> config option.</p>

<h2>File uploads</h2>

<p>File uploads are not performed using normal 'Ajax' techniques; see the description for
<a href="#!/api/Ext.form.Basic-method-hasUpload" rel="Ext.form.Basic-method-hasUpload" class="docClass">hasUpload</a> for details. If you're using file uploads you should read the method description.</p>

<h2>Example usage:</h2>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>', {
    title: 'Basic Form',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    bodyPadding: 5,
    width: 350,

    // Any configuration items here will be automatically passed along to
    // the <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> instance when it gets created.

    // The form will submit an AJAX request to this URL when submitted
    url: 'save-form.php',

    items: [{
        xtype: 'textfield',
        fieldLabel: 'Field',
        name: 'theField'
    }],

    buttons: [{
        text: 'Submit',
        handler: function() {
            // The getForm() method returns the <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Ext.form.Basic</a> instance:
            var form = this.up('form').getForm();
            if (form.isValid()) {
                // Submit the Ajax request and handle the response
                form.submit({
                    success: function(form, action) {
                       <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Success', action.result.message);
                    },
                    failure: function(form, action) {
                        <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Failed', action.result ? action.result.message : 'No response');
                    }
                });
            }
        }
    }]
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method owner : #Ext_container_Container.t Js.t Js.prop
  (** {% <p>The container component to which this BasicForm is attached.</p> %}
    *)
  method applyIfToFields : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Calls <a href="#!/api/Ext-method-applyIf" rel="Ext-method-applyIf" class="docClass">Ext.applyIf</a> for all field in this form with the passed object.</p> %}
    
    {b Parameters}:
    {ul {- obj: ['a Js.t]
    {% <p>The object to be applied</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method applyToFields : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Calls <a href="#!/api/Ext-method-apply" rel="Ext-method-apply" class="docClass">Ext.apply</a> for all fields in this form with the passed object.</p> %}
    
    {b Parameters}:
    {ul {- obj: ['a Js.t]
    {% <p>The object to be applied</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method checkDirty : unit Js.meth
  (** {% <p>Check whether the dirty state of the entire form has changed since it was last checked, and
if so fire the <a href="#!/api/Ext.form.Basic-event-dirtychange" rel="Ext.form.Basic-event-dirtychange" class="docClass">dirtychange</a> event. This is automatically invoked
when an individual field's dirty state changes.</p> %}
    *)
  method checkValidity : unit Js.meth
  (** {% <p>Check whether the validity of the entire form has changed since it was last checked, and
if so fire the <a href="#!/api/Ext.form.Basic-event-validitychange" rel="Ext.form.Basic-event-validitychange" class="docClass">validitychange</a> event. This is automatically invoked
when an individual field's validity changes.</p> %}
    *)
  method clearInvalid : 'self Js.t Js.meth
  (** {% <p>Clears all invalid field messages in this form.</p> %}
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys this object.</p> %}
    *)
  method doAction : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Performs a predefined action (an implementation of <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>) to perform application-
specific processing.</p> %}
    
    {b Parameters}:
    {ul {- action: ['a Js.t]
    {% <p>The name of the predefined action type, or instance of <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a> to perform.</p> %}
    }
    {- options: ['a Js.t]
    {% <p>The options to pass to the <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a> that will get created,
if the action argument is a String.</p>

<p>All of the config options listed below are supported by both the <a href="#!/api/Ext.form.action.Submit" rel="Ext.form.action.Submit" class="docClass">submit</a> and
<a href="#!/api/Ext.form.action.Load" rel="Ext.form.action.Load" class="docClass">load</a> actions unless otherwise noted (custom actions could also accept other
config options):</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method findField : Js.js_string Js.t -> Ext_form_field_Field.t Js.t Js.meth
  (** {% <p>Find a specific <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> in this form by id or name.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The value to search for (specify either a <a href="#!/api/Ext.Component-cfg-id" rel="Ext.Component-cfg-id" class="docClass">id</a> or
<a href="#!/api/Ext.form.field.Field-method-getName" rel="Ext.form.field.Field-method-getName" class="docClass">name or hiddenName</a>).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_field_Field.t Js.t]
    {% <p>The first matching field, or <code>null</code> if none was found.</p> %}
    }
    }
    *)
  method getFieldValues : bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Retrieves the fields in the form as a set of key/value pairs, using their
<a href="#!/api/Ext.form.field.Field-method-getModelData" rel="Ext.form.field.Field-method-getModelData" class="docClass">getModelData()</a> method to collect the values.
If multiple fields return values under the same name those values will be combined into an Array.
This is similar to <a href="#!/api/Ext.form.Basic-method-getValues" rel="Ext.form.Basic-method-getValues" class="docClass">getValues</a> except that this method collects type-specific data values
(e.g. Date objects for date fields) while getValues returns only String values for submission.</p> %}
    
    {b Parameters}:
    {ul {- dirtyOnly: [bool Js.t]
    {% <p>If true, only fields that are dirty will be included in the result.</p> %}
     Defaults to: false
    }
    }
    *)
  method getFields : Ext_util_MixedCollection.t Js.t Js.meth
  (** {% <p>Return all the <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Ext.form.field.Field</a> components in the owner container.</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t]
    {% <p>Collection of the Field objects</p> %}
    }
    }
    *)
  method getRecord : Ext_data_Model.t Js.t Js.meth
  (** {% <p>Returns the last <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> instance that was loaded via <a href="#!/api/Ext.form.Basic-method-loadRecord" rel="Ext.form.Basic-method-loadRecord" class="docClass">loadRecord</a></p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>The record</p> %}
    }
    }
    *)
  method getValues : bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Retrieves the fields in the form as a set of key/value pairs, using their
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
  method hasInvalidField : unit Js.meth
  (** {% <p>Returns true if the form contains any invalid fields. No fields will be marked as invalid
as a result of calling this; to trigger marking of fields use <a href="#!/api/Ext.form.Basic-method-isValid" rel="Ext.form.Basic-method-isValid" class="docClass">isValid</a> instead.</p> %}
    *)
  method hasUpload : unit Js.meth
  (** {% <p>Returns true if the form contains a file upload field. This is used to determine the method for submitting the
form: File uploads are not performed using normal 'Ajax' techniques, that is they are <strong>not</strong> performed using
XMLHttpRequests. Instead a hidden <code>&lt;form&gt;</code> element containing all the fields is created temporarily and submitted
with its <a href="http://www.w3.org/TR/REC-html40/present/frames.html#adef-target">target</a> set to refer to a dynamically generated, hidden <code>&lt;iframe&gt;</code> which is inserted into the document
but removed after the return data has been gathered.</p>

<p>The server response is parsed by the browser to create the document for the IFRAME. If the server is using JSON
to send the return object, then the <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">Content-Type</a> header must be set to "text/html" in order to tell the
browser to insert the text unchanged into the document body.</p>

<p>Characters which are significant to an HTML parser must be sent as HTML entities, so encode <code>"&lt;"</code> as <code>"&amp;lt;"</code>,
<code>"&amp;"</code> as <code>"&amp;amp;"</code> etc.</p>

<p>The response text is retrieved from the document, and a fake XMLHttpRequest object is created containing a
responseText property in order to conform to the requirements of event handlers and callbacks.</p>

<p>Be aware that file upload packets are sent with the content type <a href="http://www.faqs.org/rfcs/rfc2388.html">multipart/form</a> and some server technologies
(notably JEE) may require some custom processing in order to retrieve parameter names and parameter values from
the packet content.</p> %}
    
    {b Returns}:
    {ul {- [unit] {% <p>Boolean</p> %}
    }
    }
    *)
  method isDirty : unit Js.meth
  (** {% <p>Returns true if any fields in this form have changed from their original values.</p>

<p>Note that if this BasicForm was configured with <a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a> then the
Fields' <em>original values</em> are updated when the values are loaded by <a href="#!/api/Ext.form.Basic-method-setValues" rel="Ext.form.Basic-method-setValues" class="docClass">setValues</a>
or <a href="#!/api/Ext.form.Basic-method-loadRecord" rel="Ext.form.Basic-method-loadRecord" class="docClass">loadRecord</a>.</p> %}
    
    {b Returns}:
    {ul {- [unit] {% <p>Boolean</p> %}
    }
    }
    *)
  method isValid : unit Js.meth
  (** {% <p>Returns true if client-side validation on the form is successful. Any invalid fields will be
marked as invalid. If you only want to determine overall form validity without marking anything,
use <a href="#!/api/Ext.form.Basic-method-hasInvalidField" rel="Ext.form.Basic-method-hasInvalidField" class="docClass">hasInvalidField</a> instead.</p> %}
    
    {b Returns}:
    {ul {- [unit] {% <p>Boolean</p> %}
    }
    }
    *)
  method load : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Shortcut to <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">do</a> a <a href="#!/api/Ext.form.action.Load" rel="Ext.form.action.Load" class="docClass">load action</a>.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>The options to pass to the action (see <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a> for details)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method loadRecord : Ext_data_Model.t Js.t -> 'self Js.t Js.meth
  (** {% <p>Loads an <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> into this form by calling <a href="#!/api/Ext.form.Basic-method-setValues" rel="Ext.form.Basic-method-setValues" class="docClass">setValues</a> with the
<a href="#!/api/Ext.data.Model-property-raw" rel="Ext.data.Model-property-raw" class="docClass">record data</a>.
See also <a href="#!/api/Ext.form.Basic-cfg-trackResetOnLoad" rel="Ext.form.Basic-cfg-trackResetOnLoad" class="docClass">trackResetOnLoad</a>.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The record to load</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method markInvalid : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Mark fields in this form invalid in bulk.</p> %}
    
    {b Parameters}:
    {ul {- errors: ['a Js.t]
    {% <p>Either an array in the form <code>[{id:'fieldId', msg:'The message'}, ...]</code>,
an object hash of <code>{id: msg, id2: msg2}</code>, or a <a href="#!/api/Ext.data.Errors" rel="Ext.data.Errors" class="docClass">Ext.data.Errors</a> object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method reset : 'self Js.t Js.meth
  (** {% <p>Resets all fields in this form.</p> %}
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setValues : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Set values for fields in this form in bulk.</p> %}
    
    {b Parameters}:
    {ul {- values: ['a Js.t]
    {% <p>Either an array in the form:</p>

<pre><code>[{id:'clientName', value:'Fred. Olsen Lines'},
 {id:'portOfLoading', value:'FXT'},
 {id:'portOfDischarge', value:'OSL'} ]
</code></pre>

<p>or an object hash of the form:</p>

<pre><code>{
    clientName: 'Fred. Olsen Lines',
    portOfLoading: 'FXT',
    portOfDischarge: 'OSL'
}
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method submit : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Shortcut to <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">do</a> a <a href="#!/api/Ext.form.action.Submit" rel="Ext.form.action.Submit" class="docClass">submit action</a>. This will use the
<a href="#!/api/Ext.form.action.Submit" rel="Ext.form.action.Submit" class="docClass">AJAX submit action</a> by default. If the <a href="#!/api/Ext.form.Basic-cfg-standardSubmit" rel="Ext.form.Basic-cfg-standardSubmit" class="docClass">standardSubmit</a> config
is enabled it will use a standard form element to submit, or if the <a href="#!/api/Ext.form.Basic-cfg-api" rel="Ext.form.Basic-cfg-api" class="docClass">api</a> config is present
it will use the <a href="#!/api/Ext.form.action.DirectLoad" rel="Ext.form.action.DirectLoad" class="docClass">Ext.direct.Direct submit action</a>.</p>

<p>The following code:</p>

<pre><code>myFormPanel.getForm().submit({
    clientValidation: true,
    url: 'updateConsignment.php',
    params: {
        newStatus: 'delivered'
    },
    success: function(form, action) {
       <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Success', action.result.msg);
    },
    failure: function(form, action) {
        switch (action.failureType) {
            case <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.CLIENT_INVALID:
                <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Failure', 'Form fields may not be submitted with invalid values');
                break;
            case <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.CONNECT_FAILURE:
                <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Failure', 'Ajax communication failed');
                break;
            case <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.SERVER_INVALID:
               <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Failure', action.result.msg);
       }
    }
});
</code></pre>

<p>would process the following server response for a successful submission:</p>

<pre><code>{
    "success":true, // note this is Boolean, not string
    "msg":"Consignment updated"
}
</code></pre>

<p>and the following server response for a failed submission:</p>

<pre><code>{
    "success":false, // note this is Boolean, not string
    "msg":"You do not have permission to perform this operation"
}
</code></pre> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>The options to pass to the action (see <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a> for details).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method updateRecord : Ext_data_Model.t Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Persists the values in this form into the passed <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> object in a beginEdit/endEdit block.
If the record is not specified, it will attempt to update (if it exists) the record provided to loadRecord.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The record to edit</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_Basic.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method api : 'a Js.t Js.prop
  (** {% <p>If specified, load and submit actions will be handled with <a href="#!/api/Ext.form.action.DirectLoad" rel="Ext.form.action.DirectLoad" class="docClass">DirectLoad</a>
and <a href="#!/api/Ext.form.action.DirectSubmit" rel="Ext.form.action.DirectSubmit" class="docClass">DirectSubmit</a>.  Methods which have been imported by
<a href="#!/api/Ext.direct.Manager" rel="Ext.direct.Manager" class="docClass">Ext.direct.Manager</a> can be specified here to load and submit forms. API methods may also be
specified as strings. See <a href="#!/api/Ext.data.proxy.Direct-cfg-directFn" rel="Ext.data.proxy.Direct-cfg-directFn" class="docClass">Ext.data.proxy.Direct.directFn</a>.  Such as the following:</p>

<pre><code>api: {
    load: App.ss.MyProfile.load,
    submit: App.ss.MyProfile.submit
}
</code></pre>

<p>Load actions can use <a href="#!/api/Ext.form.Basic-cfg-paramOrder" rel="Ext.form.Basic-cfg-paramOrder" class="docClass">paramOrder</a> or <a href="#!/api/Ext.form.Basic-cfg-paramsAsHash" rel="Ext.form.Basic-cfg-paramsAsHash" class="docClass">paramsAsHash</a> to customize how the load method
is invoked.  Submit actions will always use a standard form submit. The <code>formHandler</code> configuration
(see Ext.direct.RemotingProvider#action) must be set on the associated server-side method which has
been imported by <a href="#!/api/Ext.direct.Manager" rel="Ext.direct.Manager" class="docClass">Ext.direct.Manager</a>.</p> %}
    *)
  method baseParams : 'a Js.t Js.prop
  (** {% <p>Parameters to pass with all requests. e.g. baseParams: <code>{id: '123', foo: 'bar'}</code>.</p>

<p>Parameters are encoded as standard HTTP parameters using <a href="#!/api/Ext.Object-method-toQueryString" rel="Ext.Object-method-toQueryString" class="docClass">Ext.Object.toQueryString</a>.</p> %}
    *)
  method errorReader : Ext_data_reader_Reader.t Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.DataReader</a> (e.g. <a href="#!/api/Ext.data.reader.Xml" rel="Ext.data.reader.Xml" class="docClass">Ext.data.reader.Xml</a>) to be used to
read field error messages returned from 'submit' actions. This is optional
as there is built-in support for processing JSON responses.</p>

<p>The Records which provide messages for the invalid Fields must use the
Field name (or id) as the Record ID, and must contain a field called 'msg'
which contains the error message.</p>

<p>The errorReader does not have to be a full-blown implementation of a
Reader. It simply needs to implement a <code>read(xhr)</code> function
which returns an Array of Records in an object with the following
structure:</p>

<pre><code>{
    records: recordArray
}
</code></pre> %}
    *)
  method method_ : Js.js_string Js.t Js.prop
  (** {% <p>The request method to use (GET or POST) for form actions if one isn't supplied in the action options.</p> %}
    *)
  method paramOrder : 'a Js.t Js.prop
  (** {% <p>A list of params to be executed server side. Only used for the <a href="#!/api/Ext.form.Basic-cfg-api" rel="Ext.form.Basic-cfg-api" class="docClass">api</a> <code>load</code>
configuration.</p>

<p>Specify the params in the order in which they must be executed on the
server-side as either (1) an Array of String values, or (2) a String of params
delimited by either whitespace, comma, or pipe. For example,
any of the following would be acceptable:</p>

<pre><code>paramOrder: ['param1','param2','param3']
paramOrder: 'param1 param2 param3'
paramOrder: 'param1,param2,param3'
paramOrder: 'param1|param2|param'
</code></pre> %}
    *)
  method paramsAsHash : bool Js.t Js.prop
  (** {% <p>Only used for the <a href="#!/api/Ext.form.Basic-cfg-api" rel="Ext.form.Basic-cfg-api" class="docClass">api</a> <code>load</code> configuration. If true, parameters will be sent as a
single hash collection of named arguments. Providing a <a href="#!/api/Ext.form.Basic-cfg-paramOrder" rel="Ext.form.Basic-cfg-paramOrder" class="docClass">paramOrder</a> nullifies this
configuration.</p> %}
    
    Defaults to: [false]
    *)
  method reader : Ext_data_reader_Reader.t Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.DataReader</a> (e.g. <a href="#!/api/Ext.data.reader.Xml" rel="Ext.data.reader.Xml" class="docClass">Ext.data.reader.Xml</a>) to be used to read
data when executing 'load' actions. This is optional as there is built-in
support for processing JSON responses.</p> %}
    *)
  method standardSubmit : bool Js.t Js.prop
  (** {% <p>If set to true, a standard HTML form submit is used instead of a XHR (Ajax) style form submission.
All of the field values, plus any additional params configured via <a href="#!/api/Ext.form.Basic-cfg-baseParams" rel="Ext.form.Basic-cfg-baseParams" class="docClass">baseParams</a>
and/or the <code>options</code> to <a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submit</a>, will be included in the values submitted in the form.</p> %}
    *)
  method timeout : Js.number Js.t Js.prop
  (** {% <p>Timeout for form actions in seconds.</p> %}
    
    Defaults to: [30]
    *)
  method trackResetOnLoad : bool Js.t Js.prop
  (** {% <p>If set to true, <a href="#!/api/Ext.form.Basic-method-reset" rel="Ext.form.Basic-method-reset" class="docClass">reset</a>() resets to the last loaded or <a href="#!/api/Ext.form.Basic-method-setValues" rel="Ext.form.Basic-method-setValues" class="docClass">setValues</a>() data instead of
when the form was first created.</p> %}
    
    Defaults to: [false]
    *)
  method url : Js.js_string Js.t Js.prop
  (** {% <p>The URL to use for form actions if one isn't supplied in the
<a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a> options.</p> %}
    *)
  method waitMsgTarget : 'a Js.t Js.prop
  (** {% <p>By default wait messages are displayed with <a href="#!/api/Ext.MessageBox-method-wait" rel="Ext.MessageBox-method-wait" class="docClass">Ext.MessageBox.wait</a>. You can target a specific
element by passing it or its id or mask the form itself by passing in true.</p> %}
    *)
  method waitTitle : Js.js_string Js.t Js.prop
  (** {% <p>The default title to show for the waiting message box</p> %}
    
    Defaults to: ['Please Wait...']
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method actioncomplete : (t Js.t -> Ext_form_action_Action.t Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
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
  method actionfailed : (t Js.t -> Ext_form_action_Action.t Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
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
  method beforeaction : (t Js.t -> Ext_form_action_Action.t Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
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
  method dirtychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
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
  method validitychange : (t Js.t -> bool Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
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
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

