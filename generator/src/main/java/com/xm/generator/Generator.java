package com.xm.generator;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.BeetlTemplateEngine;

import java.util.*;

/**
 * 代码生成器
 */
public class Generator {

    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    private static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        System.out.println(("请输入" + tip + "："));
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if (StringUtils.isNotBlank(ipt)) {
                return ipt;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    public static void main(String[] args) {


        String rootPath = System.getProperty("user.dir");

        String projectName = "admin-server";
        String packageName = "admin";
        String moduleName = "sys";
        String superEntityClass = "com.xm.common.entity.BaseEntity";

        List<String> tableNameList = Arrays.asList("sys_admin", "sys_admin_log", "sys_department", "sys_permission", "sys_role", "sys_role_permission");

        System.out.println("#########################################################################################");
        System.out.println("项目名(如管理后台，输入admin-server):" + projectName);
        System.out.println("包名(即com.xm.xxx中最后的xxx的名字):" + packageName);
        System.out.println("模块名:" + moduleName);
        System.out.println("实体父类名：（BaseEntity【自增ID带创建和修改时间，创建修改人字段】 或 BaseSimpleEntity【自增ID带创建和修改时间】）:" + superEntityClass);
        System.out.println("表名：" + CollectionUtil.join(tableNameList, ","));
        System.out.println("#########################################################################################");
        String confirm = scanner("确认开始吗？Y/N");

        if ( !"Y".equals(confirm) && !"y".equals(confirm) ) {
            return;
        }

        for ( String tableName : tableNameList ) {

            // 代码生成器
            AutoGenerator mpg = new AutoGenerator();

            // 全局配置
            GlobalConfig gc = new GlobalConfig();

            //String projectName = scanner("项目名(如管理后台，输入admin-server)");
            gc.setOutputDir(rootPath + "/" + projectName + "/src/main/java");
            gc.setAuthor("xiaomalover <xiaomalover@gmail.com>");
            gc.setOpen(false);
            mpg.setGlobalConfig(gc);

            // 数据源配置
            DataSourceConfig dsc = new DataSourceConfig();
            dsc.setUrl("jdbc:mysql://mysql.xm.me:3306/skeleton?useUnicode=true&useSSL=false&characterEncoding=utf8");
            dsc.setDriverName("com.mysql.cj.jdbc.Driver");
            dsc.setUsername("root");
            dsc.setPassword("root");
            mpg.setDataSource(dsc);

            // 包配置
            //String packageName = scanner("包名(即com.xm.xxx中最后的xxx的名字)");
            //String moduleName = scanner("模块名");
            PackageConfig pc = new PackageConfig();
            pc.setModuleName(packageName + ".module." + moduleName);
            pc.setParent("com.xm");
            pc.setMapper("mapper");
            pc.setService("service");
            pc.setServiceImpl("service.impl");

            mpg.setPackageInfo(pc);

            // 自定义配置
            InjectionConfig cfg = new InjectionConfig() {
                @Override
                public void initMap() {
                    // to do nothing
                }
            };

            Map<String, Object> params = new HashMap<>();
            params.put("requestMappingPrefix", "/" + moduleName);
            cfg.setMap(params);

            String templatePath = "/templates/mapper.xml.btl";

            // 自定义输出配置
            List<FileOutConfig> focList = new ArrayList<>();
            // 自定义配置会被优先输出
            focList.add(new FileOutConfig(templatePath) {
                @Override
                public String outputFile(TableInfo tableInfo) {
                    // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                    return rootPath + "/" + projectName + "/src/main/resources/mapper/" + moduleName
                            + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
                }
            });

            cfg.setFileOutConfigList(focList);
            mpg.setCfg(cfg);

            // 配置模板
            TemplateConfig templateConfig = new TemplateConfig();

            templateConfig.setXml(null);
            mpg.setTemplate(templateConfig);

            // 策略配置
            StrategyConfig strategy = strategy = new StrategyConfig();

            strategy.setNaming(NamingStrategy.underline_to_camel);
            strategy.setColumnNaming(NamingStrategy.underline_to_camel);
            if ( StringUtils.isNotBlank(superEntityClass) ) {
                //"com.xm.common.entity." + scanner("实体类名：（BaseEntity【自增ID带创建和修改时间，创建修改人字段】 或 BaseSimpleEntity【自增ID带创建和修改时间】）"));
                strategy.setSuperEntityClass(superEntityClass);
            }

            strategy.setEntityLombokModel(true);
            strategy.setRestControllerStyle(true);
            strategy.setInclude(tableName);
            strategy.setSuperEntityColumns("id");
            strategy.setControllerMappingHyphenStyle(true);
            strategy.setTablePrefix(pc.getModuleName() + "_");
            mpg.setStrategy(strategy);
            mpg.setTemplateEngine(new BeetlTemplateEngine());
            mpg.execute();

        }

    }
}
