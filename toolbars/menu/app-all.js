/*
Copyright(c) 2012 Company Name
*/
function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_from_array(b){return b.slice(1)}function caml_js_fun_call(b,a){return b.apply(null,a.slice(1))}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[undefined];return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var X=new MlString("Pervasives.do_at_exit"),au=new MlString('You clicked the "icon only" button.'),aR=new MlString("Button Click"),bb=new MlString("You chose {0}."),a=new MlString("Color Selected"),x=new MlString('<span style="color:#'),o=new MlString(';">You choose {0}.</span>'),aw=new MlString("Color Selected"),aT=new MlString("M j, Y"),bd=new MlString("You choose {0}."),c=new MlString("Date Selected"),z=new MlString("Ext.menu.DatePicker"),V=new MlString("Ext.menu.ColorPicker"),aq=new MlString("state"),aO=new MlString("abbr"),a9=new MlString("Ext.data.ArrayStore"),bu=new MlString("no-icon"),v=new MlString("Select a state..."),T=new MlString("all"),an=new MlString("local"),aM=new MlString("state"),a7=new MlString("Ext.form.field.ComboBox"),bs=new MlString("Choose a Color"),t=new MlString("calendar"),P=new MlString("Choose a Date"),ak=new MlString("theme"),aJ=new MlString("Default Theme"),a5=new MlString("theme"),bq=new MlString("Gray Theme"),r=new MlString("theme"),M=new MlString("Vista Black"),ah=new MlString("theme"),aH=new MlString("Aero Glass"),a2=new MlString('<b class="menu-title">Choose a Theme</b>'),bn=new MlString("Radio Options"),m=new MlString("-"),K=new MlString("I like Ext"),ae=new MlString("visible"),aE=new MlString("mainMenu"),aZ=new MlString("Ext.menu.Menu"),bk=new MlString("Ext.toolbar.Toolbar"),j=new MlString("toolbar"),F=new MlString("Toggle Me"),ab=new MlString("-"),s=new MlString("Extellent!"),N=new MlString("More Colors..."),aj=new MlString("-"),aI=new MlString("Ext.ColorPalette"),a4=new MlString("Pick a Color"),bp=new MlString("-"),p=new MlString("<u>Underline</u>"),L=new MlString("<i>Italic</i>"),af=new MlString("<b>Bold</b>"),aG=new MlString("blist"),a1=new MlString("Tip Title"),bm=new MlString("This is a an example QuickTip for a toolbar item"),l=new MlString("Split Button"),J=new MlString("Ext.button.Split"),ad=new MlString("small"),aD=new MlString("Who is online?"),aY=new MlString("small"),bj=new MlString("Import"),i=new MlString("Add user"),E=new MlString("add"),aa=new MlString("edit"),aA=new MlString("User<br/>manager"),aV=new MlString("left"),bf=new MlString("large"),f=new MlString("button"),B=new MlString("User options"),aQ=new MlString("buttongroup"),n=new MlString("menu"),bl=new MlString("user"),k=new MlString("Users"),G=new MlString("bmenu"),ac=new MlString("Button w/ Menu"),aB=new MlString(" "),aX=new MlString("Dynamically added Item"),bh=new MlString("click"),h=new MlString("disableMe"),D=new MlString("Disabled Item"),Z=new MlString("disableMe"),az=new MlString("-"),aU=new MlString("mousedown"),be=new MlString("<b>Quick Tips</b><br/>Icon only button with tooltip<br><b>Activated on mousedown</b>"),d=new MlString("x-btn-icon"),A=new MlString("list-items.gif"),W=new MlString("-"),ar=new MlString("Ext.menu.Menu"),aP=new MlString("Item "),ba=new MlString("Scrolling Menu"),bv=new MlString("x-btn-text-icon"),w=new MlString("preview.png"),S=new MlString("This is a link. You can right click. You can see where it will take you"),am=new MlString("html+anchor+tag"),aL=new MlString("http://www.google.com/search"),a6=new MlString("Link"),br=new MlString("Select a state..."),aW=new MlString("all"),bg=new MlString("local"),g=new MlString("state"),C=new MlString("Ext.form.field.ComboBox"),Y=new MlString('Button "{0}" was toggled to {1}.'),ay=new MlString("Button Toggled"),aS=new MlString("checked"),bc=new MlString("unchecked"),b=new MlString('You {1} the "{0}" menu item.'),y=new MlString("Item Check"),U=new MlString('You clicked the "{0}" menu item.'),ap=new MlString("Menu Click"),aN=new MlString('You clicked the "{0}" button.'),a8=new MlString("Button Click"),bt=new MlString("Ext.container.ButtonGroup"),u=new MlString("Ext.layout.container.Table"),R=new MlString("Ext.form.field.ComboBox"),al=new MlString("Ext.menu.*"),aK=new MlString("Ext.tip.QuickTipManager");function bo(bw){return function(by){var bz=by;for(;;){if(bz){var bx=bz[2];try{}catch(bA){}var bz=bx;continue}return 0}}(caml_ml_out_channels_list(0))}function ao(bw){return bo(0)}caml_register_named_value(X,ao);var e=[0,0],ag=undefined,q=true,Q=false;function bi(bw){e[1]=[0,bw,e[1]];return 0}var O=Array;bi(function(bw){return bw instanceof O?0:[0,new MlWrappedString(bw.toString())]});function aC(bw){return bw}aC(window.HTMLElement)===ag;var H=function(bw){return Ext}(0),a0=function(bw){return Ext.Date}(0),aF=undefined;function ai(bw){return Ext.tip.QuickTipManager}H.require(caml_js_from_array([0,aK.toString(),al.toString(),R.toString(),u.toString(),bt.toString()]),ag,ag,ag);function I(bw){return caml_js_fun_call(Ext.example.msg,bw)}function a3(bx,bw){return I([0,a8.toString(),aN.toString(),bx.text])}function at(bw,bx){return I([0,ap.toString(),U.toString(),bw.text])}function av(bx,bw){var by=bw|0?aS.toString():bc.toString();return I([0,y.toString(),b.toString(),bx.text,by])}function ax(bx,bw){return I([0,ay.toString(),Y.toString(),bx.text,bw])}H.onReady(caml_js_wrap_callback(function(cG){ai(0).init(ag,ag);var b9=aC({handler:caml_js_wrap_callback(function(c9,c8){var c7=a0.format(c8,aT.toString());return I([0,c.toString(),bd.toString(),c7])})}),ct=H.create(aC(z.toString()),b9),cd=aC({handler:caml_js_wrap_callback(function(da,c9,c8){var c7=x.toString().concat(c9,o.toString());return I([0,aw.toString(),c7,c9])})}),cp=H.create(aC(V.toString()),cd),bI=aC({fields:caml_js_from_array([0,aO.toString(),aq.toString()]),data:Ext.example.states}),c5=H.create(aC(a9.toString()),bI),bK=bu.toString(),b0=v.toString(),ch=T.toString(),cw=an.toString(),cK=aM.toString(),c4=aC({hideLabel:q,store:c5,displayField:aM.toString(),typeAhead:q,queryMode:an.toString(),triggerAction:T.toString(),emptyText:v.toString(),selectOnFocus:q,width:135,iconCls:bu.toString()}),cT=H.create(aC(a7.toString()),c4),bE=t.toString(),cj=ak.toString(),cz=a5.toString(),cN=r.toString(),c6=ah.toString(),cV={items:caml_js_from_array([0,a2.toString(),{text:aH.toString(),checked:q,group:ah.toString(),checkHandler:caml_js_wrap_callback(av)},{text:M.toString(),checked:Q,group:r.toString(),checkHandler:caml_js_wrap_callback(av)},{text:bq.toString(),checked:Q,group:a5.toString(),checkHandler:caml_js_wrap_callback(av)},{text:aJ.toString(),checked:Q,group:ak.toString(),checkHandler:caml_js_wrap_callback(av)}])},b1=caml_js_from_array([0,cT,{text:K.toString(),checked:q,checkHandler:caml_js_wrap_callback(av)},m.toString(),{text:bn.toString(),menu:{items:caml_js_from_array([0,a2.toString(),{text:aH.toString(),checked:q,group:ah.toString(),checkHandler:caml_js_wrap_callback(av)},{text:M.toString(),checked:Q,group:r.toString(),checkHandler:caml_js_wrap_callback(av)},{text:bq.toString(),checked:Q,group:a5.toString(),checkHandler:caml_js_wrap_callback(av)},{text:aJ.toString(),checked:Q,group:ak.toString(),checkHandler:caml_js_wrap_callback(av)}])}},{text:P.toString(),iconCls:t.toString(),menu:ct},{text:bs.toString(),menu:cp}]),bO={overflow:ae.toString()},bM=aC({id:aE.toString(),style:{overflow:ae.toString()},items:caml_js_from_array([0,cT,{text:K.toString(),checked:q,checkHandler:caml_js_wrap_callback(av)},m.toString(),{text:bn.toString(),menu:{items:caml_js_from_array([0,a2.toString(),{text:aH.toString(),checked:q,group:ah.toString(),checkHandler:caml_js_wrap_callback(av)},{text:M.toString(),checked:Q,group:r.toString(),checkHandler:caml_js_wrap_callback(av)},{text:bq.toString(),checked:Q,group:a5.toString(),checkHandler:caml_js_wrap_callback(av)},{text:aJ.toString(),checked:Q,group:ak.toString(),checkHandler:caml_js_wrap_callback(av)}])}},{text:P.toString(),iconCls:t.toString(),menu:ct},{text:bs.toString(),menu:cp}])}),c3=H.create(aC(aZ.toString()),bM),ce=H.create(aC(bk.toString()),ag);ce.render(j.toString());ce.suspendLayouts();var cr=Ext.example.states,cD=135,cU=caml_js_wrap_callback(av),bC=caml_js_wrap_callback(av),bS=caml_js_wrap_callback(av),b6=caml_js_wrap_callback(av),cn=caml_js_wrap_callback(av),cB=caml_js_wrap_callback(ax),cS={text:F.toString(),enableToggle:q,toggleHandler:caml_js_wrap_callback(ax),pressed:q},bz=ab.toString(),bQ=caml_js_wrap_callback(at),c1={text:s.toString(),handler:caml_js_wrap_callback(at)},cl=caml_js_wrap_callback(at),cX={text:N.toString(),handler:caml_js_wrap_callback(at)},cP=aj.toString(),b7=aC({listeners:{select:caml_js_wrap_callback(function(c8,c9,c7){return I([0,a.toString(),bb.toString(),c9])})}}),bU=caml_js_from_array([0,H.create(aC(aI.toString()),b7),cP,cX]),cq={showSeparator:Q,items:caml_js_from_array([0,H.create(aC(aI.toString()),b7),cP,cX])},cC={items:caml_js_from_array([0,{text:af.toString(),handler:caml_js_wrap_callback(at)},{text:L.toString(),handler:caml_js_wrap_callback(at)},{text:p.toString(),handler:caml_js_wrap_callback(at)},bp.toString(),{text:a4.toString(),handler:caml_js_wrap_callback(at),menu:cq},c1])},cQ=aG.toString(),bw=a1.toString(),cI={text:bm.toString(),title:a1.toString()},cm=aC({text:l.toString(),handler:caml_js_wrap_callback(a3),tooltip:{text:bm.toString(),title:a1.toString()},iconCls:aG.toString(),menu:{items:caml_js_from_array([0,{text:af.toString(),handler:caml_js_wrap_callback(at)},{text:L.toString(),handler:caml_js_wrap_callback(at)},{text:p.toString(),handler:caml_js_wrap_callback(at)},bp.toString(),{text:a4.toString(),handler:caml_js_wrap_callback(at),menu:cq},c1])}}),b5=H.create(aC(J.toString()),cm),cY=ad.toString(),bF=aD.toString(),bV=aY.toString(),b8=bj.toString(),cs=i.toString(),cE=aa.toString(),cW=caml_js_from_array([0,{text:aA.toString(),iconCls:aa.toString(),width:90},{iconCls:E.toString(),tooltip:i.toString(),width:40},{colspan:2,text:bj.toString(),scale:aY.toString(),width:130},{colspan:2,text:aD.toString(),scale:ad.toString(),width:130}]),bD=aV.toString(),bT=bf.toString(),bL={xtype:f.toString(),scale:bf.toString(),iconAlign:aV.toString()},co=B.toString(),bW={xtype:aQ.toString(),title:B.toString(),columns:2,defaults:{xtype:f.toString(),scale:bf.toString(),iconAlign:aV.toString()},items:caml_js_from_array([0,{text:aA.toString(),iconCls:aa.toString(),width:90},{iconCls:E.toString(),tooltip:i.toString(),width:40},{colspan:2,text:bj.toString(),scale:aY.toString(),width:130},{colspan:2,text:aD.toString(),scale:ad.toString(),width:130}])},ca={xtype:n.toString(),plain:q,items:{xtype:aQ.toString(),title:B.toString(),columns:2,defaults:{xtype:f.toString(),scale:bf.toString(),iconAlign:aV.toString()},items:caml_js_from_array([0,{text:aA.toString(),iconCls:aa.toString(),width:90},{iconCls:E.toString(),tooltip:i.toString(),width:40},{colspan:2,text:bj.toString(),scale:aY.toString(),width:130},{colspan:2,text:aD.toString(),scale:ad.toString(),width:130}])}},bA=bl.toString(),bR=G.toString();ce.add({text:ac.toString(),iconCls:G.toString(),menu:c3},{text:k.toString(),iconCls:bl.toString(),menu:{xtype:n.toString(),plain:q,items:{xtype:aQ.toString(),title:B.toString(),columns:2,defaults:{xtype:f.toString(),scale:bf.toString(),iconAlign:aV.toString()},items:caml_js_from_array([0,{text:aA.toString(),iconCls:aa.toString(),width:90},{iconCls:E.toString(),tooltip:i.toString(),width:40},{colspan:2,text:bj.toString(),scale:aY.toString(),width:130},{colspan:2,text:aD.toString(),scale:ad.toString(),width:130}])}}},b5,bz,cS);c3.add(aB.toString());var bY=c3.add({text:aX.toString()});bY.on(bh.toString(),caml_js_wrap_callback(at));var cu=h.toString();c3.add({text:D.toString(),id:h.toString()});c3.items.get(Z.toString()).disable();var cg=caml_js_wrap_callback(at),cx=caml_js_wrap_callback(at),cL=caml_js_wrap_callback(at),c2=caml_js_wrap_callback(at),bJ=caml_js_wrap_callback(a3),bX=130,cc=130,cv=40,cH=90,cZ=2,bG=az.toString(),bB=caml_js_wrap_callback(function(c7,c8){return I([0,aR.toString(),au.toString()])}),cJ=aU.toString(),c0=be.toString(),bH=d.toString();ce.add(W.toString(),{icon:A.toString(),cls:d.toString(),tooltip:be.toString(),clickEvent:aU.toString(),handler:bB},bG);var by=H.create(aC(ar.toString()),ag),cf=0,bZ=49;if(!(bZ<cf)){var b3=cf;for(;;){var cF=aP.toString();by.add({text:cF.concat((b3+1|0).toString()),handler:caml_js_wrap_callback(at)});var cy=caml_js_wrap_callback(at),cM=b3+1|0;if(bZ!==b3){var b3=cM;continue}break}}var b2=ba.toString(),ci=bv.toString();ce.add({icon:w.toString(),cls:bv.toString(),text:ba.toString(),menu:by});var cO=S.toString(),cb={q:am.toString()},bN=aL.toString();ce.add({text:a6.toString(),url:aL.toString(),baseParams:{q:am.toString()},tooltip:S.toString()});var bP=br.toString(),b4=aW.toString(),ck=bg.toString(),cA=g.toString(),bx=aC({hideLabel:q,store:c5,displayField:g.toString(),typeAhead:q,queryMode:bg.toString(),triggerAction:aW.toString(),emptyText:br.toString(),selectOnFocus:q,width:135});ce.add(H.create(aC(C.toString()),bx));var cR=135;return ce.resumeLayouts(q)}),aF,aF);ao(0);return}());