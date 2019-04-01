package ${packgeDO.daoPackageName}.impl;
<#assign len = domain.className?index_of("DO")>
<#if use_statement_name_spaces?string=="1">
	<#assign ibatis_class_dao="${domain.packageName}.${domain.className?substring(0,len)}Mapper.Mybatis${domain.className?substring(0,len)}DAO">
<#else>
	<#assign ibatis_class_dao="Mybatis${domain.className?substring(0,len)}DAO">
</#if>
<#assign param="${domain.className?uncap_first}">

import java.util.List;

<#if bean_is_auto_wire?string=="1">
import org.springframework.stereotype.Component;
</#if>
import ${packgeDO.daoPackageName}.${domain.className?substring(0,len)}DAO;
import ${domain.packageName}.${domain.className};

<#if bean_is_auto_wire?string=="1">
@Component(value="${domain.className?substring(0,len)?uncap_first}DAO")
</#if>
public class ${domain.className?substring(0,len)}DAOImpl extends BaseDAOImpl implements ${domain.className?substring(0,len)}DAO {
<#assign getPrimaryMethod="get${tableDO.primaryProperty?cap_first}()">
	
	public Long insert(${domain.className} ${param}){
		int i = getSqlSession().insert("${ibatis_class_dao}_insert", ${param});
		if (i > 0) {
			return Long.valueOf(${param}.${getPrimaryMethod});
		}
		return 0L;
	}

	@Override
	public Integer update(${domain.className} ${param}){
		return getSqlSession().update("${ibatis_class_dao}_updateById", ${param});
	}

	@Override
	public Integer deleteById(Long id){
		return getSqlSession().delete("${ibatis_class_dao}_deleteById", id);
	}

	@Override
	public Integer updateDynamic(${domain.className} ${param}){
		return getSqlSession().update("${ibatis_class_dao}_update_dynamic", ${param});
	}

	@Override
	public ${domain.className} selectById(Long id){
		return getSqlSession().selectOne("${ibatis_class_dao}_selectById", id);
	}

	@Override
	public Long selectCountDynamic(${domain.className} ${param}){
		return getSqlSession().selectOne("${ibatis_class_dao}_select_dynamic_count", ${param});
	}

	@Override
	public List<${domain.className}> selectDynamic(${domain.className} ${param}){
		return getSqlSession().selectList("${ibatis_class_dao}_select_dynamic", ${param});
	}

	@Override
	public List<${domain.className}> selectDynamicPageQuery(${domain.className} ${param}){
		return getSqlSession().selectList("${ibatis_class_dao}_select_dynamic_page_query", ${param});
	}

}
