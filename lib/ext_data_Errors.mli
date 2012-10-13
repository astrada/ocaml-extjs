(** Wraps a collection of validation error responses a ...
  
  {% <p>Wraps a collection of validation error responses and provides convenient functions for
accessing and errors for specific fields.</p>




<p>Usually this class does not need to be instantiated directly - instances are instead created
automatically when <a href="#!/api/Ext.data.Model-method-validate" rel="Ext.data.Model-method-validate" class="docClass">validate</a> on a model instance:</p>




<pre><code>//validate some existing model instance - in this case it returned 2 failures messages
var errors = myModel.validate();

errors.isValid(); //false

errors.length; //2
errors.getByField('name');  // [{field: 'name',  message: 'must be present'}]
errors.getByField('title'); // [{field: 'title', message: 'is too short'}]
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_AbstractMixedCollection.t
  inherit Ext_util_MixedCollection.t
  
  method getByField : Js.js_string Js.t -> 'a Js.t Js.js_array Js.t Js.meth
  (** {% <p>Returns all of the errors for the given field</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p>The field to get errors for</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t Js.js_array Js.t]
    {% <p>All errors for the given field</p> %}
    }
    }
    *)
  method isValid : bool Js.t Js.meth
  (** {% <p>Returns true if there are no errors in the collection</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_AbstractMixedCollection.configs
  inherit Ext_util_MixedCollection.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_AbstractMixedCollection.events
  inherit Ext_util_MixedCollection.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_AbstractMixedCollection.statics
  inherit Ext_util_MixedCollection.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

