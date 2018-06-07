package com.wcp.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class LoadQuery {
	 public List<Object> list = null;
	 
	 public List<Object> queryHQL(String hql){
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery(hql);
	     list=(List<Object>)query.list();
	     session.close();
         sessionFactory.close();
		 return list;
	 }
	 public List<Object> query(String table) {
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery("from "+table);
	     list=(List<Object>)query.list();
	     session.close();
         sessionFactory.close();
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
	     try {
		     list=(List<Object>)query.list();
		     System.out.println(list.toString());
	     }catch(Exception e) {
	    	 e.printStackTrace();
	    	 list=new ArrayList<Object>();
	     }
	     session.close();
         sessionFactory.close();
    	 return list;
	 }
	 public Object queryRTN(String table,String para,String value,String rtnPara){
		 list = null;
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
	     session.beginTransaction();
	     Query query = session.createQuery("from "+table+" where "+para+" = ?");
	     if(para.equals("ID")) {
	    	 query.setInteger(0, Integer.valueOf(value));
	     }else {
	    	 query.setParameter(0, value);
	     }
	     list=(List<Object>)query.list();
	     session.close();
         sessionFactory.close();
	     if(list.isEmpty()) {
	    	 return null;
	     }else {
	    	 Object rtn=list.get(0);
	    	 return rtn;
	     }
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
         session.saveOrUpdate(u);
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
	 public int delect(Object u) {
		 Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
		 SessionFactory sessionFactory=config.buildSessionFactory();
		 Session session=sessionFactory.openSession();// 相当于得到一个Connection
		 // 开启事务
         session.beginTransaction();
         // 操作
         session.delete(u);
         // 事务提交
         session.getTransaction().commit();
         session.close();
         sessionFactory.close();
         return 0;
	 }
}
