(** A set of useful static methods to deal with dateNo ...
  
  {% <p>A set of useful static methods to deal with date
Note that if <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a> is required and loaded, it will copy all methods / properties to
this object for convenience</p>

<p>The date parsing and formatting syntax contains a subset of
<a href="http://www.php.net/date">PHP's date() function</a>, and the formats that are
supported will provide results equivalent to their PHP versions.</p>

<p>The following is a list of all currently supported formats:</p>

<pre class="">
Format  Description                                                               Example returned values
------  -----------------------------------------------------------------------   -----------------------
  d     Day of the month, 2 digits with leading zeros                             01 to 31
  D     A short textual representation of the day of the week                     Mon to Sun
  j     Day of the month without leading zeros                                    1 to 31
  l     A full textual representation of the day of the week                      Sunday to Saturday
  N     ISO-8601 numeric representation of the day of the week                    1 (for Monday) through 7 (for Sunday)
  S     English ordinal suffix for the day of the month, 2 characters             st, nd, rd or th. Works well with j
  w     Numeric representation of the day of the week                             0 (for Sunday) to 6 (for Saturday)
  z     The day of the year (starting from 0)                                     0 to 364 (365 in leap years)
  W     ISO-8601 week number of year, weeks starting on Monday                    01 to 53
  F     A full textual representation of a month, such as January or March        January to December
  m     Numeric representation of a month, with leading zeros                     01 to 12
  M     A short textual representation of a month                                 Jan to Dec
  n     Numeric representation of a month, without leading zeros                  1 to 12
  t     Number of days in the given month                                         28 to 31
  L     Whether it&#39;s a leap year                                                  1 if it is a leap year, 0 otherwise.
  o     ISO-8601 year number (identical to (Y), but if the ISO week number (W)    Examples: 1998 or 2004
        belongs to the previous or next year, that year is used instead)
  Y     A full numeric representation of a year, 4 digits                         Examples: 1999 or 2003
  y     A two digit representation of a year                                      Examples: 99 or 03
  a     Lowercase Ante meridiem and Post meridiem                                 am or pm
  A     Uppercase Ante meridiem and Post meridiem                                 AM or PM
  g     12-hour format of an hour without leading zeros                           1 to 12
  G     24-hour format of an hour without leading zeros                           0 to 23
  h     12-hour format of an hour with leading zeros                              01 to 12
  H     24-hour format of an hour with leading zeros                              00 to 23
  i     Minutes, with leading zeros                                               00 to 59
  s     Seconds, with leading zeros                                               00 to 59
  u     Decimal fraction of a second                                              Examples:
        (minimum 1 digit, arbitrary number of digits allowed)                     001 (i.e. 0.001s) or
                                                                                  100 (i.e. 0.100s) or
                                                                                  999 (i.e. 0.999s) or
                                                                                  999876543210 (i.e. 0.999876543210s)
  O     Difference to Greenwich time (GMT) in hours and minutes                   Example: +1030
  P     Difference to Greenwich time (GMT) with colon between hours and minutes   Example: -08:00
  T     Timezone abbreviation of the machine running the code                     Examples: EST, MDT, PDT ...
  Z     Timezone offset in seconds (negative if west of UTC, positive if east)    -43200 to 50400
  c     ISO 8601 date
        Notes:                                                                    Examples:
        1) If unspecified, the month / day defaults to the current month / day,   1991 or
           the time defaults to midnight, while the timezone defaults to the      1992-10 or
           browser's timezone. If a time is specified, it must include both hours 1993-09-20 or
           and minutes. The "T" delimiter, seconds, milliseconds and timezone     1994-08-19T16:20+01:00 or
           are optional.                                                          1995-07-18T17:21:28-02:00 or
        2) The decimal fraction of a second, if specified, must contain at        1996-06-17T18:22:29.98765+03:00 or
           least 1 digit (there is no limit to the maximum number                 1997-05-16T19:23:30,12345-0400 or
           of digits allowed), and may be delimited by either a '.' or a ','      1998-04-15T20:24:31.2468Z or
        Refer to the examples on the right for the various levels of              1999-03-14T20:24:32Z or
        date-time granularity which are supported, or see                         2000-02-13T21:25:33
        http://www.w3.org/TR/NOTE-datetime for more info.                         2001-01-12 22:26:34
  U     Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)                1193432466 or -2138434463
  MS    Microsoft AJAX serialized dates                                           \/Date(1238606590509)\/ (i.e. UTC milliseconds since epoch) or
                                                                                  \/Date(1238606590509+0800)\/
