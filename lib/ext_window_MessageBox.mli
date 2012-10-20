(** Utility class for generating different styles of m ...
  
  {% <p>Utility class for generating different styles of message boxes.  The singleton instance, <a href="#!/api/Ext.MessageBox" rel="Ext.MessageBox" class="docClass">Ext.MessageBox</a>
alias <code><a href="#!/api/Ext.MessageBox" rel="Ext.MessageBox" class="docClass">Ext.Msg</a></code> can also be used.</p>

<p>Note that a MessageBox is asynchronous.  Unlike a regular JavaScript <code>alert</code> (which will halt
browser execution), showing a MessageBox will not cause the code to stop.  For this reason, if you have code
that should only run <em>after</em> some user feedback from the MessageBox, you must use a callback function
(see the <code>function</code> parameter for <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> for more details).</p>

<p>Basic alert</p>

<pre class='inline-example '><code><a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>('Status', 'Changes saved successfully.');
</code></pre>

<p>Prompt for user data and process the result using a callback</p>

<pre class='inline-example '><code><a href="#!/api/Ext.MessageBox-method-prompt" rel="Ext.MessageBox-method-prompt" class="docClass">Ext.Msg.prompt</a>('Name', 'Please enter your name:', function(btn, text){
    if (btn == 'ok'){
        // process text value and close...
    }
});
</code></pre>

<p>Show a dialog using config options</p>

<pre class='inline-example '><code><a href="#!/api/Ext.MessageBox-event-show" rel="Ext.MessageBox-event-show" class="docClass">Ext.Msg.show</a>({
     title:'Save Changes?',
     msg: 'You are closing a tab that has unsaved changes. Would you like to save your changes?',
     buttons: <a href="#!/api/Ext.MessageBox-property-YESNOCANCEL" rel="Ext.MessageBox-property-YESNOCANCEL" class="docClass">Ext.Msg.YESNOCANCEL</a>,
     icon: <a href="#!/api/Ext.MessageBox-property-QUESTION" rel="Ext.MessageBox-property-QUESTION" class="docClass">Ext.Msg.QUESTION</a>
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
  inherit Ext_window_Window.t
  
  method _CANCEL : Js.number Js.t Js.prop
  (** {% <p>Button config that displays a single Cancel button</p> %}
    
    Defaults to: [8]
    *)
  method _ERROR : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class that provides the ERROR icon image</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'message-box-error']
    *)
  method _INFO : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class that provides the INFO icon image</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'message-box-info']
    *)
  method _NO : Js.number Js.t Js.prop
  (** {% <p>Button config that displays a single No button</p> %}
    
    Defaults to: [4]
    *)
  method _OK : Js.number Js.t Js.prop
  (** {% <p>Button config that displays a single OK button</p> %}
    
    Defaults to: [1]
    *)
  method _OKCANCEL : Js.number Js.t Js.prop
  (** {% <p>Button config that displays OK and Cancel buttons</p> %}
    
    Defaults to: [9]
    *)
  method _QUESTION : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class that provides the QUESTION icon image</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'message-box-question']
    *)
  method _WARNING : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class that provides the WARNING icon image</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'message-box-warning']
    *)
  method _YES : Js.number Js.t Js.prop
  (** {% <p>Button config that displays a single Yes button</p> %}
    
    Defaults to: [2]
    *)
  method _YESNO : Js.number Js.t Js.prop
  (** {% <p>Button config that displays Yes and No buttons</p> %}
    
    Defaults to: [6]
    *)
  method _YESNOCANCEL : Js.number Js.t Js.prop
  (** {% <p>Button config that displays Yes, No and Cancel buttons</p> %}
    
    Defaults to: [14]
    *)
  method buttonText : 'a Js.t Js.prop
  (** {% <p>An object containing the default button text strings that can be overriden for localized language support.
Supported properties are: ok, cancel, yes and no.  Generally you should include a locale-specific
resource file for handling language support across the framework.
Customize the default text like so:</p>

<pre><code>Ext.window.MessageBox.buttonText.yes = "oui"; //french
</code></pre> %}
    
    Defaults to: [{ok: 'OK', yes: 'Yes', no: 'No', cancel: 'Cancel'}]
    *)
  method defaultTextHeight : Js.number Js.t Js.prop
  (** {% <p>The default height in pixels of the message box's multiline textarea if displayed.</p> %}
    
    Defaults to: [75]
    *)
  method minProgressWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum width in pixels of the message box if it is a progress-style dialog.  This is useful
for setting a different minimum width than text-only dialogs may need.</p> %}
    
    Defaults to: [250]
    *)
  method minPromptWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum width in pixels of the message box if it is a prompt dialog.  This is useful
