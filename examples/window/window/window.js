// This program was compiled from OCaml by js_of_ocaml 1.0
function caml_raise_with_arg (tag, arg) { throw [0, tag, arg]; }
function caml_raise_with_string (tag, msg) {
  caml_raise_with_arg (tag, new MlWrappedString (msg));
}
function caml_invalid_argument (msg) {
  caml_raise_with_string(caml_global_data[4], msg);
}
function caml_array_bound_error () {
  caml_invalid_argument("index out of bounds");
}
function caml_str_repeat(n, s) {
  if (!n) { return ""; }
  if (n & 1) { return caml_str_repeat(n - 1, s) + s; }
  var r = caml_str_repeat(n >> 1, s);
  return r + r;
}
function MlString(param) {
  if (param != null) {
    this.bytes = this.fullBytes = param;
    this.last = this.len = param.length;
  }
}
MlString.prototype = {
  string:null,
  bytes:null,
  fullBytes:null,
  array:null,
  len:null,
  last:0,
  toJsString:function() {
    return this.string = decodeURIComponent (escape(this.getFullBytes()));
  },
  toBytes:function() {
    if (this.string != null)
      var b = unescape (encodeURIComponent (this.string));
    else {
      var b = "", a = this.array, l = a.length;
      for (var i = 0; i < l; i ++) b += String.fromCharCode (a[i]);
    }
    this.bytes = this.fullBytes = b;
    this.last = this.len = b.length;
    return b;
  },
  getBytes:function() {
    var b = this.bytes;
    if (b == null) b = this.toBytes();
    return b;
  },
  getFullBytes:function() {
    var b = this.fullBytes;
    if (b !== null) return b;
    b = this.bytes;
    if (b == null) b = this.toBytes ();
    if (this.last < this.len) {
      this.bytes = (b += caml_str_repeat(this.len - this.last, '\0'));
      this.last = this.len;
    }
    this.fullBytes = b;
    return b;
  },
  toArray:function() {
    var b = this.bytes;
    if (b == null) b = this.toBytes ();
    var a = [], l = this.last;
    for (var i = 0; i < l; i++) a[i] = b.charCodeAt(i);
    for (l = this.len; i < l; i++) a[i] = 0;
    this.string = this.bytes = this.fullBytes = null;
    this.last = this.len;
    this.array = a;
    return a;
  },
  getArray:function() {
    var a = this.array;
    if (!a) a = this.toArray();
    return a;
  },
  getLen:function() {
    var len = this.len;
    if (len !== null) return len;
    this.toBytes();
    return this.len;
  },
  toString:function() { var s = this.string; return s?s:this.toJsString(); },
  valueOf:function() { var s = this.string; return s?s:this.toJsString(); },
  blitToArray:function(i1, a2, i2, l) {
    var a1 = this.array;
    if (a1)
      for (var i = 0; i < l; i++) a2 [i2 + i] = a1 [i1 + i];
    else {
      var b = this.bytes;
      if (b == null) b = this.toBytes();
      var l1 = this.last - i1;
      if (l <= l1)
        for (var i = 0; i < l; i++) a2 [i2 + i] = b.charCodeAt(i1 + i);
      else {
        for (var i = 0; i < l1; i++) a2 [i2 + i] = b.charCodeAt(i1 + i);
        for (; i < l; i++) a2 [i2 + i] = 0;
      }
    }
  },
  get:function (i) {
    var a = this.array;
    if (a) return a[i];
    var b = this.bytes;
    if (b == null) b = this.toBytes();
    return (i<this.last)?b.charCodeAt(i):0;
  },
  safeGet:function (i) {
    if (!this.len) this.toBytes();
    if ((i < 0) || (i >= this.len)) caml_array_bound_error ();
    return this.get(i);
  },
  set:function (i, c) {
    var a = this.array;
    if (!a) {
      if (this.last == i) {
        this.bytes += String.fromCharCode (c & 0xff);
        this.last ++;
        return 0;
      }
      a = this.toArray();
    } else if (this.bytes != null) {
      this.bytes = this.fullBytes = this.string = null;
    }
    a[i] = c & 0xff;
    return 0;
  },
  safeSet:function (i, c) {
    if (this.len == null) this.toBytes ();
    if ((i < 0) || (i >= this.len)) caml_array_bound_error ();
    this.set(i, c);
  },
  fill:function (ofs, len, c) {
    if (ofs >= this.last && this.last && c == 0) return;
    var a = this.array;
    if (!a) a = this.toArray();
    else if (this.bytes != null) {
      this.bytes = this.fullBytes = this.string = null;
    }
    var l = ofs + len;
    for (var i = ofs; i < l; i++) a[i] = c;
  },
  compare:function (s2) {
    if (this.string != null && s2.string != null) {
      if (this.string < s2.string) return -1;
      if (this.string > s2.string) return 1;
      return 0;
    }
    var b1 = this.getFullBytes ();
    var b2 = s2.getFullBytes ();
    if (b1 < b2) return -1;
    if (b1 > b2) return 1;
    return 0;
  },
  equal:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string == s2.string;
    return this.getFullBytes () == s2.getFullBytes ();
  },
  lessThan:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string < s2.string;
    return this.getFullBytes () < s2.getFullBytes ();
  },
  lessEqual:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string <= s2.string;
    return this.getFullBytes () <= s2.getFullBytes ();
  }
}
function MlWrappedString (s) { this.string = s; }
MlWrappedString.prototype = new MlString();
function MlMakeString (l) { this.bytes = ""; this.len = l; }
MlMakeString.prototype = new MlString ();
function caml_int64_compare(x,y) {
  var x3 = x[3] << 16;
  var y3 = y[3] << 16;
  if (x3 > y3) return 1;
  if (x3 < y3) return -1;
  if (x[2] > y[2]) return 1;
  if (x[2] < y[2]) return -1;
  if (x[1] > y[1]) return 1;
  if (x[1] < y[1]) return -1;
  return 0;
}
function caml_int_compare (a, b) {
  if (a < b) return (-1); if (a == b) return 0; return 1;
}
function caml_compare_val (a, b, total) {
  var stack = [];
  for(;;) {
    if (!(total && a === b)) {
      if (a instanceof MlString) {
        if (b instanceof MlString) {
            if (a != b) {
		var x = a.compare(b);
		if (x != 0) return x;
	    }
        } else
          return 1;
      } else if (a instanceof Array && a[0] === (a[0]|0)) {
        var ta = a[0];
        if (ta === 250) {
          a = a[1];
          continue;
        } else if (b instanceof Array && b[0] === (b[0]|0)) {
          var tb = b[0];
          if (tb === 250) {
            b = b[1];
            continue;
          } else if (ta != tb) {
            return (ta < tb)?-1:1;
          } else {
            switch (ta) {
            case 248: {
		var x = caml_int_compare(a[2], b[2]);
		if (x != 0) return x;
		break;
	    }
            case 255: {
		var x = caml_int64_compare(a, b);
		if (x != 0) return x;
		break;
	    }
            default:
              if (a.length != b.length) return (a.length < b.length)?-1:1;
              if (a.length > 1) stack.push(a, b, 1);
            }
          }
        } else
          return 1;
      } else if (b instanceof MlString ||
                 (b instanceof Array && b[0] === (b[0]|0))) {
        return -1;
      } else {
        if (a < b) return -1;
        if (a > b) return 1;
        if (total && a != b) {
          if (a == a) return 1;
          if (b == b) return -1;
        }
      }
    }
    if (stack.length == 0) return 0;
    var i = stack.pop();
    b = stack.pop();
    a = stack.pop();
    if (i + 1 < a.length) stack.push(a, b, i + 1);
    a = a[i];
    b = b[i];
  }
}
function caml_compare (a, b) { return caml_compare_val (a, b, true); }
function caml_greaterequal (x, y) { return +(caml_compare(x,y,false) >= 0); }
function caml_js_assoc_get(o, k) { return o[k]; }
function caml_js_assoc_set(o, k, v) { o[k] = v; }
function caml_js_from_array(a) { return a.slice(1); }
function caml_call_gen(f, args) {
  if(f.fun)
    return caml_call_gen(f.fun, args);
  var n = f.length;
  var d = n - args.length;
  if (d == 0)
    return f.apply(null, args);
  else if (d < 0)
    return caml_call_gen(f.apply(null, args.slice(0,n)), args.slice(n));
  else
    return function (x){ return caml_call_gen(f, args.concat([x])); };
}
function caml_js_wrap_callback(f) {
  var toArray = Array.prototype.slice;
  return function () {
    var args = (arguments.length > 0)?toArray.call (arguments):[undefined];
    return caml_call_gen(f, args);
  }
}
function caml_js_wrap_meth_callback(f) {
  var toArray = Array.prototype.slice;
  return function () {
    var args = (arguments.length > 0)?toArray.call (arguments):[0];
    args.unshift (this);
    return caml_call_gen(f, args);
  }
}
function caml_ml_out_channels_list () { return 0; }
var caml_global_data = [0];
function caml_register_global (n, v) { caml_global_data[n + 1] = v; }
var caml_named_values = {};
function caml_register_named_value(nm,v) {
  caml_named_values[nm] = v; return 0;
}
(function()
   {caml_register_global(6,[0,new MlString("Not_found")]);
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,[0,new MlString("Invalid_argument")]);
    caml_register_global(2,[0,new MlString("Failure")]);
    var
     _Z_=new MlString("Pervasives.do_at_exit"),
     _Y_=new MlString("px"),
     _X_=new MlString("px"),
     _W_=new MlString("px"),
     _V_=new MlString("px"),
     _U_=new MlString("absolute"),
     _T_=new MlString("block"),
     _S_=new MlString("none"),
     _R_=new MlString("pointer-events"),
     _Q_=new MlString("z-index"),
     _P_=new MlString("background-color"),
     _O_=new MlString("none"),
     _N_=new MlString("violet"),
     _M_=new MlString("indigo"),
     _L_=new MlString("blue"),
     _K_=new MlString("green"),
     _J_=new MlString("yellow"),
     _I_=new MlString("orange"),
     _H_=new MlString("red"),
     _G_=new MlString("fit"),
     _F_=new MlString("Constrained Window"),
     _E_=new MlString("Ext.Window"),
     _D_=new MlString("fit"),
     _C_=new MlString("Header-Constrained Win"),
     _B_=new MlString("Ext.Window"),
     _A_=new MlString("fit"),
     _z_=new MlString("Constraining Window, plain: true"),
     _y_=new MlString("Ext.Window"),
     _x_=new MlString("fit"),
     _w_=new MlString("left"),
     _v_=new MlString("Left Header, plain: true"),
     _u_=new MlString("Ext.Window"),
     _t_=new MlString("fit"),
     _s_=new MlString("right"),
     _r_=new MlString("Right Header, plain: true"),
     _q_=new MlString("Ext.Window"),
     _p_=new MlString("fit"),
     _o_=new MlString("bottom"),
     _n_=new MlString("Bottom Header, plain: true"),
     _m_=new MlString("Ext.Window"),
     _l_=new MlString("Ext.layout.container.Border"),
     _k_=new MlString("Ext.layout.container.Card"),
     _j_=new MlString("Ext.toolbar.Spacer"),
     _i_=new MlString("Ext.tab.*"),
     _h_=new MlString("Ext.window.Window");
    function flush_all_f_(param_e_)
     {return function(param_a_)
               {var param_b_=param_a_;
                for(;;)
                 {if(param_b_)
                   {var l_c_=param_b_[2];
                    try {}catch(_d_){}
                    var param_b_=l_c_;
                    continue;}
                  return 0;}}
              (caml_ml_out_channels_list(0));}
    function do_at_exit___(param_g_){return flush_all_f_(0);}
    caml_register_named_value(_Z_,do_at_exit___);
    var _$_=[0,0],undefined_ab_=undefined;
    function _ae_(fn_aa_){_$_[1]=[0,fn_aa_,_$_[1]];return 0;}
    function _ad_(x_ac_){return x_ac_!==undefined_ab_?1:0;}
    var _true_af_=true,_false_ag_=false,array_constructor_ai_=Array;
    _ae_
     (function(e_ah_)
       {return e_ah_ instanceof array_constructor_ai_
                ?0
                :[0,new MlWrappedString(e_ah_.toString())];});
    function _ak_(_aj_){return _aj_;}
    function get_static_am_(param_al_){return Ext.util.Region;}
    var
     _an_=get_static_am_(0),
     _ap_=function(param_ao_){return Ext;}(0),
     _aq_=undefined;
    _ap_.require
     (caml_js_from_array
       ([0,
         _h_.toString(),
         _i_.toString(),
         _j_.toString(),
         _k_.toString(),
         _l_.toString()]),
      undefined_ab_,
      undefined_ab_,
      undefined_ab_);
    _ap_.onReady
     (caml_js_wrap_callback
       (function(param_bu_)
         {var
           abfb2a684_at_=get_static_am_(0),
           _aH_=
            caml_js_wrap_meth_callback
             (function(this_ar_,param_as_)
               {return _ad_(this_ar_.highlightEl)
                        ?this_ar_.highlightEl.setStyle({"display":_O_.toString()})
                        :0;}),
           _aI_=
            caml_js_wrap_meth_callback
             (function(this_au_,param_aG_)
               {var
                 ab4b28083_av_=(this_au_.right-this_au_.left+1).toString(),
                 _aw_=ab4b28083_av_.concat(_Y_.toString()),
                 ad62eed4e_ax_=(this_au_.bottom-this_au_.top+1).toString(),
                 _ay_=ad62eed4e_ax_.concat(_X_.toString()),
                 a61f5ff06_az_=this_au_.left.toString(),
                 _aA_=a61f5ff06_az_.concat(_W_.toString()),
                 abc9aab0e_aB_=this_au_.top.toString(),
                 _aC_=abc9aab0e_aB_.concat(_V_.toString()),
                 style_aD_=
                  {"display":_T_.toString(),
                   "position":_U_.toString(),
                   "top":_aC_,
                   "left":_aA_,
                   "height":_ay_,
                   "width":_aw_,
                   "opacity":0.3},
                 _aE_=_U_.toString();
                caml_js_assoc_set(style_aD_,_R_,_S_.toString());
                caml_js_assoc_set(style_aD_,_Q_,9999999);
                var _aF_=0.3;
                return _ad_(this_au_.highlightEl)
                        ?(this_au_.highlightEl.setStyle(style_aD_),0)
                        :(caml_js_assoc_set
                           (style_aD_,
                            _P_,
                            caml_js_assoc_get(this_au_.colors,this_au_.nextColor)),
                          _an_.prototype.nextColor=
                          _an_.prototype.nextColor+
                          1|
                          0,
                          this_au_.highlightEl=
                          _ap_.getBody().createChild
                           ({"style":style_aD_},undefined_ab_,undefined_ab_),
                          caml_greaterequal(this_au_.nextColor,this_au_.colors.length)
                           ?this_au_.nextColor=0
                           :0);});
          abfb2a684_at_.override
           ({"colors":
             caml_js_from_array
              ([0,
                _H_.toString(),
                _I_.toString(),
                _J_.toString(),
                _K_.toString(),
                _L_.toString(),
                _M_.toString(),
                _N_.toString()]),
             "nextColor":0,
             "show":_aI_,
             "hide":_aH_},
            _aq_);
          var
           _aJ_=_G_.toString(),
           _aK_=
            _ak_
             ({"title":_F_.toString(),
               "width":200,
               "height":100,
               "x":1000,
               "y":20,
               "constrain":_true_af_,
               "layout":_G_.toString(),
               "items":{"border":_false_ag_}}),
           constrainedWin_aL_=_ap_.create(_ak_(_E_.toString()),_aK_),
           _aM_=_D_.toString(),
           _aN_=
            _ak_
             ({"title":_C_.toString(),
               "width":200,
               "height":100,
               "x":120,
               "y":120,
               "constrainHeader":_true_af_,
               "layout":_D_.toString(),
               "items":{"border":_false_ag_}}),
           constrainedWin2_aO_=_ap_.create(_ak_(_B_.toString()),_aN_),
           _aR_=
            caml_js_from_array
             ([0,constrainedWin_aL_,constrainedWin2_aO_,{"border":_false_ag_}]),
           _aQ_=_A_.toString(),
           _aP_=_z_.toString(),
           _aS_=
            _ak_
             ({"height":200,
               "width":400,
               "x":450,
               "y":450,
               "title":_z_.toString(),
               "closable":_false_ag_,
               "plain":_true_af_,
               "layout":_A_.toString(),
               "items":
               caml_js_from_array
                ([0,
                  constrainedWin_aL_,
                  constrainedWin2_aO_,
                  {"border":_false_ag_}])});
          _ap_.create(_ak_(_y_.toString()),_aS_).show();
          constrainedWin_aL_.show();
          constrainedWin2_aO_.show();
          var
           _aU_=_x_.toString(),
           _aT_=_w_.toString(),
           _aV_=
            _ak_
             ({"title":_v_.toString(),
               "width":400,
               "height":200,
               "x":10,
               "y":200,
               "plain":_true_af_,
               "headerPosition":_w_.toString(),
               "layout":_x_.toString(),
               "items":{"border":_false_ag_}});
          _ap_.create(_ak_(_u_.toString()),_aV_).show();
          var
           _aX_=_t_.toString(),
           _aW_=_s_.toString(),
           _aY_=
            _ak_
             ({"title":_r_.toString(),
               "width":400,
               "height":200,
               "x":450,
               "y":200,
               "headerPosition":_s_.toString(),
               "layout":_t_.toString(),
               "items":{"border":_false_ag_}});
          _ap_.create(_ak_(_q_.toString()),_aY_).show();
          var
           _a0_=_p_.toString(),
           _aZ_=_o_.toString(),
           _a1_=
            _ak_
             ({"title":_n_.toString(),
               "width":400,
               "height":200,
               "x":10,
               "y":450,
               "plain":1,
               "headerPosition":_o_.toString(),
               "layout":_p_.toString(),
               "items":{"border":_false_ag_}}),
           _bt_=0,
           a8500f925_bs_={"border":_false_ag_},
           _br_=20,
           _bq_=1000,
           _bp_=100,
           _bo_=200,
           aaa052ac6_bn_={"border":_false_ag_},
           _bm_=120,
           _bl_=120,
           _bk_=100,
           _bj_=200,
           _bi_=450,
           _bh_=450,
           _bg_=400,
           a29f6551e_bf_={"border":_false_ag_},
           _be_=200,
           _bd_=10,
           _bc_=200,
           _bb_=400,
           a84df5bb8_ba_={"border":_false_ag_},
           _a$_=200,
           _a__=450,
           _a9_=200,
           _a8_=400,
           a621ea25b_a7_={"border":_false_ag_},
           _a6_=1,
           _a5_=450,
           _a4_=10,
           _a3_=200,
           _a2_=400;
          return _ap_.create(_ak_(_m_.toString()),_a1_).show();}),
      _aq_,
      _aq_);
    do_at_exit___(0);
    return;}
  ());
