import{D as t,r as e,b1 as s,j as a,u as l,w as n,aS as i,b2 as r}from"./vendor.54f9b785.js";import{E as o,j as u,k as T,d as b,c,P as p}from"./index.e2f51ec9.js";var d=t({name:"ErrorPage",props:{status:{type:Number,default:o.PAGE_NOT_FOUND},title:{type:String,default:""},subTitle:{type:String,default:""},full:{type:Boolean,default:!1}},setup(t){const d=e(new Map),{query:x}=s(),f=u(),E=T(),{t:_}=b(),{prefixCls:y}=c("app-exception-page"),O=a((()=>{const{status:e}=x,{status:s}=t;return Number(e)||s})),m=a((()=>l(d).get(l(O)))),N=_("sys.exception.backLogin"),A=_("sys.exception.backHome");return l(d).set(o.PAGE_NOT_ACCESS,{title:"403",status:`${o.PAGE_NOT_ACCESS}`,subTitle:_("sys.exception.subTitle403"),btnText:t.full?N:A,handler:()=>t.full?f(p.BASE_LOGIN):f()}),l(d).set(o.PAGE_NOT_FOUND,{title:"404",status:`${o.PAGE_NOT_FOUND}`,subTitle:_("sys.exception.subTitle404"),btnText:t.full?N:A,handler:()=>t.full?f(p.BASE_LOGIN):f()}),l(d).set(o.ERROR,{title:"500",status:`${o.ERROR}`,subTitle:_("sys.exception.subTitle500"),btnText:A,handler:()=>f()}),l(d).set(o.PAGE_NOT_DATA,{title:_("sys.exception.noDataTitle"),subTitle:"",btnText:_("common.redo"),handler:()=>E(),icon:"/assets/no-data.f7e550cc.svg"}),l(d).set(o.NET_WORK_ERROR,{title:_("sys.exception.networkErrorTitle"),subTitle:_("sys.exception.networkErrorSubTitle"),btnText:_("common.redo"),handler:()=>E(),icon:"/assets/net-error.61b7e6df.svg"}),()=>{const{title:e,subTitle:s,btnText:a,icon:o,handler:u,status:T}=l(m)||{};return n(r,{class:y,status:T,title:t.title||e,"sub-title":t.subTitle||s},{extra:()=>a&&n(i,{type:"primary",onClick:u},{default:()=>a}),icon:()=>o?n("img",{src:o},null):null})}}});export{d as default};