</pre>


<p>Example usage (note that you must escape format specifiers with '\' to render them as character literals):</p>

<pre><code>// Sample date:
// 'Wed Jan 10 2007 15:05:01 GMT-0600 (Central Standard Time)'

var dt = new Date('1/10/2007 03:05:01 PM GMT-0600');
console.log(<a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>(dt, 'Y-m-d'));                          // 2007-01-10
console.log(<a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>(dt, 'F j, Y, g:i a'));                  // January 10, 2007, 3:05 pm
console.log(<a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>(dt, 'l, \\t\\he jS \\of F Y h:i:s A')); // Wednesday, the 10th of January 2007 03:05:01 PM
</code></pre>


<p>Here are some standard date/time patterns that you might find helpful.  They
are not part of the source of <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a>, but to use them you can simply copy this
block of code into any script that is included after <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a> and they will also become
globally available on the Date object.  Feel free to add or remove patterns as needed in your code.</p>

<pre><code>Ext.Date.patterns = {
    ISO8601Long:"Y-m-d H:i:s",
    ISO8601Short:"Y-m-d",
    ShortDate: "n/j/Y",
    LongDate: "l, F d, Y",
    FullDateTime: "l, F d, Y g:i:s A",
    MonthDay: "F d",
    ShortTime: "g:i A",
    LongTime: "g:i:s A",
    SortableDateTime: "Y-m-d\\TH:i:s",
    UniversalSortableDateTime: "Y-m-d H:i:sO",
    YearMonth: "F, Y"
};
</code></pre>


<p>Example usage:</p>

<pre><code>var dt = new Date();
console.log(<a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>(dt, Ext.Date.patterns.ShortDate));
</code></pre>


<p>Developer-written, custom formats may be used by supplying both a formatting and a parsing function
which perform to specialized requirements. The functions are stored in <a href="#!/api/Ext.Date-property-parseFunctions" rel="Ext.Date-property-parseFunctions" class="docClass">parseFunctions</a> and <a href="#!/api/Ext.Date-property-formatFunctions" rel="Ext.Date-property-formatFunctions" class="docClass">formatFunctions</a>.</p> %}
  *)

class type t =
object('self)
  
  method _DAY : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["d"]
    *)
  method _HOUR : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["h"]
    *)
  method _MILLI : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["ms"]
    *)
  method _MINUTE : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["mi"]
    *)
  method _MONTH : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["mo"]
    *)
  method _SECOND : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["s"]
    *)
  method _YEAR : Js.js_string Js.t Js.prop
  (** {% <p>Date interval constant</p> %}
    
    Defaults to: ["y"]
    *)
  method dayNames : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of textual day names.
Override these values for international dates.
Example:</p>

