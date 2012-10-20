(** Provides a mechanism to run one or more operations ...
  
  {% <p>Provides a mechanism to run one or more <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">operations</a> in a given order. Fires the 'operationcomplete' event
after the completion of each Operation, and the 'complete' event when all Operations have been successfully executed. Fires an 'exception'
event if any of the Operations encounter an exception.</p>




<p>Usually these are only used internally by <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Ext.data.proxy.Proxy</a> classes</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method current : Js.number Js.t Js.prop
  (** {% <p>The index of the current operation being executed. Read only</p> %}
    *)
  method exceptions : Ext_data_Operation.t Js.js_array Js.t Js.prop
  (** {% <p>Ordered array of operations that raised an exception during the most recent
batch execution and did not successfully complete</p> %}
    *)
  method hasException : bool Js.t Js.prop
  (** {% <p>True if this batch has encountered an exception. This is cleared at the start of each operation. Read only</p> %}
    
    Defaults to: [false]
    *)
  method isComplete : bool Js.t Js.prop
  (** {% <p>True if this batch has been executed completely. Read only</p> %}
    
    Defaults to: [false]
    *)
  method isRunning : bool Js.t Js.prop
  (** {% <p>True if the batch is currently running. Read only</p> %}
    
    Defaults to: [false]
    *)
  method operations : Ext_data_Operation.t Js.js_array Js.t Js.prop
  (** {% <p>Ordered array of operations that will be executed by this batch</p> %}
    *)
  method total : Js.number Js.t Js.prop
  (** {% <p>The total number of operations in this batch. Read only</p> %}
    
    Defaults to: [0]
    *)
  method add : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds a new operation to this batch at the end of the <a href="#!/api/Ext.data.Batch-property-operations" rel="Ext.data.Batch-property-operations" class="docClass">operations</a> array</p> %}
    
    {b Parameters}:
    {ul {- operation: [_ Js.t]
    {% <p>The <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a> object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method pause : 'self Js.t Js.meth
  (** {% <p>Pauses execution of the batch, but does not cancel the current operation</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method retry : 'self Js.t Js.meth
  (** {% <p>Kicks off execution of the batch, continuing from the current operation. This is intended
for restarting a <a href="#!/api/Ext.data.Batch-method-pause" rel="Ext.data.Batch-method-pause" class="docClass">paused</a> batch after an exception, and the operation that raised
the exception will now be retried. The batch will then continue with its normal processing until
all operations are complete or another exception is encountered.</p>

<p>Note that if the batch is already running any call to retry will be ignored.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method runOperation : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Executes an operation by its numeric index in the <a href="#!/api/Ext.data.Batch-property-operations" rel="Ext.data.Batch-property-operations" class="docClass">operations</a> array</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The operation index to run</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method start : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Kicks off execution of the batch, continuing from the next operation if the previous
operation encountered an exception, or if execution was paused. Use this method to start
the batch for the first time or to restart a paused batch by skipping the current
unsuccessful operation.</p>

<p>To retry processing the current operation before continuing to the rest of the batch (e.g.
because you explicitly handled the operation's exception), call <a href="#!/api/Ext.data.Batch-method-retry" rel="Ext.data.Batch-method-retry" class="docClass">retry</a> instead.</p>

<p>Note that if the batch is already running any call to start will be ignored.</p> %}
    
    {b Parameters}:
    {ul {- index: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method autoStart : bool Js.t Js.prop
  (** {% <p>True to immediately start processing the batch as soon as it is constructed (defaults to false)</p> %}
    
    Defaults to: [false]
    *)
  method pauseOnException : bool Js.t Js.prop
  (** {% <p>True to pause the execution of the batch if any operation encounters an exception
(defaults to false). If you set this to true you are responsible for implementing the appropriate
handling logic and restarting or discarding the batch as needed. There are different ways you could
do this, e.g. by handling the batch's <a href="#!/api/Ext.data.Batch-event-exception" rel="Ext.data.Batch-event-exception" class="docClass">exception</a> event directly, or perhaps by overriding
<a href="#!/api/Ext.data.AbstractStore" rel="Ext.data.AbstractStore" class="docClass">onBatchException</a> at the store level. If you do pause
and attempt to handle the exception you can call <a href="#!/api/Ext.data.Batch-method-retry" rel="Ext.data.Batch-method-retry" class="docClass">retry</a> to process the same operation again.</p>

<p>Note that <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">operations</a> are atomic, so any operations that may have succeeded
prior to an exception (and up until pausing the batch) will be finalized at the server level and will
not be automatically reversible. Any transactional / rollback behavior that might be desired would have
to be implemented at the application level. Pausing on exception will likely be most beneficial when
used in coordination with such a scheme, where an exception might actually affect subsequent operations
in the same batch and so should be handled before continuing with the next operation.</p>

<p>If you have not implemented transactional operation handling then this option should typically be left
to the default of false (e.g. process as many operations as possible, and handle any exceptions
asynchronously without holding up the rest of the batch).</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method complete : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when all operations of this batch have been completed</p> %}
    
    {b Parameters}:
    {ul {- batch: [Ext_data_Batch.t Js.t]
    {% <p>The batch object</p> %}
    }
    {- operation: [_ Js.t]
    {% <p>The last operation that was executed</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _exception : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when a operation encountered an exception</p> %}
    
    {b Parameters}:
    {ul {- batch: [Ext_data_Batch.t Js.t]
    {% <p>The batch object</p> %}
    }
    {- operation: [_ Js.t]
    {% <p>The operation that encountered the exception</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method operationcomplete : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when each operation of the batch completes</p> %}
    
    {b Parameters}:
    {ul {- batch: [Ext_data_Batch.t Js.t]
    {% <p>The batch object</p> %}
    }
    {- operation: [_ Js.t]
    {% <p>The operation that just completed</p> %}
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
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

