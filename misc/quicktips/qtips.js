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
     _ai_=new MlString("Pervasives.do_at_exit"),
     _ah_=new MlString("Ext.tip.ToolTip"),
     _ag_=new MlString("Link to something interesting."),
     _af_=new MlString("Link"),
     _ae_=new MlString("content-anchor-tip"),
     _ad_=new MlString("a"),
     _ac_=new MlString("click"),
     _ab_=new MlString("Ext.Button"),
     _aa_=new MlString("10px"),
     _$_=new MlString("margin-right"),
     ___=new MlString("medium"),
     _Z_=new MlString("anchor"),
     _Y_=new MlString("Anchor with tracking"),
     _X_=new MlString("trackCallout"),
     _W_=new MlString("anchor"),
     _V_=new MlString("Anchor below"),
     _U_=new MlString("bottomCallout"),
     _T_=new MlString("anchor"),
     _S_=new MlString("Anchor right, rich content"),
     _R_=new MlString("leftCallout"),
     _Q_=new MlString("easiest"),
     _P_=new MlString("Mouse Track"),
     _O_=new MlString("track-tip"),
     _N_=new MlString("easiest"),
     _M_=new MlString("Ajax ToolTip"),
     _L_=new MlString("ajax-tip"),
     _K_=new MlString("easiest"),
     _J_=new MlString("autoHide disabled"),
     _I_=new MlString("tip2"),
     _H_=new MlString("easiest"),
     _G_=new MlString("Basic ToolTip"),
     _F_=new MlString("tip1"),
     _E_=new MlString("Tracking while you move the mouse"),
     _D_=new MlString("right"),
     _C_=new MlString("trackCallout"),
     _B_=new MlString("This tip\"s anchor is centered"),
     _A_=new MlString("top"),
     _z_=new MlString("bottomCallout"),
     _y_=new MlString("content-tip"),
     _x_=new MlString("left"),
     _w_=new MlString("leftCallout"),
     _v_=new MlString("content-anchor-tip"),
     _u_=new MlString("<a href=\"#\">Rich Content Tooltip</a>"),
     _t_=
      new
       MlString
       ("This tip will follow the mouse while it is over the element"),
     _s_=new MlString("Mouse Track"),
     _r_=new MlString("track-tip"),
     _q_=new MlString("Click the X to close me"),
     _p_=new MlString("My Tip Title"),
     _o_=new MlString("tip2"),
     _n_=new MlString("ajax-tip.html"),
     _m_=new MlString("ajax-tip"),
     _l_=new MlString("A very simple tooltip"),
     _k_=new MlString("tip1"),
     _j_=new MlString("Ext.window.MessageBox"),
     _i_=new MlString("Ext.Button"),
     _h_=new MlString("Ext.tip.*");
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
    function do_at_exit_aj_(param_g_){return flush_all_f_(0);}
    caml_register_named_value(_ai_,do_at_exit_aj_);
    var _ak_=[0,0],undefined_am_=undefined,_true_an_=true,_false_ao_=false;
    function _as_(fn_al_){_ak_[1]=[0,fn_al_,_ak_[1]];return 0;}
    var null_ar_=null,array_constructor_aq_=Array;
    _as_
     (function(e_ap_)
       {return e_ap_ instanceof array_constructor_aq_
                ?0
                :[0,new MlWrappedString(e_ap_.toString())];});
    function _au_(_at_){return _at_;}
    _au_(window.HTMLElement)===undefined_am_;
    var _aw_=function(param_av_){return Ext;}(0);
    function get_instance_az_(param_ax_){return Ext.MessageBox;}
    var _aA_=undefined;
    function get_instance_aB_(param_ay_){return Ext.tip.QuickTipManager;}
    _aw_.require
     (caml_js_from_array([0,_h_.toString(),_i_.toString(),_j_.toString()]),
      undefined_am_,
      undefined_am_,
      undefined_am_);
    _aw_.onReady
     (caml_js_wrap_callback
       (function(param_bs_)
         {var style_aC_={};
          style_aC_[_$_.toString()]=_aa_.toString();
          var
           defaultButtonConfig_aD_={"scale":___.toString(),"style":style_aC_},
           _aV_=_Z_.toString(),
           _aU_=_Y_.toString(),
           _aT_=_W_.toString(),
           _aS_=200,
           _aR_=_V_.toString(),
           _aQ_=_T_.toString(),
           _aP_=_S_.toString(),
           _aO_=_Q_.toString(),
           _aN_=_P_.toString(),
           _aM_=_N_.toString(),
           _aL_=_M_.toString(),
           _aK_=_K_.toString(),
           _aJ_=_J_.toString(),
           _aI_=_H_.toString(),
           _aH_=_G_.toString(),
           buttons_aG_=
            caml_js_from_array
             ([0,
               {"id":_F_.toString(),
                "text":_G_.toString(),
                "renderTo":_H_.toString()},
               {"id":_I_.toString(),
                "text":_J_.toString(),
                "renderTo":_K_.toString()},
               {"id":_L_.toString(),
                "text":_M_.toString(),
                "renderTo":_N_.toString()},
               {"id":_O_.toString(),
                "text":_P_.toString(),
                "renderTo":_Q_.toString()},
               {"id":_R_.toString(),
                "text":_S_.toString(),
                "renderTo":_T_.toString()},
               {"id":_U_.toString(),
                "text":_V_.toString(),
                "width":200,
                "renderTo":_W_.toString()},
               {"id":_X_.toString(),
                "text":_Y_.toString(),
                "renderTo":_Z_.toString()}]);
          _aw_.each
           (buttons_aG_,
            caml_js_wrap_callback
             (function(config_aE_)
               {var
                 _aF_=
                  _au_
                   (_aw_.apply({},config_aE_,_au_(defaultButtonConfig_aD_)));
                return _aw_.create(_au_(_ab_.toString()),_aF_).show();}),
            undefined_am_,
            undefined_am_);
          var
           _a$_=_E_.toString(),
           _a__=_D_.toString(),
           a81dda89a_a9_=
            {"target":_C_.toString(),
             "anchor":_D_.toString(),
             "trackMouse":_true_an_,
             "html":_E_.toString()},
           _a8_=_B_.toString(),
           _a7_=85,
           _a6_=_A_.toString(),
           abe37e1e5_a5_=
            {"target":_z_.toString(),
             "anchor":_A_.toString(),
             "anchorOffset":85,
             "html":_B_.toString()},
           ade5d15f5_ba_=
            {"render":
             caml_js_wrap_callback
              (function(this_aW_,param_a4_)
                {var
                  a773efec2_a2_=this_aW_.header,
                  a89ae38d1_a1_={"delegate":_ad_.toString()},
                  _a3_=
                   caml_js_wrap_callback
                    (function(header_aZ_,e_aX_,param_a0_)
                      {e_aX_.stopEvent();
                       var a8d033615_aY_=get_instance_az_(0);
                       a8d033615_aY_.alert
                        (_af_.toString(),
                         _ag_.toString(),
                         undefined_am_,
                         undefined_am_);
                       return _aw_.getCmp(_ae_.toString()).hide();});
                 return a773efec2_a2_.on
                         (_ac_.toString(),_a3_,this_aW_,a89ae38d1_a1_);})},
           _br_=_y_.toString(),
           _bq_=415,
           _bp_=_x_.toString(),
           _bo_=_w_.toString(),
           _bn_=_v_.toString(),
           _bm_=_t_.toString(),
           _bl_=200,
           _bk_=_s_.toString(),
           _bj_=_q_.toString(),
           _bi_=_p_.toString(),
           _bh_=15000,
           a05600650_bg_={"url":_n_.toString()},
           _bf_=200,
           _be_=_l_.toString(),
           tooltips_bd_=
            caml_js_from_array
             ([0,
               {"target":_k_.toString(),"html":_l_.toString()},
               {"target":_m_.toString(),
                "width":200,
                "autoLoad":{"url":_n_.toString()},
                "dismissDelay":15000},
               {"target":_o_.toString(),
                "title":_p_.toString(),
                "html":_q_.toString(),
                "autoHide":_false_ao_,
                "closable":_true_an_,
                "draggable":_true_an_},
               {"target":_r_.toString(),
                "title":_s_.toString(),
                "width":200,
                "html":_t_.toString(),
                "trackMouse":_true_an_},
               {"title":_u_.toString(),
                "id":_v_.toString(),
                "target":_w_.toString(),
                "anchor":_x_.toString(),
                "html":null_ar_,
                "width":415,
                "autoHide":_false_ao_,
                "closable":_true_an_,
                "contentEl":_y_.toString(),
                "listeners":ade5d15f5_ba_},
               abe37e1e5_a5_,
               a81dda89a_a9_]);
          _aw_.each
           (tooltips_bd_,
            caml_js_wrap_callback
             (function(config_bb_)
               {var _bc_=_au_(config_bb_);
                return _aw_.create(_au_(_ah_.toString()),_bc_);}),
            undefined_am_,
            undefined_am_);
          return get_instance_aB_(0).init(undefined_am_,undefined_am_);}),
      _aA_,
      _aA_);
    do_at_exit_aj_(0);
    return;}
  ());