<pre><code><a href="#!/api/Ext.Date-property-dayNames" rel="Ext.Date-property-dayNames" class="docClass">Ext.Date.dayNames</a> = [
    'SundayInYourLang',
    'MondayInYourLang',
    ...
];
</code></pre> %}
    
    Defaults to: [["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]]
    *)
  method defaultFormat : Js.js_string Js.t Js.prop
  (** {% <p>The date format string that the <a href="#!/api/Ext.util.Format-method-dateRenderer" rel="Ext.util.Format-method-dateRenderer" class="docClass">Ext.util.Format.dateRenderer</a>
and <a href="#!/api/Ext.util.Format-method-date" rel="Ext.util.Format-method-date" class="docClass">Ext.util.Format.date</a> functions use.  See <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a> for details.</p>


<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: ["m/d/Y"]
    *)
  method defaults : _ Js.t Js.prop
  (** {% <p>An object hash containing default date values used during date parsing.</p>


<p>The following properties are available:<div class="mdetail-params"><ul>
<li><code>y</code> : Number<div class="sub-desc">The default year value. (defaults to undefined)</div></li>
<li><code>m</code> : Number<div class="sub-desc">The default 1-based month value. (defaults to undefined)</div></li>
<li><code>d</code> : Number<div class="sub-desc">The default day value. (defaults to undefined)</div></li>
<li><code>h</code> : Number<div class="sub-desc">The default hour value. (defaults to undefined)</div></li>
<li><code>i</code> : Number<div class="sub-desc">The default minute value. (defaults to undefined)</div></li>
<li><code>s</code> : Number<div class="sub-desc">The default second value. (defaults to undefined)</div></li>
<li><code>ms</code> : Number<div class="sub-desc">The default millisecond value. (defaults to undefined)</div></li>
</ul></div></p>


<p>Override these properties to customize the default date values used by the <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">parse</a> method.</p>


<p><b>Note: In countries which experience Daylight Saving Time (i.e. DST), the <tt>h</tt>, <tt>i</tt>, <tt>s</tt>
and <tt>ms</tt> properties may coincide with the exact time in which DST takes effect.
It is the responsiblity of the developer to account for this.</b></p>


<p>Example Usage:</p>

<pre><code>// set default day value to the first day of the month
Ext.Date.defaults.d = 1;

// parse a February date string containing only year and month values.
// setting the default day value to 1 prevents weird date rollover issues
// when attempting to parse the following date string on, for example, March 31st 2009.
<a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a>('2009-02', 'Y-m'); // returns a Date object representing February 1st 2009
</code></pre> %}
    
    Defaults to: [{}]
    *)
  method formatCodes : _ Js.t Js.prop
  (** {% <p>The base format-code to formatting-function hashmap used by the <a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">format</a> method.
Formatting functions are strings (or functions which return strings) which
will return the appropriate value when evaluated in the context of the Date object
from which the <a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">format</a> method is called.
Add to / override these mappings for custom date formatting.
Note: <a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>() treats characters as literals if an appropriate mapping cannot be found.
Example:</p>

<pre><code>Ext.Date.formatCodes.x = "<a href="#!/api/Ext.util.Format-method-leftPad" rel="Ext.util.Format-method-leftPad" class="docClass">Ext.util.Format.leftPad</a>(this.getDate(), 2, '0')";
console.log(<a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">Ext.Date.format</a>(new Date(), 'X'); // returns the current day of the month
</code></pre> %}
    *)
  method formatFunctions : _ Js.t Js.prop
  (** {% <p>An object hash in which each property is a date formatting function. The property name is the
format string which corresponds to the produced formatted date string.</p>


<p>This object is automatically populated with date formatting functions as
date formats are requested for Ext standard formatting strings.</p>


<p>Custom formatting functions may be inserted into this object, keyed by a name which from then on
may be used as a format string to <a href="#!/api/Ext.Date-method-format" rel="Ext.Date-method-format" class="docClass">format</a>. Example:</p>


<pre><code><a href="#!/api/Ext.Date-property-formatFunctions" rel="Ext.Date-property-formatFunctions" class="docClass">Ext.Date.formatFunctions</a>['x-date-format'] = myDateFormatter;
</code></pre>


<p>A formatting function should return a string representation of the passed Date object, and is passed the following parameters:<div class="mdetail-params"><ul>
<li><code>date</code> : Date<div class="sub-desc">The Date to format.</div></li>
</ul></div></p>


<p>To enable date strings to also be <i>parsed</i> according to that format, a corresponding
parsing function must be placed into the <a href="#!/api/Ext.Date-property-parseFunctions" rel="Ext.Date-property-parseFunctions" class="docClass">parseFunctions</a> property. %}
    *)
  method monthNames : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of textual month names.
Override these values for international dates.
Example:</p>

<pre><code><a href="#!/api/Ext.Date-property-monthNames" rel="Ext.Date-property-monthNames" class="docClass">Ext.Date.monthNames</a> = [
    'JanInYourLang',
    'FebInYourLang',
    ...
];
</code></pre> %}
    
    Defaults to: [["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]]
    *)
  method monthNumbers : _ Js.t Js.prop
  (** {% <p>An object hash of zero-based javascript month numbers (with short month names as keys. note: keys are case-sensitive).
Override these values for international dates.
Example:</p>

<pre><code><a href="#!/api/Ext.Date-property-monthNumbers" rel="Ext.Date-property-monthNumbers" class="docClass">Ext.Date.monthNumbers</a> = {
    'LongJanNameInYourLang': 0,
    'ShortJanNameInYourLang':0,
    'LongFebNameInYourLang':1,
    'ShortFebNameInYourLang':1,
    ...
};
</code></pre> %}
    
    Defaults to: [{January: 0, Jan: 0, February: 1, Feb: 1, March: 2, Mar: 2, April: 3, Apr: 3, May: 4, June: 5, Jun: 5, July: 6, Jul: 6, August: 7, Aug: 7, September: 8, Sep: 8, October: 9, Oct: 9, November: 10, Nov: 10, December: 11, Dec: 11}]
    *)
  method parseFunctions : _ Js.t Js.prop
  (** {% <p>An object hash in which each property is a date parsing function. The property name is the
format string which that function parses.</p>


<p>This object is automatically populated with date parsing functions as
date formats are requested for Ext standard formatting strings.</p>


<p>Custom parsing functions may be inserted into this object, keyed by a name which from then on
may be used as a format string to <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">parse</a>.<p>
<p>Example:</p>
<pre><code><a href="#!/api/Ext.Date-property-parseFunctions" rel="Ext.Date-property-parseFunctions" class="docClass">Ext.Date.parseFunctions</a>['x-date-format'] = myDateParser;
</code></pre>
<p>A parsing function should return a Date object, and is passed the following parameters:<div class="mdetail-params"><ul>
<li><code>date</code> : String<div class="sub-desc">The date string to parse.</div></li>
<li><code>strict</code> : Boolean<div class="sub-desc">True to validate date strings while parsing
(i.e. prevent javascript Date "rollover") (The default must be false).
Invalid date strings should return null when parsed.</div></li>
</ul></div></p>
<p>To enable Dates to also be <i>formatted</i> according to that format, a corresponding
formatting function must be placed into the <a href="#!/api/Ext.Date-property-formatFunctions" rel="Ext.Date-property-formatFunctions" class="docClass">formatFunctions</a> property. %}
    *)
  method useStrict : bool Js.t Js.prop
  (** {% <p>Global flag which determines if strict date parsing should be used.
Strict date parsing will not roll-over invalid dates, which is the
default behaviour of javascript Date objects.
(see <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">parse</a> for more information)
Defaults to <tt>false</tt>.</p> %}
    
    Defaults to: [false]
    *)
  method add : Js.date Js.t -> Js.js_string Js.t -> Js.number Js.t ->
    Js.date Js.t Js.meth
  (** {% <p>Provides a convenient method for performing basic date arithmetic. This method
does not modify the Date instance being called - it creates and returns
a new Date instance containing the resulting date value.</p>

<p>Examples:</p>

<pre><code>// Basic usage:
var dt = <a href="#!/api/Ext.Date-method-add" rel="Ext.Date-method-add" class="docClass">Ext.Date.add</a>(new Date('10/29/2006'), <a href="#!/api/Ext.Date-property-DAY" rel="Ext.Date-property-DAY" class="docClass">Ext.Date.DAY</a>, 5);
console.log(dt); //returns 'Fri Nov 03 2006 00:00:00'

// Negative values will be subtracted:
var dt2 = <a href="#!/api/Ext.Date-method-add" rel="Ext.Date-method-add" class="docClass">Ext.Date.add</a>(new Date('10/1/2006'), <a href="#!/api/Ext.Date-property-DAY" rel="Ext.Date-property-DAY" class="docClass">Ext.Date.DAY</a>, -5);
console.log(dt2); //returns 'Tue Sep 26 2006 00:00:00'

</code></pre> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date to modify</p> %}
    }
    {- interval: [Js.js_string Js.t]
    {% <p>A valid date interval enum value.</p> %}
    }
    {- value: [Js.number Js.t]
    {% <p>The amount to add to the current date.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.date Js.t] {% <p>The new Date instance.</p> %}
    }
    }
    *)
  method between : Js.date Js.t -> Js.date Js.t -> Js.date Js.t -> bool Js.t
    Js.meth
  (** {% <p>Checks if a date falls on or between the given start and end dates.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date to check</p> %}
    }
    {- start: [Js.date Js.t] {% <p>Start date</p> %}
    }
    {- _end: [Js.date Js.t]
    {% <p>End date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>true if this date falls on or between the given start and end dates.</p> %}
    }
    }
    *)
  method clearTime : Js.date Js.t -> bool Js.t -> Js.date Js.t Js.meth
  (** {% <p>Attempts to clear all time information from this Date by setting the time to midnight of the same day,
automatically adjusting for Daylight Saving Time (DST) where applicable.
(note: DST timezone information for the browser's host operating system is assumed to be up-to-date)</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t] {% <p>The date</p> %}
    }
    {- clone: [bool Js.t]
    {% <p>true to create a clone of this date, clear the time and return it (defaults to false).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.date Js.t] {% <p>this or the clone.</p> %}
    }
    }
    *)
  method clone : Js.date Js.t -> Js.date Js.t Js.meth
  (** {% <p>Creates and returns a new Date instance with the exact same date value as the called instance.
Dates are copied and passed by reference, so if a copied date variable is modified later, the original
variable will also be changed.  When the intention is to create a new variable that will not
modify the original instance, you should create a clone.</p>

<p>Example of correctly cloning a date:</p>

<pre><code>//wrong way:
var orig = new Date('10/1/2006');
var copy = orig;
copy.setDate(5);
console.log(orig);  //returns 'Thu Oct 05 2006'!

//correct way:
var orig = new Date('10/1/2006'),
    copy = <a href="#!/api/Ext.Date-method-clone" rel="Ext.Date-method-clone" class="docClass">Ext.Date.clone</a>(orig);
copy.setDate(5);
console.log(orig);  //returns 'Thu Oct 01 2006'
</code></pre> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.date Js.t] {% <p>The new Date instance.</p> %}
    }
    }
    *)
  method format : Js.date Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  (** {% <p>Formats a date given the supplied format string.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date to format</p> %}
    }
    {- format: [Js.js_string Js.t]
    {% <p>The format string</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The formatted date or an empty string if date parameter is not a JavaScript Date object</p> %}
    }
    }
    *)
  method formatContainsDateInfo : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the specified format contains information about
