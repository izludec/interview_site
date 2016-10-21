package com.izludec.interview.controller;

import com.izludec.interview.domain.Ip_adress;
import com.izludec.interview.domain.News;
import com.izludec.interview.service.NewsService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/main")
public class MainController {

   //protected static Logger logger = Logger.getLogger("service");
    
    @Resource(name="newsService")
    private NewsService newsService;
    
    
    @RequestMapping(value = "/news/login", method = RequestMethod.GET)
	public String signin(HttpServletRequest request) {          
        newsService.sendMsg("Зашел как администратор. Ip: "+request.getRemoteAddr());
	return "login";
    }
	
    @RequestMapping(value = "/news/login-failure", method = RequestMethod.GET)
        public String signinFailure() {
    	return "login_failure";
    }
        
@RequestMapping(value = "/news/visits", method = RequestMethod.GET)
    public String getVisits(Model model) {  
        HashSet<Ip_adress> hset = newsService.getAllAdresses();
        List<Ip_adress> list = new ArrayList<Ip_adress>(hset);        
        Collections.sort(list,new Comparator<Ip_adress>() {
            public int compare(Ip_adress adress1, Ip_adress adress2)
        {return  adress2.getId().compareTo(adress1.getId());}
        });
        model.addAttribute("visits_list", list);
        newsService.SessionClose();
        return "visits";
    }
   

  @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String getNews(@RequestParam(value="page", required=false) Integer page, Model model,HttpServletRequest request) {
        
        List<News> news = newsService.getAll();
        Ip_adress adr = new Ip_adress();        
        adr.setAdress(request.getRemoteAddr());              
        newsService.sendMsg("Зашел на главную страницу. Ip: ");
        adr.setDate(new Date());
        newsService.add_adr(adr);
        int count = newsService.getAdresses().size();
        if (page==null) page=1;
        
        Collections.sort(news,new Comparator<News>() {
            public int compare(News news1, News news2)
        {return  news2.getId().compareTo(news1.getId());}
        });
        
        
        model.addAttribute("news", news); 
        model.addAttribute("count", count); 
        model.addAttribute("page", page);
       // logger.debug(request.getRemoteAddr());
        newsService.SessionClose();
        return "newspage";
    }


    @RequestMapping(value = "/news/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        model.addAttribute("newsAttribute", new News());
        newsService.SessionClose();
        return "addpage";
    }

   
    @RequestMapping(value = "/news/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("newsAttribute") News news) { 
        if(news.getText().length()>100){
        newsService.sendMsg("Добавил новость. Текст: "+news.getText().substring(0, 100));}
        else{newsService.sendMsg("Добавил новость. Текст: "+news.getText());}
        newsService.add(news);
        newsService.SessionClose();
        return "addedpage";
    }

  
    @RequestMapping(value = "/news/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id,
                         Model model) {        
        newsService.sendMsg("Удалил новость. Номер: "+id);
        newsService.delete(id);
        model.addAttribute("id", id);
        newsService.SessionClose();
        return "deletedpage";
    }

    @RequestMapping(value = "/news/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id,
                          Model model) {
        
        model.addAttribute("newsAttribute", newsService.get(id));
        newsService.SessionClose();
        return "editpage";
    }

  
    @RequestMapping(value = "/news/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("newsAttribute") News news,
                           @RequestParam(value="id", required=true) Integer id,
                           Model model) {
        news.setId(id);
        newsService.sendMsg("Отредактировал новость. Номер: "+id);
        newsService.edit(news);
        model.addAttribute("id", id);
        newsService.SessionClose();
        return "editedpage";
    }
    
    @RequestMapping(value = "/news/show", method = RequestMethod.GET)
    public String show(@RequestParam(value="id", required=true) Integer id,
                           Model model) {
        News news = newsService.get(id);
        model.addAttribute("news", news);
        newsService.SessionClose();
        return "shownews";
    }
    
    
   
    @RequestMapping(value = "/news/search", method = RequestMethod.GET)
    public String search(@RequestParam(value="text", required=true) String text,
                           Model model) {
        List<News> news = newsService.getSearch(text);
        model.addAttribute("news", news);
        newsService.SessionClose();
        return "searchpage";
    }
    
    
    @RequestMapping(value = "/news/tag", method = RequestMethod.GET)
    public String byTag(@RequestParam(value="tag", required=true) String text,
                           Model model) {
        List<News> news = newsService.getTag(text);
        model.addAttribute("news", news);
        newsService.SessionClose();
        return "searchpage";
    }

}