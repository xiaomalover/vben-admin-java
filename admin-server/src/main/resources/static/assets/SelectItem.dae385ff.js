import{D as e,bo as t,j as s,a0 as i,F as n,G as a,K as o,L as d,w as r,a4 as l,N as p}from"./vendor.54f9b785.js";import{c as m}from"./index.e2f51ec9.js";import{b as c}from"./index.0821d394.js";import"./index.27007487.js";/* empty css              *//* empty css              */import"./index.190d5090.js";import"./index.4e2c348d.js";import"./useWindowSizeFn.51649442.js";import"./useContentViewHeight.8c473bc3.js";/* empty css              */import"./useSortable.8cc8dd2e.js";import"./lock.66dce97a.js";var u=e({name:"SelectItem",components:{Select:t},props:{event:{type:Number},disabled:{type:Boolean},title:{type:String},def:{type:[String,Number]},initValue:{type:[String,Number]},options:{type:Array,default:()=>[]}},setup(e){const{prefixCls:t}=m("setting-select-item");return{prefixCls:t,handleChange:function(t){e.event&&c(e.event,t)},getBindValue:s((()=>e.def?{value:e.def,defaultValue:e.initValue||e.def}:{}))}}});u.render=function(e,t,s,m,c,u){const f=i("Select");return n(),a("div",{class:p(e.prefixCls)},[o("span",null,d(e.title),1),r(f,l(e.getBindValue,{class:`${e.prefixCls}-select`,onChange:e.handleChange,disabled:e.disabled,size:"small",options:e.options}),null,16,["class","onChange","disabled","options"])],2)},u.__scopeId="data-v-2dba4940";export{u as default};
