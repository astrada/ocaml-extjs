(** Base class for all axis classes. ...
  
  {% <p>Base class for all axis classes.</p> %} *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method fields : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>The fields of model to bind to this axis.</p>

<p>For example if you have a data set of lap times per car, each having the fields:
<code>'carName'</code>, <code>'avgSpeed'</code>, <code>'maxSpeed'</code>. Then you might want to show the data on chart
with <code>['carName']</code> on Name axis and <code>['avgSpeed', 'maxSpeed']</code> on Speed axis.</p> %}
    *)
  method label : Ext_chart_Label.t Js.t Js.prop
  (** {% <p>The config for chart label.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