for setting a different minimum width than text-only dialogs may need.</p> %}
    
    Defaults to: [250]
    *)
  method alert : Js.js_string Js.t -> Js.js_string Js.t ->
    'a Js.callback Js.optdef -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Displays a standard read-only message box with an OK button (comparable to the basic JavaScript alert prompt).
If a callback function is passed it will be called after the user clicks the button, and the
id of the button that was clicked will be passed as the only parameter to the callback
(could also be the top-right close button, which will always report as "cancel").</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    {% <p>The title bar text</p> %}
    }
    {- msg: [Js.js_string Js.t]
    {% <p>The message box body text</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>The callback function invoked after the message box is closed.
See <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> method for details.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.</p> %}
     Defaults to: window
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method confirm : Js.js_string Js.t -> Js.js_string Js.t ->
    'a Js.callback Js.optdef -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Displays a confirmation message box with Yes and No buttons (comparable to JavaScript's confirm).
If a callback function is passed it will be called after the user clicks either button,
and the id of the button that was clicked will be passed as the only parameter to the callback
(could also be the top-right close button, which will always report as "cancel").</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    {% <p>The title bar text</p> %}
    }
    {- msg: [Js.js_string Js.t]
    {% <p>The message box body text</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>The callback function invoked after the message box is closed.
See <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> method for details.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.</p> %}
     Defaults to: window
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method hide_component : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Hides this Component, setting it to invisible using the configured <a href="#!/api/Ext.window.MessageBox-cfg-hideMode" rel="Ext.window.MessageBox-cfg-hideMode" class="docClass">hideMode</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    {% <p><strong>only valid for <a href="#!/api/Ext.window.MessageBox" rel="Ext.window.MessageBox" class="docClass">floating</a> Components
such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have
been configured with <code>floating: true</code>.</strong>. The target to which the Component should animate while hiding.</p> %}
     Defaults to: null
    }
    {- callback: ['a Js.callback]
    {% <p>A callback function to call after the Component is hidden.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.
Defaults to this Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
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
  method onShow : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.window.MessageBox-event-show" rel="Ext.window.MessageBox-event-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    }
    {- callback: ['a Js.callback]
    }
    {- scope: ['a Js.t]
    }
    }
    *)
  method progress : Js.js_string Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Displays a message box with a progress bar.</p>

<p>You are responsible for updating the progress bar as needed via <a href="#!/api/Ext.window.MessageBox-method-updateProgress" rel="Ext.window.MessageBox-method-updateProgress" class="docClass">updateProgress</a>
and closing the message box when the process is complete.</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    {% <p>The title bar text</p> %}
    }
    {- msg: [Js.js_string Js.t]
    {% <p>The message box body text</p> %}
    }
    {- progressText: [Js.js_string Js.t]
    {% <p>The text to display inside the progress bar</p> %}
     Defaults to: ''
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method prompt : Js.js_string Js.t -> Js.js_string Js.t ->
    'a Js.callback Js.optdef -> 'b Js.t Js.optdef -> 'c Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Displays a message box with OK and Cancel buttons prompting the user to enter some text (comparable to JavaScript's prompt).
The prompt can be a single-line or multi-line textbox.  If a callback function is passed it will be called after the user
clicks either button, and the id of the button that was clicked (could also be the top-right
close button, which will always report as "cancel") and the text that was entered will be passed as the two parameters to the callback.</p> %}
    
    {b Parameters}:
    {ul {- title: [Js.js_string Js.t]
    {% <p>The title bar text</p> %}
    }
    {- msg: [Js.js_string Js.t]
    {% <p>The message box body text</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>The callback function invoked after the message box is closed.
See <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> method for details.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.</p> %}
     Defaults to: window
    }
    {- multiline: ['a Js.t]
    {% <p>True to create a multiline textbox using the defaultTextHeight
property, or the height in pixels to create the textbox/</p> %}
     Defaults to: false
    }
    {- value: [Js.js_string Js.t]
    {% <p>Default value of the text input element</p> %}
     Defaults to: ''
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setIcon_chainable : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds the specified icon to the dialog.  By default, the class 'x-messagebox-icon' is applied for default
styling, and the class passed in is expected to supply the background image url. Pass in empty string ('')
to clear any existing icon. This method must be called before the MessageBox is shown.
The following built-in icon classes are supported, but you can also pass in a custom class name:</p>

<pre><code><a href="#!/api/Ext.window.MessageBox-property-INFO" rel="Ext.window.MessageBox-property-INFO" class="docClass">Ext.window.MessageBox.INFO</a>
<a href="#!/api/Ext.window.MessageBox-property-WARNING" rel="Ext.window.MessageBox-property-WARNING" class="docClass">Ext.window.MessageBox.WARNING</a>
<a href="#!/api/Ext.window.MessageBox-property-QUESTION" rel="Ext.window.MessageBox-property-QUESTION" class="docClass">Ext.window.MessageBox.QUESTION</a>
<a href="#!/api/Ext.window.MessageBox-property-ERROR" rel="Ext.window.MessageBox-property-ERROR" class="docClass">Ext.window.MessageBox.ERROR</a>
</code></pre> %}
    
    {b Parameters}:
    {ul {- icon: [Js.js_string Js.t]
    {% <p>A CSS classname specifying the icon's background image url, or empty string to clear the icon</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method show_messagebox : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Displays a new message box, or reinitializes an existing message box, based on the config options passed in. All
display functions (e.g. prompt, alert, etc.) on MessageBox call this function internally, although those calls
are basic shortcuts and do not support all of the config options allowed here.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.MessageBox-event-show" rel="Ext.MessageBox-event-show" class="docClass">Ext.Msg.show</a>({
    title: 'Address',
    msg: 'Please enter your address:',
    width: 300,
    buttons: <a href="#!/api/Ext.MessageBox-property-OKCANCEL" rel="Ext.MessageBox-property-OKCANCEL" class="docClass">Ext.Msg.OKCANCEL</a>,
    multiline: true,
    fn: saveAddress,
    animateTarget: 'addAddressBtn',
    icon: <a href="#!/api/Ext.window.MessageBox-property-INFO" rel="Ext.window.MessageBox-property-INFO" class="docClass">Ext.window.MessageBox.INFO</a>
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- config: ['a Js.t]
    {% <p>The following config options are supported:</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method updateProgress : Js.number Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Updates a progress-style message box's text and progress bar. Only relevant on message boxes
initiated via <a href="#!/api/Ext.window.MessageBox-method-progress" rel="Ext.window.MessageBox-method-progress" class="docClass">progress</a> or <a href="#!/api/Ext.window.MessageBox-method-wait" rel="Ext.window.MessageBox-method-wait" class="docClass">wait</a>,
or by calling <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> with progress: true.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.number Js.t]
    {% <p>Any number between 0 and 1 (e.g., .5)</p> %}
     Defaults to: 0
    }
    {- progressText: [Js.js_string Js.t]
    {% <p>The progress text to display inside the progress bar.</p> %}
     Defaults to: ''
    }
    {- msg: [Js.js_string Js.t]
    {% <p>The message box's body text is replaced with the specified string (defaults to undefined
so that any existing body text will not get overwritten by default unless a new value is passed in)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method wait : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Displays a message box with an infinitely auto-updating progress bar.  This can be used to block user
interaction while waiting for a long-running process to complete that does not have defined intervals.
You are responsible for closing the message box when the process is complete.</p> %}
    
    {b Parameters}:
    {ul {- msg: [Js.js_string Js.t]
    {% <p>The message box body text</p> %}
    }
    {- title: [Js.js_string Js.t]
    {% <p>The title bar text</p> %}
    }
    {- config: ['a Js.t]
    {% <p>A <a href="#!/api/Ext.ProgressBar-method-wait" rel="Ext.ProgressBar-method-wait" class="docClass">Ext.ProgressBar.wait</a> config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_window_MessageBox.t Js.t] {% <p>this</p> %}
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
  inherit Ext_window_Window.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onShow : ('self Js.t, 'a Js.t Js.optdef -> 'b Js.callback Js.optdef
    -> 'c Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  method closeAction : Js.js_string Js.t Js.prop
  (** {% <p>The action to take when the close header tool is clicked:</p>

<ul>
<li><p><strong><code>'<a href="#!/api/Ext.window.MessageBox" rel="Ext.window.MessageBox" class="docClass">destroy</a>'</code></strong> :</p>

<p><a href="#!/api/Ext.window.MessageBox-method-remove" rel="Ext.window.MessageBox-method-remove" class="docClass">remove</a> the window from the DOM and <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">destroy</a> it and all descendant
Components. The window will <strong>not</strong> be available to be redisplayed via the <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> method.</p></li>
<li><p><strong><code>'<a href="#!/api/Ext.window.MessageBox-method-hide" rel="Ext.window.MessageBox-method-hide" class="docClass">hide</a>'</code></strong> :</p>

<p><a href="#!/api/Ext.window.MessageBox-method-hide" rel="Ext.window.MessageBox-method-hide" class="docClass">hide</a> the window by setting visibility to hidden and applying negative offsets. The window will be
available to be redisplayed via the <a href="#!/api/Ext.window.MessageBox-method-show" rel="Ext.window.MessageBox-method-show" class="docClass">show</a> method.</p></li>
</ul>


<p><strong>Note:</strong> This behavior has changed! setting <em>does</em> affect the <a href="#!/api/Ext.window.MessageBox-method-close" rel="Ext.window.MessageBox-method-close" class="docClass">close</a> method which will invoke the
approriate closeAction.</p> %}
    
    Defaults to: ['hide']
    *)
  method cls : Js.js_string Js.t Js.prop
  (** {% <p>An optional extra CSS class that will be added to this component's Element. This can be useful
for adding customized styles to the component or any of its children using standard CSS rules.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'message-box']
    *)
  method constrain : bool Js.t Js.prop
  (** {% <p>True to constrain the window within its containing element, false to allow it to fall outside of its containing
element. By default the window will be rendered to document.body. To render and constrain the window within
another element specify <a href="#!/api/Ext.window.MessageBox-cfg-renderTo" rel="Ext.window.MessageBox-cfg-renderTo" class="docClass">renderTo</a>. Optionally the header only can be constrained
using <a href="#!/api/Ext.window.MessageBox-cfg-constrainHeader" rel="Ext.window.MessageBox-cfg-constrainHeader" class="docClass">constrainHeader</a>.</p> %}
    
    Defaults to: [true]
    *)
  method height : Js.number Js.t Js.prop
  (** {% <p>The height of this component in pixels.</p> %}
    
    Defaults to: [500]
    *)
  method hideMode : Js.js_string Js.t Js.prop
  (** {% <p>hide it by offsets. Windows are hidden on render by default.</p>

<p>A String which specifies how this Component's encapsulating DOM element will be hidden. Values may be:</p>

<ul>
<li><code>'display'</code> : The Component will be hidden using the <code>display: none</code> style.</li>
<li><code>'visibility'</code> : The Component will be hidden using the <code>visibility: hidden</code> style.</li>
<li><code>'offsets'</code> : The Component will be hidden by absolutely positioning it out of the visible area of the document.
This is useful when a hidden Component must maintain measurable dimensions. Hiding using <code>display</code> results in a
Component having zero dimensions.</li>
</ul> %}
    
    Defaults to: ['offsets']
    *)
  method layout : 'a Js.t Js.prop
  (** {% <p><strong>Important</strong>: In order for child items to be correctly sized and
positioned, typically a layout manager <strong>must</strong> be specified through
the <code>layout</code> configuration option.</p>

<p>The sizing and positioning of child <a href="#!/api/Ext.window.MessageBox-cfg-items" rel="Ext.window.MessageBox-cfg-items" class="docClass">items</a> is the responsibility of
the Container's layout manager which creates and manages the type of layout
you have in mind.  For example:</p>

<p>If the <a href="#!/api/Ext.window.MessageBox-cfg-layout" rel="Ext.window.MessageBox-cfg-layout" class="docClass">layout</a> configuration is not explicitly specified for
a general purpose container (e.g. Container or Panel) the
<a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used
which does nothing but render child components sequentially into the
Container (no sizing or positioning will be performed in this situation).</p>

<p><strong>layout</strong> may be specified as either as an Object or as a String:</p>

<h1>Specify as an Object</h1>

<p>Example usage:</p>

<pre><code>layout: {
    type: 'vbox',
    align: 'left'
}
</code></pre>

<ul>
<li><p><strong>type</strong></p>

<p>The layout type to be used for this container.  If not specified,
a default <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Ext.layout.container.Auto</a> will be created and used.</p>

<p>Valid layout <code>type</code> values are:</p>

<ul>
<li><a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> - <strong>Default</strong></li>
<li><a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">card</a></li>
<li><a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">fit</a></li>
<li><a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">hbox</a></li>
<li><a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">vbox</a></li>
<li><a href="#!/api/Ext.layout.container.Anchor" rel="Ext.layout.container.Anchor" class="docClass">anchor</a></li>
<li><a href="#!/api/Ext.layout.container.Table" rel="Ext.layout.container.Table" class="docClass">table</a></li>
</ul>
</li>
<li><p>Layout specific configuration properties</p>

<p>Additional layout specific configuration properties may also be
specified. For complete details regarding the valid config options for
each layout type, see the layout class corresponding to the <code>type</code>
specified.</p></li>
</ul>


<h1>Specify as a String</h1>

<p>Example usage:</p>

<pre><code>layout: 'vbox'
</code></pre>

<ul>
<li><p><strong>layout</strong></p>

<p>The layout <code>type</code> to be used for this container (see list
of valid layout type values above).</p>

<p>Additional layout specific configuration properties. For complete
details regarding the valid config options for each layout type, see the
layout class corresponding to the <code>layout</code> specified.</p></li>
</ul>


<h1>Configuring the default layout type</h1>

<pre><code>If a certain Container class has a default layout (For example a <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a>
with a default `Box` layout), then to simply configure the default layout,
use an object, but without the `type` property:


xtype: 'toolbar',
layout: {
    pack: 'center'
}
</code></pre> %}
    
    Defaults to: [{type: 'vbox', align: 'stretch'}]
    *)
  method maxHeight : Js.number Js.t Js.prop
  (** {% <p>The maximum value in pixels which this Component will set its height to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [500]
    *)
  method maxWidth : Js.number Js.t Js.prop
  (** {% <p>The maximum value in pixels which this Component will set its width to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [600]
    *)
  method minHeight : Js.number Js.t Js.prop
  (** {% <p>The minimum value in pixels which this Component will set its height to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [110]
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum value in pixels which this Component will set its width to.</p>

<p><strong>Warning:</strong> This will override any size management applied by layout managers.</p> %}
    
    Defaults to: [250]
    *)
  method resizable_bool : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to allow user resizing at each edge and corner of the window, false to disable resizing.</p>

<p>This may also be specified as a config object to <a href="#!/api/Ext.resizer.Resizer" rel="Ext.resizer.Resizer" class="docClass">Ext.resizer.Resizer</a></p> %}
    
    Defaults to: [false]
    *)
  method title : Js.js_string Js.t Js.prop
  (** {% <p>The title text to be used to display in the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">panel header</a>. When a
<code>title</code> is specified the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Ext.panel.Header</a> will automatically be created and displayed unless
<a href="#!/api/Ext.window.MessageBox-cfg-header" rel="Ext.window.MessageBox-cfg-header" class="docClass">header</a> is set to <code>false</code>.</p> %}
    
    Defaults to: ['&#160;']
    *)
  method width : Js.number Js.t Js.prop
  (** {% <p>The width of this component in pixels.</p> %}
    
    Defaults to: [600]
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
  inherit Ext_window_Window.events
  
  
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
  inherit Ext_window_Window.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