anything other than the time.</p> %}
    
    {b Parameters}:
    {ul {- format: [Js.js_string Js.t]
    {% <p>The format to check</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the format contains information about
date/day information.</p> %}
    }
    }
    *)
  method formatContainsHourInfo : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the specified format contains hour information</p> %}
    
    {b Parameters}:
    {ul {- format: [Js.js_string Js.t]
    {% <p>The format to check</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the format contains hour information</p> %}
    }
    }
    *)
  method getDayOfYear : Js.date Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the numeric day number of the year, adjusted for leap year.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>0 to 364 (365 in leap years).</p> %}
    }
    }
    *)
  method getDaysInMonth : Js.date Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the number of days in the current month, adjusted for leap year.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The number of days in the month.</p> %}
    }
    }
    *)
  method getElapsed : Js.date Js.t -> Js.date Js.t Js.optdef ->
    Js.number Js.t Js.meth
  (** {% <p>Returns the number of milliseconds between two dates</p> %}
    
    {b Parameters}:
    {ul {- dateA: [Js.date Js.t]
    {% <p>The first date</p> %}
    }
    {- dateB: [Js.date Js.t] (optional)
    {% <p>The second date, defaults to now</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The difference in milliseconds</p> %}
    }
    }
    *)
  method getFirstDateOfMonth : Js.date Js.t -> Js.date Js.t Js.meth
  (** {% <p>Get the date of the first day of the month in which this date resides.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t] {% <p>The date</p> %}
    }
    }
    *)
  method getFirstDayOfMonth : Js.date Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the first day of the current month, adjusted for leap year.  The returned value
