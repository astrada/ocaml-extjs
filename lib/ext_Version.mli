(** A utility class that wrap around a string version ...
  
  {% <p>A utility class that wrap around a string version number and provide convenient
method to perform comparison. See also: <a href="#!/api/Ext.Version-static-method-compare" rel="Ext.Version-static-method-compare" class="docClass">compare</a>. Example:</p>

<pre><code>var version = new <a href="#!/api/Ext.Version" rel="Ext.Version" class="docClass">Ext.Version</a>('1.0.2beta');
console.log("Version is " + version); // Version is 1.0.2beta

console.log(version.getMajor()); // 1
console.log(version.getMinor()); // 0
console.log(version.getPatch()); // 2
console.log(version.getBuild()); // 0
console.log(version.getRelease()); // beta

console.log(version.isGreaterThan('1.0.1')); // True
console.log(version.isGreaterThan('1.0.2alpha')); // True
console.log(version.isGreaterThan('1.0.2RC')); // False
console.log(version.isGreaterThan('1.0.2')); // False
console.log(version.isLessThan('1.0.2')); // True

console.log(version.match(1.0)); // True
console.log(version.match('1.0.2')); // True
</code></pre> %}
  *)

class type t =
object('self)
  
  method equals : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version equals to the supplied argument</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version equals to the target, false otherwise</p> %}
    }
    }
    *)
  method getBuild : Js.number Js.t Js.meth
  (** {% <p>Returns the build component value</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>build</p> %}
    }
    }
    *)
  method getMajor : Js.number Js.t Js.meth
  (** {% <p>Returns the major component value</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>major</p> %}
    }
    }
    *)
  method getMinor : Js.number Js.t Js.meth
  (** {% <p>Returns the minor component value</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>minor</p> %}
    }
    }
    *)
  method getPatch : Js.number Js.t Js.meth
  (** {% <p>Returns the patch component value</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>patch</p> %}
    }
    }
    *)
  method getRelease : Js.number Js.t Js.meth
  (** {% <p>Returns the release component value</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>release</p> %}
    }
    }
    *)
  method getShortVersion : Js.js_string Js.t Js.meth
  (** {% <p>Returns shortVersion version without dots and release</p> %}
    *)
  method gt : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Convenient alias to <a href="#!/api/Ext.Version-method-isGreaterThan" rel="Ext.Version-method-isGreaterThan" class="docClass">isGreaterThan</a></p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    }
    }
    *)
  method gtEq : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Convenient alias to <a href="#!/api/Ext.Version-method-isGreaterThanOrEqual" rel="Ext.Version-method-isGreaterThanOrEqual" class="docClass">isGreaterThanOrEqual</a></p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    }
    }
    *)
  method isGreaterThan : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version if greater than the supplied argument</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version if greater than the target, false otherwise</p> %}
    }
    }
    *)
  method isGreaterThanOrEqual : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version if greater than or equal to the supplied argument</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version if greater than or equal to the target, false otherwise</p> %}
    }
    }
    *)
  method isLessThan : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version if smaller than the supplied argument</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version if smaller than the target, false otherwise</p> %}
    }
    }
    *)
  method isLessThanOrEqual : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version if less than or equal to the supplied argument</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version if less than or equal to the target, false otherwise</p> %}
    }
    }
    *)
  method lt : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Convenient alias to <a href="#!/api/Ext.Version-method-isLessThan" rel="Ext.Version-method-isLessThan" class="docClass">isLessThan</a></p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    }
    }
    *)
  method ltEq : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Convenient alias to <a href="#!/api/Ext.Version-method-isLessThanOrEqual" rel="Ext.Version-method-isLessThanOrEqual" class="docClass">isLessThanOrEqual</a></p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    }
    }
    *)
  method _match : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether this version matches the supplied argument. Example:</p>

<pre><code>var version = new <a href="#!/api/Ext.Version" rel="Ext.Version" class="docClass">Ext.Version</a>('1.0.2beta');
console.log(version.match(1)); // True
console.log(version.match(1.0)); // True
console.log(version.match('1.0.2')); // True
console.log(version.match('1.0.2RC')); // False
</code></pre> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The version to compare with</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this version matches the target, false otherwise</p> %}
    }
    }
    *)
  method toArray : Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Returns this format: [major, minor, patch, build, release]. Useful for comparison</p> %}
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
  
  method compare : Js.js_string Js.t -> Js.js_string Js.t -> Js.number Js.t
    Js.meth
  (** {% <p>Compare 2 specified versions, starting from left to right. If a part contains special version strings,
they are handled in the following order:
'dev' &lt; 'alpha' = 'a' &lt; 'beta' = 'b' &lt; 'RC' = 'rc' &lt; '#' &lt; 'pl' = 'p' &lt; 'anything else'</p> %}
    
    {b Parameters}:
    {ul {- current: [Js.js_string Js.t]
    {% <p>The current version to compare to</p> %}
    }
    {- target: [Js.js_string Js.t]
    {% <p>The target version to compare to</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>Returns -1 if the current version is smaller than the target version, 1 if greater, and 0 if they're equivalent</p> %}
    }
    }
    *)
  method getComponentValue : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Converts a version component to a comparable value</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t] {% <p>The value to convert</p> %}
    }
    }
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val compare : Js.js_string Js.t -> Js.js_string Js.t -> Js.number Js.t
(** See method [statics.compare] *)

val getComponentValue : _ Js.t -> _ Js.t
(** See method [statics.getComponentValue] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

