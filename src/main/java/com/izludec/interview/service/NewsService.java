package com.izludec.interview.service;

import com.izludec.interview.domain.Ip_adress;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.izludec.interview.domain.News;
import java.util.Date;
import java.util.HashSet;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service("newsService")
@Transactional
public class NewsService {

   // protected static Logger logger = Logger.getLogger("service");
   
   @Resource(name="sessionFactory")
    private SessionFactory sessionFactory; 
   TelegramBot bot = new TelegramBot();
    
    public List<News> getAll() {
        
          //logger.debug("Retrieving all news");
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM  News");        
        return  query.list();
    }
    public void SessionClose(){
        sessionFactory.close();
    }
    public void sendMsg(String text){
    bot.sendMsg(text);
    }
    
    public HashSet<Ip_adress> getAdresses() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT Adress FROM  Ip_adress");
        HashSet<Ip_adress> adresses = new HashSet(query.list());        
        return  adresses;
    }
    
    public HashSet<Ip_adress> getAllAdresses() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM  Ip_adress");
        HashSet<Ip_adress> adresses = new HashSet(query.list());        
        return  adresses;
    }
    
    public void add_adr(Ip_adress adr) {
        Session session = sessionFactory.getCurrentSession();        
        session.save(adr);   
    }
    
    public List<News> getSearch(String word) {
        //logger.debug(word);
        Session session = sessionFactory.getCurrentSession();
        word = "%"+word+"%";
        String QUERY = "FROM  News WHERE TEXT LIKE ? OR HEAD LIKE ?";
        Query query = session.createQuery(QUERY).setString(0, word).setParameter(1, word);         
        return  query.list();
    }
    
    public List<News> getTag(String word) {
       // logger.debug(word);
        Session session = sessionFactory.getCurrentSession();
        word = "%"+word+"%";
        String QUERY = "FROM  News WHERE CATEGORY LIKE ?";
        Query query = session.createQuery(QUERY).setString(0, word);                 
        return  query.list();
    }
    
    
    public News get( Integer id ) {
        Session session = sessionFactory.getCurrentSession();
        News news = (News) session.get(News.class, id);           
        return news;
    }

    public void add(News news) {
        //logger.debug("Adding new news");
        Session session = sessionFactory.getCurrentSession();
        news.setDate(new Date());
        session.save(news);        
    }


    public void delete(Integer id) {
        //logger.debug("Deleting existing news");
        Session session = sessionFactory.getCurrentSession();
        News news = (News) session.get(News.class, id);
        session.delete(news);       
       
    }


    public void edit(News news) {
       // logger.debug("Editing existing news");
        Session session = sessionFactory.getCurrentSession();
        News existingNews = (News) session.get(News.class, news.getId());
        existingNews.setHead(news.getHead());
        existingNews.setText(news.getText());
        existingNews.setDate(news.getDate());
        existingNews.setCategory(news.getCategory());
        session.save(existingNews);    
        
    }
}