is the numeric day index within the week (0-6) which can be used in conjunction with
the <a href="#!/api/Ext.Date-property-monthNames" rel="Ext.Date-property-monthNames" class="docClass">monthNames</a> array to retrieve the textual day name.
Example:</p>

<pre><code>var dt = new Date('1/10/2007'),
    firstDay = <a href="#!/api/Ext.Date-method-getFirstDayOfMonth" rel="Ext.Date-method-getFirstDayOfMonth" class="docClass">Ext.Date.getFirstDayOfMonth</a>(dt);
console.log(<a href="#!/api/Ext.Date-property-dayNames" rel="Ext.Date-property-dayNames" class="docClass">Ext.Date.dayNames</a>[firstDay]); //output: 'Monday'
</code></pre> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The day number (0-6).</p> %}
    }
    }
    *)
  method getGMTOffset : Js.date Js.t -> bool Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  (** {% <p>Get the offset from GMT of the current date (equivalent to the format specifier 'O').</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    {- colon: [bool Js.t] (optional)
    {% <p>true to separate the hours and minutes with a colon (defaults to false).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The 4-character offset string prefixed with + or - (e.g. '-0600').</p> %}
    }
    }
    *)
  method getLastDateOfMonth : Js.date Js.t -> Js.date Js.t Js.meth
  (** {% <p>Get the date of the last day of the month in which this date resides.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t] {% <p>The date</p> %}
    }
    }
    *)
  method getLastDayOfMonth : Js.date Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the last day of the current month, adjusted for leap year.  The returned value
