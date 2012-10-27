(** The subclasses of this class provide actions to pe ...
  
  {% <p>The subclasses of this class provide actions to perform upon <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Form</a>s.</p>

<p>Instances of this class are only created by a <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">Form</a> when the Form needs to perform an action
such as submit or load. The Configuration options listed for this class are set through the Form's action methods:
<a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submit</a>, <a href="#!/api/Ext.form.Basic-method-load" rel="Ext.form.Basic-method-load" class="docClass">load</a> and <a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a></p>

<p>The instance of Action which performed the action is passed to the success and failure callbacks of the Form's action
methods (<a href="#!/api/Ext.form.Basic-method-submit" rel="Ext.form.Basic-method-submit" class="docClass">submit</a>, <a href="#!/api/Ext.form.Basic-method-load" rel="Ext.form.Basic-method-load" class="docClass">load</a> and
<a href="#!/api/Ext.form.Basic-method-doAction" rel="Ext.form.Basic-method-doAction" class="docClass">doAction</a>), and to the <a href="#!/api/Ext.form.Basic-event-actioncomplete" rel="Ext.form.Basic-event-actioncomplete" class="docClass">actioncomplete</a> and
<a href="#!/api/Ext.form.Basic-event-actionfailed" rel="Ext.form.Basic-event-actionfailed" class="docClass">actionfailed</a> event handlers.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method failureType : Js.js_string Js.t Js.prop
  (** {% <p>The type of failure detected will be one of these:
<a href="#!/api/Ext.form.action.Action-static-property-CLIENT_INVALID" rel="Ext.form.action.Action-static-property-CLIENT_INVALID" class="docClass">CLIENT_INVALID</a>, <a href="#!/api/Ext.form.action.Action-static-property-SERVER_INVALID" rel="Ext.form.action.Action-static-property-SERVER_INVALID" class="docClass">SERVER_INVALID</a>, <a href="#!/api/Ext.form.action.Action-static-property-CONNECT_FAILURE" rel="Ext.form.action.Action-static-property-CONNECT_FAILURE" class="docClass">CONNECT_FAILURE</a>, or <a href="#!/api/Ext.form.action.Action-static-property-LOAD_FAILURE" rel="Ext.form.action.Action-static-property-LOAD_FAILURE" class="docClass">LOAD_FAILURE</a>.</p>

<p>Usage:</p>

<pre><code>var fp = new <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>({
...
buttons: [{
    text: 'Save',
    formBind: true,
    handler: function(){
        if(fp.getForm().isValid()){
            fp.getForm().submit({
                url: 'form-submit.php',
                waitMsg: 'Submitting your data...',
                success: function(form, action){
                    // server responded with success = true
                    var result = action.<a href="#!/api/Ext.form.action.Action-property-result" rel="Ext.form.action.Action-property-result" class="docClass">result</a>;
                },
                failure: function(form, action){
                    if (action.<a href="#!/api/Ext.form.action.Action-property-failureType" rel="Ext.form.action.Action-property-failureType" class="docClass">failureType</a> === <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.CONNECT_FAILURE) {
                        <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Error',
                            'Status:'+action.<a href="#!/api/Ext.form.action.Action-property-response" rel="Ext.form.action.Action-property-response" class="docClass">response</a>.status+': '+
                            action.<a href="#!/api/Ext.form.action.Action-property-response" rel="Ext.form.action.Action-property-response" class="docClass">response</a>.statusText);
                    }
                    if (action.failureType === <a href="#!/api/Ext.form.action.Action" rel="Ext.form.action.Action" class="docClass">Ext.form.action.Action</a>.SERVER_INVALID){
                        // server responded with success = false
                        <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Invalid', action.<a href="#!/api/Ext.form.action.Action-property-result" rel="Ext.form.action.Action-property-result" class="docClass">result</a>.errormsg);
                    }
                }
            });
        }
    }
},{
    text: 'Reset',
    handler: function(){
        fp.getForm().reset();
    }
}]
</code></pre> %}
    *)
  method response : _ Js.t Js.prop
  (** {% <p>The raw XMLHttpRequest object used to perform the action.</p> %}
    *)
  method result : _ Js.t Js.prop
  (** {% <p>The decoded response object containing a boolean <code>success</code> property and other, action-specific properties.</p> %}
    *)
  method _type : Js.js_string Js.t Js.prop
  (** {% <p>The type of action this Action instance performs. Currently only "submit" and "load" are supported.</p> %}
    *)
  method run : unit Js.meth
  (** {% <p>Invokes this action using the current configuration.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method failure : _ Js.callback Js.prop
  (** {% <p>The function to call when a failure packet was received, or when an error ocurred in the Ajax communication.</p> %}
    *)
  method form : _ Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.form.Basic" rel="Ext.form.Basic" class="docClass">BasicForm</a> instance that is invoking this Action. Required.</p> %}
    *)
  method headers : _ Js.t Js.prop
  (** {% <p>Extra headers to be sent in the AJAX request for submit and load actions.
See <a href="#!/api/Ext.data.proxy.Ajax-cfg-headers" rel="Ext.data.proxy.Ajax-cfg-headers" class="docClass">Ext.data.proxy.Ajax.headers</a>.</p> %}
    *)
  method _method : Js.js_string Js.t Js.prop
  (** {% <p>The HTTP method to use to access the requested URL.
Defaults to the <a href="#!/api/Ext.form.Basic-cfg-method" rel="Ext.form.Basic-cfg-method" class="docClass">BasicForm's method</a>, or 'POST' if not specified.</p> %}
    *)
  method params : _ Js.t Js.prop
  (** {% <p>Extra parameter values to pass. These are added to the Form's <a href="#!/api/Ext.form.Basic-cfg-baseParams" rel="Ext.form.Basic-cfg-baseParams" class="docClass">Ext.form.Basic.baseParams</a> and passed to the
specified URL along with the Form's input fields.</p>

<p>Parameters are encoded as standard HTTP parameters using <a href="#!/api/Ext-method-urlEncode" rel="Ext-method-urlEncode" class="docClass">Ext.Object.toQueryString</a>.</p> %}
    *)
  method reset : bool Js.t Js.prop
  (** {% <p>When set to <strong>true</strong>, causes the Form to be <a href="#!/api/Ext.form.Basic-method-reset" rel="Ext.form.Basic-method-reset" class="docClass">reset</a> on Action success. If specified,
this happens before the <a href="#!/api/Ext.form.action.Action-cfg-success" rel="Ext.form.action.Action-cfg-success" class="docClass">success</a> callback is called and before the Form's
<a href="#!/api/Ext.form.Basic-event-actioncomplete" rel="Ext.form.Basic-event-actioncomplete" class="docClass">actioncomplete</a> event fires.</p> %}
    *)
  method scope : _ Js.t Js.prop
  (** {% <p>The scope in which to call the configured <a href="#!/api/Ext.form.action.Action-cfg-success" rel="Ext.form.action.Action-cfg-success" class="docClass">success</a> and <a href="#!/api/Ext.form.action.Action-cfg-failure" rel="Ext.form.action.Action-cfg-failure" class="docClass">failure</a> callback functions
(the <code>this</code> reference for the callback functions).</p> %}
    *)
  method submitEmptyText : bool Js.t Js.prop
  (** {% <p>If set to true, the emptyText value will be sent with the form when it is submitted.</p> %}
    
    Defaults to: [true]
    *)
  method success : _ Js.callback Js.prop
  (** {% <p>The function to call when a valid success return packet is received.</p> %}
    *)
  method timeout : Js.number Js.t Js.prop
  (** {% <p>The number of seconds to wait for a server response before failing with the <a href="#!/api/Ext.form.action.Action-property-failureType" rel="Ext.form.action.Action-property-failureType" class="docClass">failureType</a> as
<a href="#!/api/Ext.form.action.Action-static-property-CONNECT_FAILURE" rel="Ext.form.action.Action-static-property-CONNECT_FAILURE" class="docClass">CONNECT_FAILURE</a>. If not specified, defaults to the configured
<a href="#!/api/Ext.form.Basic-cfg-timeout" rel="Ext.form.Basic-cfg-timeout" class="docClass">timeout</a> of the <a href="#!/api/Ext.form.action.Action-cfg-form" rel="Ext.form.action.Action-cfg-form" class="docClass">form</a>.</p> %}
    *)
  method url : Js.js_string Js.t Js.prop
  (** {% <p>The URL that the Action is to invoke. Will default to the <a href="#!/api/Ext.form.Basic-cfg-url" rel="Ext.form.Basic-cfg-url" class="docClass">url</a> configured on the
<a href="#!/api/Ext.form.action.Action-cfg-form" rel="Ext.form.action.Action-cfg-form" class="docClass">form</a>.</p> %}
    *)
  method waitMsg : Js.js_string Js.t Js.prop
  (** {% <p>The message to be displayed by a call to <a href="#!/api/Ext.window.MessageBox-method-wait" rel="Ext.window.MessageBox-method-wait" class="docClass">Ext.window.MessageBox.wait</a> during the time the action is being
processed.</p> %}
    *)
  method waitTitle : Js.js_string Js.t Js.prop
  (** {% <p>The title to be displayed by a call to <a href="#!/api/Ext.window.MessageBox-method-wait" rel="Ext.window.MessageBox-method-wait" class="docClass">Ext.window.MessageBox.wait</a> during the time the action is being
processed.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method _CLIENT_INVALID : Js.js_string Js.t Js.prop
  (** {% <p>Failure type returned when client side validation of the Form fails thus aborting a submit action. Client
side validation is performed unless <a href="#!/api/Ext.form.action.Submit-cfg-clientValidation" rel="Ext.form.action.Submit-cfg-clientValidation" class="docClass">Ext.form.action.Submit.clientValidation</a> is explicitly set to
false.</p> %}
    
    Defaults to: ['client']
    *)
  method _CONNECT_FAILURE : Js.js_string Js.t Js.prop
  (** {% <p>Failure type returned when a communication error happens when attempting to send a request to the remote
server. The <a href="#!/api/Ext.form.action.Action-property-response" rel="Ext.form.action.Action-property-response" class="docClass">response</a> may be examined to provide further information.</p> %}
    
    Defaults to: ['connect']
    *)
  method _LOAD_FAILURE : Js.js_string Js.t Js.prop
  (** {% <p>Failure type returned when the response's <code>success</code> property is set to false, or no field values are returned
in the response's data property.</p> %}
    
    Defaults to: ['load']
    *)
  method _SERVER_INVALID : Js.js_string Js.t Js.prop
  (** {% <p>Failure type returned when server side processing fails and the <a href="#!/api/Ext.form.action.Action-property-result" rel="Ext.form.action.Action-property-result" class="docClass">result</a>'s <code>success</code> property is set to
false.</p>

<p>In the case of a form submission, field-specific error messages may be returned in the <a href="#!/api/Ext.form.action.Action-property-result" rel="Ext.form.action.Action-property-result" class="docClass">result</a>'s
errors property.</p> %}
    
    Defaults to: ['server']
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

