package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

public class GroupDAO extends BaseHibernateDAO implements IGroupDAO{
	
	public List findByHQL(String hql) {//������       ����HQL����ѯ
		try {
			System.out.println("finding group instance by hql");
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setMaxResults(5);//ֻȡ5����¼
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}finally{
			getSession().close();
		}
	}

}
