package com.wcp.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class LoadQuery {
	 public List<Object> list = null;

	 public List<Object> query(String table) {
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery("from "+table);
	     list=(List<Object>)query.list();
		 return list;
	 }
	 
	 public List<Object> query(String table,String para,String value){
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery("from "+table+" where "+para+" = ?");
	     query.setParameter(0, value);
	     list=(List<Object>)query.list();
		 return list;
	 }
	 
	 public List<Object> query(String table,String para1,String value1,String para2,String value2){
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery("from "+table+" where "+para1+" = ? and "+para2+" = ?");
	     query.setParameter(0, value1);
	     query.setParameter(1, value2);
	     list=(List<Object>)query.list();
		 return list;
	 }
	 
	 
	 public int savein(Object u) {
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
         session.beginTransaction();
         // 操作
         session.save(u);
         // 事务提交
         session.getTransaction().commit();
         session.close();
         sessionFactory.close();
         return 0;
	}
	 
	 public int update(String hql) {
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
         session.beginTransaction();
         Query query = session.createQuery(hql);
         query.executeUpdate();
         session.getTransaction().commit();
         session.close();
         sessionFactory.close();
		 return 0;
	 }
}
