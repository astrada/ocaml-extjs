(** A wrapper class for the native JavaScript Error ob ...
  
  {% <p>A wrapper class for the native JavaScript Error object that adds a few useful capabilities for handling
errors in an Ext application. When you use <a href="#!/api/Ext.Error" rel="Ext.Error" class="docClass">Ext.Error</a> to <a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">raise</a> an error from within any class that
uses the Ext 4 class system, the Error class can automatically add the source class and method from which
the error was raised. It also includes logic to automatically log the eroor to the console, if available,
with additional metadata about the error. In all cases, the error will always be thrown at the end so that
execution will halt.</p>

<p><a href="#!/api/Ext.Error" rel="Ext.Error" class="docClass">Ext.Error</a> also offers a global error <a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">handling</a> method that can be overridden in order to
handle application-wide errors in a single spot. You can optionally <a href="#!/api/Ext.Error-static-property-ignore" rel="Ext.Error-static-property-ignore" class="docClass">ignore</a> errors altogether,
although in a real application it's usually a better idea to override the handling function and perform
logging or some other method of reporting the errors in a way that is meaningful to the application.</p>

<p>At its simplest you can simply raise an error as a simple string from within any code:</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">Ext.Error.raise</a>('Something bad happened!');
</code></pre>

<p>If raised from plain JavaScript code, the error will be logged to the console (if available) and the message
displayed. In most cases however you'll be raising errors from within a class, and it may often be useful to add
additional metadata about the error being raised.  The <a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">raise</a> method can also take a config object.
In this form the <code>msg</code> attribute becomes the error description, and any other data added to the config gets
added to the error object and, if the console is available, logged to the console for inspection.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.Foo', {
    doSomething: function(option){
        if (someCondition === false) {
            <a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">Ext.Error.raise</a>({
                msg: 'You cannot do that!',
                option: option,   // whatever was passed into the method
                'error code': 100 // other arbitrary info
            });
        }
    }
});
</code></pre>

<p>If a console is available (that supports the <code>console.dir</code> function) you'll see console output like:</p>

<pre><code>An error was raised with the following data:
option:         Object { foo: "bar"}
    foo:        "bar"
error code:     100
msg:            "You cannot do that!"
sourceClass:   "Ext.Foo"
sourceMethod:  "doSomething"

uncaught exception: You cannot do that!
</code></pre>

<p>As you can see, the error will report exactly where it was raised and will include as much information as the
raising code can usefully provide.</p>

<p>If you want to handle all application errors globally you can simply override the static <a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">handle</a> method
and provide whatever handling logic you need. If the method returns true then the error is considered handled
and will not be thrown to the browser. If anything but true is returned then the error will be thrown normally.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">Ext.Error.handle</a> = function(err) {
    if (err.someProperty == 'NotReallyAnError') {
        // maybe log something to the application here if applicable
        return true;
    }
    // any non-true return value (including none) will cause the error to be thrown
}
</code></pre> %}
  *)

class type t =
object('self)
  
  method toString : Js.js_string Js.t Js.meth
  (** {% <p>Provides a custom string representation of the error object. This is an override of the base JavaScript
<code>Object.toString</code> method, which is useful so that when logged to the browser console, an error object will
be displayed with a useful message instead of <code>[object Object]</code>, the default <code>toString</code> result.</p>

<p>The default implementation will include the error message along with the raising class and method, if available,
but this can be overridden with a custom implementation either at the prototype level (for all errors) or on
a particular error instance, if you want to provide a custom description that will show up in the console.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The error message. If raised from within the Ext 4 class system, the error message will also
include the raising class and method names, if available.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  method ignore : bool Js.t Js.prop
  (** {% <p>Static flag that can be used to globally disable error reporting to the browser if set to true
(defaults to false). Note that if you ignore Ext errors it's likely that some other code may fail
and throw a native JavaScript error thereafter, so use with caution. In most cases it will probably
be preferable to supply a custom error <a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">handling</a> function instead.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-property-ignore" rel="Ext.Error-static-property-ignore" class="docClass">Ext.Error.ignore</a> = true;
</code></pre> %}
    
    Defaults to: [false]
    *)
  method notify : bool Js.t Js.prop
  (** {% <p>Static flag that can be used to globally control error notification to the user. Unlike
Ex.Error.ignore, this does not effect exceptions. They are still thrown. This value can be
set to false to disable the alert notification (default is true for IE6 and IE7).</p>

<p>Only the first error will generate an alert. Internally this flag is set to false when the
first error occurs prior to displaying the alert.</p>

<p>This flag is not used in a release build.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-property-notify" rel="Ext.Error-static-property-notify" class="docClass">Ext.Error.notify</a> = false;
</code></pre> %}
    *)
  method handle : 'self Js.t -> unit Js.meth
  (** {% <p>Globally handle any Ext errors that may be raised, optionally providing custom logic to
handle different errors individually. Return true from the function to bypass throwing the
error to the browser, otherwise the error will be thrown and execution will halt.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">Ext.Error.handle</a> = function(err) {
    if (err.someProperty == 'NotReallyAnError') {
        // maybe log something to the application here if applicable
        return true;
    }
    // any non-true return value (including none) will cause the error to be thrown
}
</code></pre> %}
    
    {b Parameters}:
    {ul {- err: [Ext_Error.t Js.t]
    {% <p>The <a href="#!/api/Ext.Error" rel="Ext.Error" class="docClass">Ext.Error</a> object being raised. It will contain any attributes that were originally
raised with it, plus properties about the method and class from which the error originated (if raised from a
class that uses the Ext 4 class system).</p> %}
    }
    }
    *)
  method _raise : 'a Js.t -> unit Js.meth
  (** {% <p>Raise an error that can include additional data and supports automatic console logging if available.
You can pass a string error message or an object with the <code>msg</code> attribute which will be used as the
error message. The object can contain any other name-value attributes (or objects) to be logged
along with the error.</p>

<p>Note that after displaying the error message a JavaScript error will ultimately be thrown so that
execution will halt.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">Ext.Error.raise</a>('A simple string error message');

// or...

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.Foo', {
    doSomething: function(option){
        if (someCondition === false) {
            <a href="#!/api/Ext.Error-static-method-raise" rel="Ext.Error-static-method-raise" class="docClass">Ext.Error.raise</a>({
                msg: 'You cannot do that!',
                option: option,   // whatever was passed into the method
                'error code': 100 // other arbitrary info
            });
        }
    }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- err: ['a Js.t]
    {% <p>The error message string, or an object containing the attribute "msg" that will be
used as the error message. Any other data included in the object will also be logged to the browser console,
if available.</p> %}
    }
    }
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val handle : 'self Js.t -> unit
(** See method [statics.handle] *)

val _raise : 'a Js.t -> unit
(** See method [statics._raise] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

