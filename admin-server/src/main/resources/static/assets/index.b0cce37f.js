"undefined"!=typeof require&&require;var e=(e,t,n)=>new Promise(((i,a)=>{var o=e=>{try{s(n.next(e))}catch(t){a(t)}},r=e=>{try{s(n.throw(e))}catch(t){a(t)}},s=e=>e.done?i(e.value):Promise.resolve(e.value).then(o,r);s((n=n.apply(e,t)).next())}));import{_ as t,u as n}from"./useTable.e6b840ff.js";import{_ as i}from"./useForm.91b099eb.js";import{g as a,L as o,a as r}from"./system.194fce67.js";import{z as s,y as d,D as l,a0 as c,bc as m,F as u,G as p,w as f,a5 as h,H as b,ad as x}from"./vendor.54f9b785.js";import{i as j}from"./index.29cb9d1e.js";/* empty css              */import"./index.8c033639.js";/* empty css              *//* empty css              */import"./onMountedOrActivated.fcde6c3c.js";import"./useWindowSizeFn.51649442.js";import"./useContentViewHeight.e2ebf036.js";/* empty css              *//* empty css              *//* empty css              */import"./index.9981dd62.js";/* empty css              */import"./useSortable.15816348.js";/* empty css              *//* empty css              */const w=[{title:"操作内容",dataIndex:"name",width:100},{title:"操作人",dataIndex:"username",width:100},{title:"操作IP",dataIndex:"ip",width:100},{title:"请求地址",dataIndex:"requestUrl",width:100},{title:"请求方法",dataIndex:"requestType",width:50},{title:"请求参数",dataIndex:"requestParam",width:300},{title:"请求耗时(毫秒)",dataIndex:"costTime",width:80},{title:"操作时间",dataIndex:"createdAt",width:100,customRender:({record:e})=>s((()=>d(1e3*e.createdAt).format("YYYY-MM-DD HH:mm:ss")))}],g=[{field:"key",label:"关键字",component:"Input",colProps:{span:8}},{field:"startDate",label:"开始时间",component:"DatePicker",colProps:{span:4}},{field:"endDate",label:"结束时间",component:"DatePicker",colProps:{span:4}}];var y=l({name:"LogManagement",components:{BasicTable:t,TableAction:i},setup(){const[t,{reload:i}]=n({title:"系统日志列表",api:a,columns:w,formConfig:{labelWidth:120,schemas:g},useSearchForm:!0,showTableSetting:!0,bordered:!0,showIndexColumn:!1,actionColumn:{width:80,title:"操作",dataIndex:"action",slots:{customRender:"action"},fixed:void 0}});function d(){i()}return{registerTable:t,handleDelete:function(t){return e(this,null,(function*(){(yield o(t.id))&&d()}))},handleClear:function(){return e(this,null,(function*(){const{createConfirm:t}=j();t({iconType:"warning",title:()=>s("span","清空日志"),content:()=>s("span","即将删除所有日志记录，是否确定？"),onOk:()=>e(this,null,(function*(){(yield r())&&d()}))})}))},handleSuccess:d}}});const I=x(" 清空日志 ");y.render=function(e,t,n,i,a,o){const r=c("a-button"),s=c("TableAction"),d=c("BasicTable"),l=m("auth");return u(),p("div",null,[f(d,{onRegister:e.registerTable},{toolbar:h((()=>[b(f(r,{type:"primary",onClick:e.handleClear},{default:h((()=>[I])),_:1},8,["onClick"]),[[l,"log:btn:clear"]])])),action:h((({record:t})=>[f(s,{actions:[{icon:"ant-design:delete-outlined",color:"error",auth:["log:btn:delete"],popConfirm:{title:"是否确认删除",confirm:e.handleDelete.bind(null,t)}}]},null,8,["actions"])])),_:1},8,["onRegister"])])};export{y as default};