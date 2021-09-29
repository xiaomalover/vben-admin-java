var e=Object.defineProperty,t=Object.defineProperties,a=Object.getOwnPropertyDescriptors,s=Object.getOwnPropertySymbols,r=Object.prototype.hasOwnProperty,n=Object.prototype.propertyIsEnumerable,l=(t,a,s)=>a in t?e(t,a,{enumerable:!0,configurable:!0,writable:!0,value:s}):t[a]=s,o=(e,t)=>{for(var a in t||(t={}))r.call(t,a)&&l(e,a,t[a]);if(s)for(var a of s(t))n.call(t,a)&&l(e,a,t[a]);return e},i=(e,s)=>t(e,a(s));"undefined"!=typeof require&&require;import{B as u}from"./index.0db43716.js";import{c,ab as p,t as d,ac as f,ad as b,ae as m,af as y,d as j}from"./index.97957499.js";import{D as v,r as O,j as h,u as g,w as x,bh as w,bi as D,a4 as P,bj as E,ah as S,F as C,a1 as M,a5 as W}from"./vendor.54f9b785.js";import{getDescSchema as $}from"./data.72e0c9e8.js";const B=y(v({name:"Description",props:{useCollapse:{type:Boolean,default:!0},title:{type:String,default:""},size:{type:String,validator:e=>["small","default","middle",void 0].includes(e),default:"small"},bordered:{type:Boolean,default:!0},column:{type:[Number,Object],default:()=>({xxl:4,xl:3,lg:3,md:3,sm:2,xs:1})},collapseOptions:{type:Object,default:null},schema:{type:Array,default:()=>[]},data:{type:Object}},emits:["register"],setup(e,{slots:t,emit:a}){const s=O(null),{prefixCls:r}=c("description"),n=p(),l=h((()=>o(o({},e),g(s)))),u=h((()=>i(o({},g(l)),{title:void 0}))),m=h((()=>!!g(l).title)),y=h((()=>o({canExpand:!1},g(u).collapseOptions))),j=h((()=>o(o({},g(n)),g(u))));function v({label:e,labelMinWidth:t,labelStyle:a}){if(!a&&!t)return e;const s=i(o({},a),{minWidth:`${t}px `});return x("div",{style:s},[e])}const S=()=>{let e;return x(w,P({class:`${r}`},g(j)),"function"==typeof(t=e=function(){const{schema:e,data:t}=g(u);return g(e).map((e=>{const{render:a,field:s,span:r,show:n,contentMinWidth:l}=e;if(n&&d(n)&&!n(t))return null;const o=()=>{var e;const t=null==(e=g(u))?void 0:e.data;if(!t)return null;const r=E(t,s);return d(a)?a(r,t):null!=r?r:""},i=l;return x(w.Item,{label:v(e),key:s,span:r},{default:()=>l?x("div",{style:{minWidth:`${i}px`}},[o()]):o()})})).filter((e=>!!e))}())||"[object Object]"===Object.prototype.toString.call(t)&&!D(t)?e:{default:()=>[e]});var t};return a("register",{setDescProps:function(e){s.value=o(o({},g(s)),e)}}),()=>g(m)?(()=>{const a=e.useCollapse?S():x("div",null,[S()]);if(!e.useCollapse)return a;const{canExpand:s,helpMessage:r}=g(y),{title:n}=g(l);return x(b,{title:n,canExpan:s,helpMessage:r},{default:()=>a,action:()=>f(t,"action")})})():S()}}));var q=v({props:{info:{type:Object,default:null}},setup(e){const{t:t}=j(),[a]=function(e){if(!S())throw new Error("useDescription() can only be used inside setup() or functional components!");const t=O(null),a=O(!1);return[function(s){g(a)&&m()||(t.value=s,e&&s.setDescProps(e),a.value=!0)},{setDescProps:e=>{var a;null==(a=g(t))||a.setDescProps(e)}}]}({column:2,schema:$()});return(s,r)=>(C(),M(g(u),P({width:800,title:g(t)("sys.errorLog.tableActionDesc")},s.$attrs),{default:W((()=>[x(g(B),{data:e.info,onRegister:g(a)},null,8,["data","onRegister"])])),_:1},16,["title"]))}});export{q as _};
