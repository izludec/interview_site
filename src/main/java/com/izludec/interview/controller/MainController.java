package com.izludec.interview.controller;

import org.apache.log4j.Logger;
import com.izludec.interview.domain.News;
import com.izludec.interview.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("/main")
public class MainController {


    @Resource(name="newsService")
    private NewsService newsService;

   

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String getNews(Model model) {
        List<News> news = newsService.getAll();
        model.addAttribute("news", news);
        return "newspage";
    }


    @RequestMapping(value = "/news/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        model.addAttribute("newsAttribute", new News());
        return "addpage";
    }

   
    @RequestMapping(value = "/news/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("newsAttribute") News news) { 
      
        newsService.add(news);
        return "addedpage";
    }

  
    @RequestMapping(value = "/news/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id,
                         Model model) {    
        newsService.delete(id);
        model.addAttribute("id", id);
        return "deletedpage";
    }

    @RequestMapping(value = "/news/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id,
                          Model model) {
        model.addAttribute("newsAttribute", newsService.get(id));
        return "editpage";
    }

  
    @RequestMapping(value = "/news/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("newsAttribute") News news,
                           @RequestParam(value="id", required=true) Integer id,
                           Model model) {
        news.setId(id);
        newsService.edit(news);
        model.addAttribute("id", id);
        return "editedpage";
    }
    
    @RequestMapping(value = "/news/show", method = RequestMethod.GET)
    public String show(@RequestParam(value="id", required=true) Integer id,
                           Model model) {
        News news = newsService.get(id);
        model.addAttribute("news", news);
        return "shownews";
    }
    
    
   
    @RequestMapping(value = "/news/search", method = RequestMethod.GET)
    public String search(@RequestParam(value="text", required=true) String text,
                           Model model) {
        List<News> news = newsService.getSearch(text);
        model.addAttribute("news", news);
        return "searchpage";
    }
    
    
    @RequestMapping(value = "/news/tag", method = RequestMethod.GET)
    public String byTag(@RequestParam(value="tag", required=true) String text,
                           Model model) {
        List<News> news = newsService.getTag(text);
        model.addAttribute("news", news);
        return "searchpage";
    }

}