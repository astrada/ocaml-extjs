(** Enumeration of all xtypes. ...
  
  {% <p>Enumeration of all xtypes.</p> %} *)

class type t =
object('self)
  
  method actioncolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Action" rel="Ext.grid.column.Action" class="docClass">Ext.grid.column.Action</a>.</p> %}
    
    Defaults to: ['actioncolumn']
    *)
  method booleancolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Boolean" rel="Ext.grid.column.Boolean" class="docClass">Ext.grid.column.Boolean</a>.</p> %}
    
    Defaults to: ['booleancolumn']
    *)
  method boundlist : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.view.BoundList" rel="Ext.view.BoundList" class="docClass">Ext.view.BoundList</a>.</p> %}
    
    Defaults to: ['boundlist']
    *)
  method box : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p> %}
    
    Defaults to: ['box']
    *)
  method button : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>.</p> %}
    
    Defaults to: ['button']
    *)
  method buttongroup : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.container.ButtonGroup" rel="Ext.container.ButtonGroup" class="docClass">Ext.container.ButtonGroup</a>.</p> %}
    
    Defaults to: ['buttongroup']
    *)
  method chart : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.chart.Chart" rel="Ext.chart.Chart" class="docClass">Ext.chart.Chart</a>.</p> %}
    
    Defaults to: ['chart']
    *)
  method checkbox : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Checkbox" rel="Ext.form.field.Checkbox" class="docClass">Ext.form.field.Checkbox</a>.</p> %}
    
    Defaults to: ['checkbox']
    *)
  method checkboxfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Checkbox" rel="Ext.form.field.Checkbox" class="docClass">Ext.form.field.Checkbox</a>.</p> %}
    
    Defaults to: ['checkboxfield']
    *)
  method checkboxgroup : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.CheckboxGroup" rel="Ext.form.CheckboxGroup" class="docClass">Ext.form.CheckboxGroup</a>.</p> %}
    
    Defaults to: ['checkboxgroup']
    *)
  method checkcolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.CheckColumn" rel="Ext.grid.column.CheckColumn" class="docClass">Ext.grid.column.CheckColumn</a>.</p> %}
    
    Defaults to: ['checkcolumn']
    *)
  method colormenu : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.ColorPicker" rel="Ext.menu.ColorPicker" class="docClass">Ext.menu.ColorPicker</a>.</p> %}
    
    Defaults to: ['colormenu']
    *)
  method colorpicker : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.picker.Color" rel="Ext.picker.Color" class="docClass">Ext.picker.Color</a>.</p> %}
    
    Defaults to: ['colorpicker']
    *)
  method combo : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.ComboBox" rel="Ext.form.field.ComboBox" class="docClass">Ext.form.field.ComboBox</a>.</p> %}
    
    Defaults to: ['combo']
    *)
  method combobox : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.ComboBox" rel="Ext.form.field.ComboBox" class="docClass">Ext.form.field.ComboBox</a>.</p> %}
    
    Defaults to: ['combobox']
    *)
  method component : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p> %}
    
    Defaults to: ['component']
    *)
  method container : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>.</p> %}
    
    Defaults to: ['container']
    *)
  method cycle : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.button.Cycle" rel="Ext.button.Cycle" class="docClass">Ext.button.Cycle</a>.</p> %}
    
    Defaults to: ['cycle']
    *)
  method dataview : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">Ext.view.View</a>.</p> %}
    
    Defaults to: ['dataview']
    *)
  method datecolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Date" rel="Ext.grid.column.Date" class="docClass">Ext.grid.column.Date</a>.</p> %}
    
    Defaults to: ['datecolumn']
    *)
  method datefield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Date" rel="Ext.form.field.Date" class="docClass">Ext.form.field.Date</a>.</p> %}
    
    Defaults to: ['datefield']
    *)
  method datemenu : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.DatePicker" rel="Ext.menu.DatePicker" class="docClass">Ext.menu.DatePicker</a>.</p> %}
    
    Defaults to: ['datemenu']
    *)
  method datepicker : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.picker.Date" rel="Ext.picker.Date" class="docClass">Ext.picker.Date</a>.</p> %}
    
    Defaults to: ['datepicker']
    *)
  method displayfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Display" rel="Ext.form.field.Display" class="docClass">Ext.form.field.Display</a>.</p> %}
    
    Defaults to: ['displayfield']
    *)
  method draw : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.draw.Component" rel="Ext.draw.Component" class="docClass">Ext.draw.Component</a>.</p> %}
    
    Defaults to: ['draw']
    *)
  method editor : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.Editor" rel="Ext.Editor" class="docClass">Ext.Editor</a>.</p> %}
    
    Defaults to: ['editor']
    *)
  method field : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">Ext.form.field.Base</a>.</p> %}
    
    Defaults to: ['field']
    *)
  method fieldcontainer : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.FieldContainer" rel="Ext.form.FieldContainer" class="docClass">Ext.form.FieldContainer</a>.</p> %}
    
    Defaults to: ['fieldcontainer']
    *)
  method fieldset : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.FieldSet" rel="Ext.form.FieldSet" class="docClass">Ext.form.FieldSet</a>.</p> %}
    
    Defaults to: ['fieldset']
    *)
  method filebutton : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.FileButton" rel="Ext.form.field.FileButton" class="docClass">Ext.form.field.FileButton</a>.</p> %}
    
    Defaults to: ['filebutton']
    *)
  method filefield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.File" rel="Ext.form.field.File" class="docClass">Ext.form.field.File</a>.</p> %}
    
    Defaults to: ['filefield']
    *)
  method fileuploadfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.File" rel="Ext.form.field.File" class="docClass">Ext.form.field.File</a>.</p> %}
    
    Defaults to: ['fileuploadfield']
    *)
  method flash : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.flash.Component" rel="Ext.flash.Component" class="docClass">Ext.flash.Component</a>.</p> %}
    
    Defaults to: ['flash']
    *)
  method form : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.Panel" rel="Ext.form.Panel" class="docClass">Ext.form.Panel</a>.</p> %}
    
    Defaults to: ['form']
    *)
  method grid : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>.</p> %}
    
    Defaults to: ['grid']
    *)
  method gridcolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Ext.grid.column.Column</a>.</p> %}
    
    Defaults to: ['gridcolumn']
    *)
  method gridpanel : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>.</p> %}
    
    Defaults to: ['gridpanel']
    *)
  method gridview : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.View" rel="Ext.grid.View" class="docClass">Ext.grid.View</a>.</p> %}
    
    Defaults to: ['gridview']
    *)
  method header : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Ext.panel.Header</a>.</p> %}
    
    Defaults to: ['header']
    *)
  method headercontainer : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.header.Container" rel="Ext.grid.header.Container" class="docClass">Ext.grid.header.Container</a>.</p> %}
    
    Defaults to: ['headercontainer']
    *)
  method hidden : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Hidden" rel="Ext.form.field.Hidden" class="docClass">Ext.form.field.Hidden</a>.</p> %}
    
    Defaults to: ['hidden']
    *)
  method hiddenfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Hidden" rel="Ext.form.field.Hidden" class="docClass">Ext.form.field.Hidden</a>.</p> %}
    
    Defaults to: ['hiddenfield']
    *)
  method htmleditor : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.HtmlEditor" rel="Ext.form.field.HtmlEditor" class="docClass">Ext.form.field.HtmlEditor</a>.</p> %}
    
    Defaults to: ['htmleditor']
    *)
  method image : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.Img" rel="Ext.Img" class="docClass">Ext.Img</a>.</p> %}
    
    Defaults to: ['image']
    *)
  method imagecomponent : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.Img" rel="Ext.Img" class="docClass">Ext.Img</a>.</p> %}
    
    Defaults to: ['imagecomponent']
    *)
  method jsonpstore : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.data.JsonPStore" rel="Ext.data.JsonPStore" class="docClass">Ext.data.JsonPStore</a>.</p> %}
    
    Defaults to: ['jsonpstore']
    *)
  method label : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.Label" rel="Ext.form.Label" class="docClass">Ext.form.Label</a>.</p> %}
    
    Defaults to: ['label']
    *)
  method loadmask : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.LoadMask" rel="Ext.LoadMask" class="docClass">Ext.LoadMask</a>.</p> %}
    
    Defaults to: ['loadmask']
    *)
  method menu : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Ext.menu.Menu</a>.</p> %}
    
    Defaults to: ['menu']
    *)
  method menucheckitem : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.CheckItem" rel="Ext.menu.CheckItem" class="docClass">Ext.menu.CheckItem</a>.</p> %}
    
    Defaults to: ['menucheckitem']
    *)
  method menuitem : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.Item" rel="Ext.menu.Item" class="docClass">Ext.menu.Item</a>.</p> %}
    
    Defaults to: ['menuitem']
    *)
  method menuseparator : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.menu.Separator" rel="Ext.menu.Separator" class="docClass">Ext.menu.Separator</a>.</p> %}
    
    Defaults to: ['menuseparator']
    *)
  method messagebox : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.window.MessageBox" rel="Ext.window.MessageBox" class="docClass">Ext.window.MessageBox</a>.</p> %}
    
    Defaults to: ['messagebox']
    *)
  method multislider : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.slider.Multi" rel="Ext.slider.Multi" class="docClass">Ext.slider.Multi</a>.</p> %}
    
    Defaults to: ['multislider']
    *)
  method numbercolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Number" rel="Ext.grid.column.Number" class="docClass">Ext.grid.column.Number</a>.</p> %}
    
    Defaults to: ['numbercolumn']
    *)
  method numberfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Number" rel="Ext.form.field.Number" class="docClass">Ext.form.field.Number</a>.</p> %}
    
    Defaults to: ['numberfield']
    *)
  method pagingtoolbar : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Paging" rel="Ext.toolbar.Paging" class="docClass">Ext.toolbar.Paging</a>.</p> %}
    
    Defaults to: ['pagingtoolbar']
    *)
  method panel : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>.</p> %}
    
    Defaults to: ['panel']
    *)
  method pickerfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Picker" rel="Ext.form.field.Picker" class="docClass">Ext.form.field.Picker</a>.</p> %}
    
    Defaults to: ['pickerfield']
    *)
  method progressbar : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.ProgressBar" rel="Ext.ProgressBar" class="docClass">Ext.ProgressBar</a>.</p> %}
    
    Defaults to: ['progressbar']
    *)
  method propertygrid : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.property.Grid" rel="Ext.grid.property.Grid" class="docClass">Ext.grid.property.Grid</a>.</p> %}
    
    Defaults to: ['propertygrid']
    *)
  method quicktip : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a>.</p> %}
    
    Defaults to: ['quicktip']
    *)
  method radio : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Radio" rel="Ext.form.field.Radio" class="docClass">Ext.form.field.Radio</a>.</p> %}
    
    Defaults to: ['radio']
    *)
  method radiofield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Radio" rel="Ext.form.field.Radio" class="docClass">Ext.form.field.Radio</a>.</p> %}
    
    Defaults to: ['radiofield']
    *)
  method radiogroup : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.RadioGroup" rel="Ext.form.RadioGroup" class="docClass">Ext.form.RadioGroup</a>.</p> %}
    
    Defaults to: ['radiogroup']
    *)
  method rownumberer : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.RowNumberer" rel="Ext.grid.RowNumberer" class="docClass">Ext.grid.RowNumberer</a>.</p> %}
    
    Defaults to: ['rownumberer']
    *)
  method slider : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.slider.Single" rel="Ext.slider.Single" class="docClass">Ext.slider.Single</a>.</p> %}
    
    Defaults to: ['slider']
    *)
  method sliderfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.slider.Single" rel="Ext.slider.Single" class="docClass">Ext.slider.Single</a>.</p> %}
    
    Defaults to: ['sliderfield']
    *)
  method slidertip : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.slider.Tip" rel="Ext.slider.Tip" class="docClass">Ext.slider.Tip</a>.</p> %}
    
    Defaults to: ['slidertip']
    *)
  method spinnerfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Spinner" rel="Ext.form.field.Spinner" class="docClass">Ext.form.field.Spinner</a>.</p> %}
    
    Defaults to: ['spinnerfield']
    *)
  method splitbutton : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.button.Split" rel="Ext.button.Split" class="docClass">Ext.button.Split</a>.</p> %}
    
    Defaults to: ['splitbutton']
    *)
  method splitter : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.resizer.Splitter" rel="Ext.resizer.Splitter" class="docClass">Ext.resizer.Splitter</a>.</p> %}
    
    Defaults to: ['splitter']
    *)
  method tab : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tab.Tab" rel="Ext.tab.Tab" class="docClass">Ext.tab.Tab</a>.</p> %}
    
    Defaults to: ['tab']
    *)
  method tabbar : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tab.Bar" rel="Ext.tab.Bar" class="docClass">Ext.tab.Bar</a>.</p> %}
    
    Defaults to: ['tabbar']
    *)
  method tablepanel : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.panel.Table" rel="Ext.panel.Table" class="docClass">Ext.panel.Table</a>.</p> %}
    
    Defaults to: ['tablepanel']
    *)
  method tableview : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a>.</p> %}
    
    Defaults to: ['tableview']
    *)
  method tabpanel : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tab.Panel" rel="Ext.tab.Panel" class="docClass">Ext.tab.Panel</a>.</p> %}
    
    Defaults to: ['tabpanel']
    *)
  method tbfill : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Fill" rel="Ext.toolbar.Fill" class="docClass">Ext.toolbar.Fill</a>.</p> %}
    
    Defaults to: ['tbfill']
    *)
  method tbitem : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Item" rel="Ext.toolbar.Item" class="docClass">Ext.toolbar.Item</a>.</p> %}
    
    Defaults to: ['tbitem']
    *)
  method tbseparator : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Separator" rel="Ext.toolbar.Separator" class="docClass">Ext.toolbar.Separator</a>.</p> %}
    
    Defaults to: ['tbseparator']
    *)
  method tbspacer : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Spacer" rel="Ext.toolbar.Spacer" class="docClass">Ext.toolbar.Spacer</a>.</p> %}
    
    Defaults to: ['tbspacer']
    *)
  method tbtext : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.TextItem" rel="Ext.toolbar.TextItem" class="docClass">Ext.toolbar.TextItem</a>.</p> %}
    
    Defaults to: ['tbtext']
    *)
  method templatecolumn : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.grid.column.Template" rel="Ext.grid.column.Template" class="docClass">Ext.grid.column.Template</a>.</p> %}
    
    Defaults to: ['templatecolumn']
    *)
  method text : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.draw.Text" rel="Ext.draw.Text" class="docClass">Ext.draw.Text</a>.</p> %}
    
    Defaults to: ['text']
    *)
  method textarea : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.TextArea" rel="Ext.form.field.TextArea" class="docClass">Ext.form.field.TextArea</a>.</p> %}
    
    Defaults to: ['textarea']
    *)
  method textareafield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.TextArea" rel="Ext.form.field.TextArea" class="docClass">Ext.form.field.TextArea</a>.</p> %}
    
    Defaults to: ['textareafield']
    *)
  method textfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Text" rel="Ext.form.field.Text" class="docClass">Ext.form.field.Text</a>.</p> %}
    
    Defaults to: ['textfield']
    *)
  method timefield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Time" rel="Ext.form.field.Time" class="docClass">Ext.form.field.Time</a>.</p> %}
    
    Defaults to: ['timefield']
    *)
  method timepicker : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.picker.Time" rel="Ext.picker.Time" class="docClass">Ext.picker.Time</a>.</p> %}
    
    Defaults to: ['timepicker']
    *)
  method tip : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tip.Tip" rel="Ext.tip.Tip" class="docClass">Ext.tip.Tip</a>.</p> %}
    
    Defaults to: ['tip']
    *)
  method tool : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.panel.Tool" rel="Ext.panel.Tool" class="docClass">Ext.panel.Tool</a>.</p> %}
    
    Defaults to: ['tool']
    *)
  method toolbar : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Ext.toolbar.Toolbar</a>.</p> %}
    
    Defaults to: ['toolbar']
    *)
  method tooltip : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>.</p> %}
    
    Defaults to: ['tooltip']
    *)
  method treepanel : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">Ext.tree.Panel</a>.</p> %}
    
    Defaults to: ['treepanel']
    *)
  method treeview : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.tree.View" rel="Ext.tree.View" class="docClass">Ext.tree.View</a>.</p> %}
    
    Defaults to: ['treeview']
    *)
  method trigger : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Trigger" rel="Ext.form.field.Trigger" class="docClass">Ext.form.field.Trigger</a>.</p> %}
    
    Defaults to: ['trigger']
    *)
  method triggerfield : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.form.field.Trigger" rel="Ext.form.field.Trigger" class="docClass">Ext.form.field.Trigger</a>.</p> %}
    
    Defaults to: ['triggerfield']
    *)
  method viewport : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Ext.container.Viewport</a>.</p> %}
    
    Defaults to: ['viewport']
    *)
  method window : Js.js_string Js.t Js.prop
  (** {% <p>Alias for <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>.</p> %}
    
    Defaults to: ['window']
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
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

