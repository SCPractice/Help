package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

public class GroupDAO extends BaseHibernateDAO implements IGroupDAO{
	
	public List findByHQL(String hql) {//查找组       根据HQL语句查询
		try {
			System.out.println("finding group instance by hql");
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setMaxResults(5);//只取5条记录
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}finally{
			getSession().close();
		}
	}

}