is the numeric day index within the week (0-6) which can be used in conjunction with
the <a href="#!/api/Ext.Date-property-monthNames" rel="Ext.Date-property-monthNames" class="docClass">monthNames</a> array to retrieve the textual day name.
Example:</p>

<pre><code>var dt = new Date('1/10/2007'),
    lastDay = <a href="#!/api/Ext.Date-method-getLastDayOfMonth" rel="Ext.Date-method-getLastDayOfMonth" class="docClass">Ext.Date.getLastDayOfMonth</a>(dt);
console.log(<a href="#!/api/Ext.Date-property-dayNames" rel="Ext.Date-property-dayNames" class="docClass">Ext.Date.dayNames</a>[lastDay]); //output: 'Wednesday'
</code></pre> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The day number (0-6).</p> %}
    }
    }
    *)
  method getMonthNumber : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the zero-based javascript month number for the given short/full month name.
Override this function for international dates.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The short/full month name.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The zero-based javascript month number.</p> %}
    }
    }
    *)
  method getShortDayName : Js.number Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get the short day name for the given day number.
Override this function for international dates.</p> %}
    
    {b Parameters}:
    {ul {- day: [Js.number Js.t]
    {% <p>A zero-based javascript day number.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The short day name.</p> %}
    }
    }
    *)
  method getShortMonthName : Js.number Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get the short month name for the given month number.
Override this function for international dates.</p> %}
    
    {b Parameters}:
    {ul {- month: [Js.number Js.t]
    {% <p>A zero-based javascript month number.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The short month name.</p> %}
    }
    }
    *)
  method getSuffix : Js.date Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get the English ordinal suffix of the current day (equivalent to the format specifier 'S').</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>'st, 'nd', 'rd' or 'th'.</p> %}
    }
    }
    *)
  method getTimezone : Js.date Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Get the timezone abbreviation of the current date (equivalent to the format specifier 'T').</p>

<p>Note: The date string returned by the javascript Date object's toString() method varies
between browsers (e.g. FF vs IE) and system region settings (e.g. IE in Asia vs IE in America).
For a given date string e.g. "Thu Oct 25 2007 22:55:35 GMT+0800 (Malay Peninsula Standard Time)",
getTimezone() first tries to get the timezone abbreviation from between a pair of parentheses
(which may or may not be present), failing which it proceeds to get the timezone abbreviation
from the GMT offset portion of the date string.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The abbreviated timezone name (e.g. 'CST', 'PDT', 'EDT', 'MPST' ...).</p> %}
    }
    }
    *)
  method getWeekOfYear : Js.date Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the numeric ISO-8601 week number of the year.
