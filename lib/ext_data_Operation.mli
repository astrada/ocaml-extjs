(** Represents a single read or write operation perfor ...
  
  {% <p>Represents a single read or write operation performed by a <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>. Operation objects are
used to enable communication between Stores and Proxies. Application developers should rarely need to interact with
Operation objects directly.</p>

<p>Several Operations can be batched together in a <a href="#!/api/Ext.data.Batch" rel="Ext.data.Batch" class="docClass">batch</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method actionCommitRecordsRe : Regexp.regexp Js.t Js.prop
  (** {% <p>The RegExp used to categorize actions that require record commits.</p> %}
    
    Defaults to: [/^(?:create|update)$/i]
    *)
  method actionSkipSyncRe : Regexp.regexp Js.t Js.prop
  (** {% <p>The RegExp used to categorize actions that skip local record synchronization. This defaults
to match 'destroy'.</p> %}
    
    Defaults to: [/^destroy$/i]
    *)
  method allowWrite : bool Js.t Js.meth
  (** {% <p>Checks whether this operation should cause writing to occur.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>Whether the operation should cause a write to occur.</p> %}
    }
    }
    *)
  method commitRecords : Ext_data_Model.t Js.js_array Js.t -> unit Js.meth
  (** {% <p>This method is called to commit data to this instance's records given the records in
the server response. This is followed by calling <a href="#!/api/Ext.data.Model-method-commit" rel="Ext.data.Model-method-commit" class="docClass">Ext.data.Model.commit</a> on all
those records (for 'create' and 'update' actions).</p>

<p>If this <a href="#!/api/Ext.data.Operation-cfg-action" rel="Ext.data.Operation-cfg-action" class="docClass">action</a> is 'destroy', any server records are ignored and the
<a href="#!/api/Ext.data.Model-method-commit" rel="Ext.data.Model-method-commit" class="docClass">Ext.data.Model.commit</a> method is not called.</p> %}
    
    {b Parameters}:
    {ul {- serverRecords: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An array of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> objects returned by
the server.</p> %}
    }
    }
    *)
  method getError : 'a Js.t Js.meth
  (** {% <p>Returns the error string or object that was set using <a href="#!/api/Ext.data.Operation-method-setException" rel="Ext.data.Operation-method-setException" class="docClass">setException</a></p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The error object</p> %}
    }
    }
    *)
  method getRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">record</a>s associated with this operation.  For read operations the records as set by the <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a> will be returned (returns <code>null</code> if the proxy has not yet set the records).
For create, update, and destroy operations the operation's initially configured records will be returned, although the proxy may modify these records' data at some point after the operation is initialized.</p> %}
    *)
  method getResultSet : Ext_data_ResultSet.t Js.t Js.meth
  (** {% <p>Returns the ResultSet object (if set by the Proxy). This object will contain the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">model</a>
instances as well as meta data such as number of instances fetched, number available etc</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_ResultSet.t Js.t] {% <p>The ResultSet object</p> %}
    }
    }
    *)
  method hasException : bool Js.t Js.meth
  (** {% <p>Returns true if this Operation encountered an exception (see also <a href="#!/api/Ext.data.Operation-method-getError" rel="Ext.data.Operation-method-getError" class="docClass">getError</a>)</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if there was an exception</p> %}
    }
    }
    *)
  method isComplete : bool Js.t Js.meth
  (** {% <p>Returns true if the Operation has been completed</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the Operation is complete</p> %}
    }
    }
    *)
  method isRunning : bool Js.t Js.meth
  (** {% <p>Returns true if the Operation has been started but has not yet completed.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the Operation is currently running</p> %}
    }
    }
    *)
  method isStarted : bool Js.t Js.meth
  (** {% <p>Returns true if the Operation has been started. Note that the Operation may have started AND completed, see
<a href="#!/api/Ext.data.Operation-method-isRunning" rel="Ext.data.Operation-method-isRunning" class="docClass">isRunning</a> to test if the Operation is currently running.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the Operation has started</p> %}
    }
    }
    *)
  method setCompleted : unit Js.meth
  (** {% <p>Marks the Operation as completed.</p> %}
    *)
  method setException : 'a Js.t Js.optdef -> unit Js.meth
  (** {% <p>Marks the Operation as having experienced an exception. Can be supplied with an option error message/object.</p> %}
    
    {b Parameters}:
    {ul {- error: ['a Js.t] {% <p>error string/object</p> %}
    }
    }
    *)
  method setStarted : unit Js.meth
  (** {% <p>Marks the Operation as started.</p> %}
    *)
  method setSuccessful : unit Js.meth
  (** {% <p>Marks the Operation as successful.</p> %}
    *)
  method wasSuccessful : bool Js.t Js.meth
  (** {% <p>Returns true if the Operation has completed and was successful</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if successful</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method action : Js.js_string Js.t Js.prop
  (** {% <p>The action being performed by this Operation. Should be one of 'create', 'read', 'update' or 'destroy'.</p> %}
    *)
  method batch : 'a Js.t Js.prop
  (** {% <p>The batch that this Operation is a part of.</p> %}
    *)
  method callback : 'a Js.callback Js.prop
  (** {% <p>Function to execute when operation completed.</p> %}
    *)
  method filters : Ext_util_Filter.t Js.js_array Js.t Js.prop
  (** {% <p>Optional array of filter objects. Only applies to 'read' actions.</p> %}
    *)
  method groupers : Ext_util_Grouper.t Js.js_array Js.t Js.prop
  (** {% <p>Optional grouping configuration. Only applies to 'read' actions where grouping is desired.</p> %}
    *)
  method limit : Js.number Js.t Js.prop
  (** {% <p>The number of records to load. Used on 'read' actions when paging is being used.</p> %}
    *)
  method params : 'a Js.t Js.prop
  (** {% <p>Parameters to pass along with the request when performing the operation.</p> %}
    *)
  method scope : 'a Js.t Js.prop
  (** {% <p>Scope for the <a href="#!/api/Ext.data.Operation-cfg-callback" rel="Ext.data.Operation-cfg-callback" class="docClass">callback</a> function.</p> %}
    *)
  method sorters : Ext_util_Sorter.t Js.js_array Js.t Js.prop
  (** {% <p>Optional array of sorter objects. Only applies to 'read' actions.</p> %}
    *)
  method start : Js.number Js.t Js.prop
  (** {% <p>The start index (offset), used in paging when running a 'read' action.</p> %}
    *)
  method synchronous : bool Js.t Js.prop
  (** {% <p>True if this Operation is to be executed synchronously. This property is inspected by a
<a href="#!/api/Ext.data.Batch" rel="Ext.data.Batch" class="docClass">Batch</a> to see if a series of Operations can be executed in parallel or not.</p> %}
    
    Defaults to: [true]
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

