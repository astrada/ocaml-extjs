(**
  {% <p>Static flag that can be used to globally disable error reporting to the browser if set to true
(defaults to false). Note that if you ignore Ext errors it's likely that some other code may fail
and throw a native JavaScript error thereafter, so use with caution. In most cases it will probably
be preferable to supply a custom error <a href="#!/api/Ext.Error-static-method-handle" rel="Ext.Error-static-method-handle" class="docClass">handling</a> function instead.</p>

<p>Example usage:</p>

<pre><code><a href="#!/api/Ext.Error-static-property-ignore" rel="Ext.Error-static-property-ignore" class="docClass">Ext.Error.ignore</a> = true;
</code></pre>
 %}
*)

val application : config:'a Js.t -> 'b
val require : expressions:string array -> ?fn:(unit -> unit) -> unit -> 'a
val create : name:string -> args:'a Js.t -> 'b
val define :
  className:string -> data:'a Js.t -> ?createdFn:(unit -> unit) -> unit -> 'b
val widget : name:string -> 'a