(equivalent to the format specifier 'W', but without a leading zero).</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>1 to 53</p> %}
    }
    }
    *)
  method isDST : Js.date Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the current date is affected by Daylight Saving Time (DST).</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the current date is affected by DST.</p> %}
    }
    }
    *)
  method isEqual : Js.date Js.t -> Js.date Js.t -> bool Js.t Js.meth
  (** {% <p>Compares if two dates are equal by comparing their values.</p> %}
    
    {b Parameters}:
    {ul {- date1: [Js.date Js.t]
    }
    {- date2: [Js.date Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the date values are equal</p> %}
    }
    }
    *)
  method isLeapYear : Js.date Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the current date falls within a leap year.</p> %}
    
    {b Parameters}:
    {ul {- date: [Js.date Js.t]
    {% <p>The date</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the current date falls within a leap year, false otherwise.</p> %}
    }
    }
    *)
  method isValid : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> bool Js.t Js.meth
  (** {% <p>Checks if the passed Date parameters will cause a javascript Date "rollover".</p> %}
    
    {b Parameters}:
    {ul {- year: [Js.number Js.t]
    {% <p>4-digit year</p> %}
    }
    {- month: [Js.number Js.t]
    {% <p>1-based month-of-year</p> %}
    }
    {- day: [Js.number Js.t]
    {% <p>Day of month</p> %}
    }
    {- hour: [Js.number Js.t] (optional)
    {% <p>Hour</p> %}
    }
    {- minute: [Js.number Js.t] (optional)
    {% <p>Minute</p> %}
    }
    {- second: [Js.number Js.t] (optional)
    {% <p>Second</p> %}
    }
    {- millisecond: [Js.number Js.t] (optional)
    {% <p>Millisecond</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>true if the passed parameters do not cause a Date "rollover", false otherwise.</p> %}
    }
    }
    *)
  method now : Js.number Js.t Js.meth
  (** {% <p>Returns the current timestamp.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>Milliseconds since UNIX epoch.</p> %}
    }
    }
    *)
  method parse : Js.js_string Js.t -> Js.js_string Js.t ->
    bool Js.t Js.optdef -> Js.date Js.t Js.meth
  (** {% <p>Parses the passed string using the specified date format.
Note that this function expects normal calendar dates, meaning that months are 1-based (i.e. 1 = January).
The <a href="#!/api/Ext.Date-property-defaults" rel="Ext.Date-property-defaults" class="docClass">defaults</a> hash will be used for any date value (i.e. year, month, day, hour, minute, second or millisecond)
which cannot be found in the passed string. If a corresponding default date value has not been specified in the <a href="#!/api/Ext.Date-property-defaults" rel="Ext.Date-property-defaults" class="docClass">defaults</a> hash,
the current date's year, month, day or DST-adjusted zero-hour time value will be used instead.
Keep in mind that the input date string must precisely match the specified format string
in order for the parse operation to be successful (failed parse operations return a null value).</p>

<p>Example:</p>


<pre><code>//dt = Fri May 25 2007 (current date)
var dt = new Date();

//dt = Thu May 25 2006 (today&#39;s month/day in 2006)
dt = <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a>("2006", "Y");

//dt = Sun Jan 15 2006 (all date parts specified)
dt = <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a>("2006-01-15", "Y-m-d");

//dt = Sun Jan 15 2006 15:20:01
dt = <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a>("2006-01-15 3:20:01 PM", "Y-m-d g:i:s A");

// attempt to parse Sun Feb 29 2006 03:20:01 in strict mode
dt = <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a>("2006-02-29 03:20:01", "Y-m-d H:i:s", true); // returns null
</code></pre> %}
    
    {b Parameters}:
    {ul {- input: [Js.js_string Js.t]
    {% <p>The raw date string.</p> %}
    }
    {- format: [Js.js_string Js.t]
    {% <p>The expected date string format.</p> %}
    }
    {- strict: [bool Js.t] (optional)
    {% <p>True to validate date strings while parsing (i.e. prevents javascript Date "rollover")</p>

<pre><code>                    (defaults to false). Invalid date strings will return null when parsed.
</code></pre> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.date Js.t] {% <p>The parsed Date.</p> %}
    }
    }
    *)
  method unescapeFormat : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Removes all escaping for a date format string. In date formats,
using a '\' can be used to escape special characters.</p> %}
    
    {b Parameters}:
    {ul {- format: [Js.js_string Js.t]
    {% <p>The format to unescape</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The unescaped format</p> %}
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
  
  
end

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

