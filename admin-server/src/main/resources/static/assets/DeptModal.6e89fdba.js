var e=Object.defineProperty,t=Object.getOwnPropertySymbols,a=Object.prototype.hasOwnProperty,r=Object.prototype.propertyIsEnumerable,o=(t,a,r)=>a in t?e(t,a,{enumerable:!0,configurable:!0,writable:!0,value:r}):t[a]=r,l=("undefined"!=typeof require&&require,(e,t,a)=>new Promise(((r,o)=>{var l=e=>{try{s(a.next(e))}catch(t){o(t)}},n=e=>{try{s(a.throw(e))}catch(t){o(t)}},s=e=>e.done?r(e.value):Promise.resolve(e.value).then(l,n);s((a=a.apply(e,t)).next())})));import{B as n,b as s}from"./index.0db43716.js";import{g as i,h as d}from"./useForm.142882e6.js";import{z as p,bH as c,D as u,r as m,u as f,j as b,a0 as y,F as g,a1 as v,a5 as h,w as D,a4 as P}from"./vendor.54f9b785.js";/* empty css              */import{c as x,D as j,h as w}from"./system.c717e609.js";const I=[{title:"部门名称",dataIndex:"deptName",width:160,align:"left"},{title:"排序",dataIndex:"orderNo",width:50},{title:"状态",dataIndex:"status",width:80,customRender:({record:e})=>{const t=1==~~e.status,a=t?"启用":"停用";return p(c,{color:t?"green":"red"},(()=>a))}},{title:"创建时间",dataIndex:"createTime",width:180},{title:"备注",dataIndex:"remark"}],O=[{field:"deptName",label:"部门名称",component:"Input",colProps:{span:8}},{field:"status",label:"状态",component:"Select",componentProps:{options:[{label:"启用",value:1},{label:"停用",value:0}]},colProps:{span:8}}],F=[{field:"deptName",label:"部门名称",component:"Input",required:!0},{field:"parentDept",label:"上级部门",component:"TreeSelect",componentProps:{replaceFields:{title:"deptName",key:"id",value:"id"},getPopupContainer:()=>document.body}},{field:"orderNo",label:"排序",component:"InputNumber",required:!0},{field:"status",label:"状态",component:"RadioButtonGroup",defaultValue:1,componentProps:{options:[{label:"启用",value:1},{label:"停用",value:0}]},required:!0},{label:"备注",field:"remark",component:"InputTextArea"}];var M=u({name:"DeptModal",components:{BasicModal:n,BasicForm:i},emits:["success","register"],setup(e,{emit:n}){const i=m(!0),p=m(0),[c,{resetFields:u,setFieldsValue:y,updateSchema:g,validate:v}]=d({labelWidth:100,schemas:F,showActionButtonGroup:!1}),[h,{setModalProps:D,closeModal:P}]=s((e=>l(this,null,(function*(){yield u(),D({confirmLoading:!1}),i.value=!!(null==e?void 0:e.isUpdate),f(i)&&(p.value=e.record.id,yield y(((e,l)=>{for(var n in l||(l={}))a.call(l,n)&&o(e,n,l[n]);if(t)for(var n of t(l))r.call(l,n)&&o(e,n,l[n]);return e})({},e.record)));const l=yield x();yield g({field:"parentDept",componentProps:{treeData:l}})}))));return{registerModal:h,registerForm:c,getTitle:b((()=>f(i)?"编辑部门":"新增部门")),handleSubmit:function(){return l(this,null,(function*(){try{const e=yield v();D({confirmLoading:!0});let t="0";e.parentDept&&(e.parentDept=e.parentDept+"",t=e.parentDept.substring(e.parentDept.lastIndexOf("-")+1)),e.parentDept=t;let a=e;if(f(i)){a.id=p.value,(yield j(a))&&(P(),n("success"))}else{(yield w(a))&&(P(),n("success"))}}finally{D({confirmLoading:!1})}}))}}}});M.render=function(e,t,a,r,o,l){const n=y("BasicForm"),s=y("BasicModal");return g(),v(s,P(e.$attrs,{onRegister:e.registerModal,title:e.getTitle,onOk:e.handleSubmit}),{default:h((()=>[D(n,{onRegister:e.registerForm},null,8,["onRegister"])])),_:1},16,["onRegister","title","onOk"])};var S=Object.freeze({__proto__:null,[Symbol.toStringTag]:"Module",default:M});export{S as D,M as _,I as c,O as s};
