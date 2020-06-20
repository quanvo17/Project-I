/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.*;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session_bean.*;

/*
 *
 * @author quan.vd173320
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/ControllerServlet",
                                                        "/home",
                                                        "/login",
                                                        "/logout",
                                                        "/register",
                                                        "/dashboard",
                                                        "/search",
                                                        "/category",
                                                        "/categorydetail",
                                                        "/updatecategory",
                                                        "/addword",
                                                        "/insertcategory",
                                                        "/updateword",
                                                        "/deleteword"
})
@MultipartConfig(fileSizeThreshold = 1024*1024*1, maxFileSize = 1024*1024*2, maxRequestSize = 1024*1024*2)
public class ControllerServlet extends HttpServlet {
    
    @EJB
    UserFacade userF;
    
    @EJB
    WordFacade wordF;
    
    @EJB
    CategoryFacade cate;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        String servletPath = request.getServletPath();
       
        //Homepage
        if(servletPath.equals("/home")){
            session.setAttribute("title", "Homepage");
            servletPath = "/index";
        }
        
        //Login
        if(servletPath.equals("/login")){
            session.setAttribute("title", "Login"); 
            
            String name = (String) request.getParameter("name");
            String password = (String) request.getParameter("password");
            
            if (name != null){
                User user = null;
                
                try{
                    user = userF.checkUser(name);
                } catch (Exception ex){
                    ex.printStackTrace();
                }
                if (user == null){
                    request.setAttribute("error", "Wrong name or password! Try again!");
                } else {
                    if (!user.getPassword().equals(password)){
                        request.setAttribute("error", "Wrong name or password! Try again!");
                    } else{
                        session.setAttribute("user", user);
                        session.setAttribute("title", "Dashboard");
                        servletPath = "/dashboard";
                    }
                }
            }
        }
         
        // Logout   
        if (servletPath.equals("/logout")){
            session.setAttribute("user", null);
            session.setAttribute("title", "Homepage");
            servletPath = "/index";
        }
        
        // Register
        if (servletPath.equals("/register")){
            session.setAttribute("title", "Register");
            
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            
            if (name != null){
                try{
                    userF.insertUser(name, password);
                    request.setAttribute("thongbao", "Đăng ký thành công");
                    session.setAttribute("title", "Login");
                    servletPath = "/login";
                } catch (Exception ex){
                    request.setAttribute("error", "Tên đăng nhập đã được sử dụng");
                }
            }
        }
        
        //Dashboard
        if(servletPath.equals("/dashboard")){
            User user = (User) session.getAttribute("user");
            if (user==null){
                request.setAttribute("thongbao", "Bạn cần đăng nhập để sử dụng");
                servletPath = "/login";
            }else{
            session.setAttribute("title","Dashboard");
            List<Category> list = cate.findAll();
            session.setAttribute("categoryList", list);
            }
        }
        
        //Category
        if(servletPath.equals("/category")){
            User user = (User) session.getAttribute("user");
            if (user==null){
                request.setAttribute("thongbao", "Bạn cần đăng nhập để sử dụng");
                servletPath = "/login";
            }else{
                int cateid ;
                if(request.getParameter("id")!= null){
                    cateid = Integer.parseInt(request.getParameter("id"));
                    Category cateselected = cate.find(cateid);
                    int catecount = cate.count();
                    //User usercurrent = userF.find(userid);
                    List<Word> catewords = (List<Word>) wordF.findByCate(cateselected);
                    session.setAttribute("cate", cateselected);
                    session.setAttribute("word", catewords);
                    session.setAttribute("title", cateselected.getName());
                }
            }
        }
        
        //Search
        if(servletPath.equals("/search")){          
            String nameword = (String) request.getParameter("word1");
            List<Word> word = wordF.findAll();
            Word wordfinded = new Word(); 
            for (Word clunit: word){
                    if (nameword.equals(clunit.getName())){
                        wordfinded = clunit;
                        break; 
                    }
                }
                session.setAttribute("wordfinded", wordfinded);
                session.setAttribute("title", "Search " + nameword);
                session.setAttribute("thongbao", "đã tìm từ thành công");
        }
        
        //Categoty Detail
        if(servletPath.equals("/categorydetail")){
            User user = (User) session.getAttribute("user");
            if (user==null){
                request.setAttribute("thongbao", "Bạn cần đăng nhập để sử dụng");
                servletPath = "/login";
            }else{
                int cateid ;
                if(request.getParameter("id")!= null){
                    cateid = Integer.parseInt(request.getParameter("id"));
                    Category cateselected = cate.find(cateid);
                    int catecount = cate.count();
                    //User usercurrent = userF.find(userid);
                    List<Word> catewords = (List<Word>) wordF.findByCate(cateselected);
                    List<Category> list = cate.findAll();
                    session.setAttribute("categoryList", list);
                    session.setAttribute("cate", cateselected);
                    session.setAttribute("word", catewords);
                    session.setAttribute("title", cateselected.getName());
                }
            }
        }
        
        // add word
        if(servletPath.equals("/addword")){
            List<Category> catelist = (List<Category>) cate.findAll();
            session.setAttribute("catelist", catelist);
        }
        
         // delete word
        if(servletPath.equals("/deleteword")){
             int id = (int) Integer.parseInt(request.getParameter("id"));
             request.setAttribute("thongbao", "Xóa từ thành công");
             wordF.deleteWord(id);
             Category cate = (Category) session.getAttribute("cate");
             List<Word> catewords = (List<Word>) wordF.findByCate(cate);
             session.setAttribute("word", catewords);
             session.setAttribute("title", cate.getName());
             servletPath = (String) session.getAttribute("view");
         }
        
        
        //Update category
        if(servletPath.equals("/updatecategory")){
            
        }
                
        
        String url = servletPath + ".jsp";
        try{
            request.getRequestDispatcher(url).forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{       
        HttpSession session = request.getSession(false);
        String servletPath = request.getServletPath();
        
        // insert word
        if(servletPath.equals("/insertword")){
            String name = (String) request.getParameter("name");
            String mean = (String) request.getParameter("mean");
            String category = (String) request.getParameter("category"); 
            Category newcate = new Category();
            List<Category> cl = (List<Category>) session.getAttribute("categoryList");
            for (Category clunit: cl){
                    if (category.equals(clunit.getName())){
                        newcate = clunit;
                        break; 
                    }
                }
            int cateid = newcate.getCateId();
            User user = (User) session.getAttribute("user");
            int id = user.getUserId();
            wordF.insertWord(name, mean, cateid, id);
            request.setAttribute("thongbao", "Đã thêm từ thành công");
            servletPath = (String) session.getAttribute("view");   
        }
        
        //insert category
        if(servletPath.equals("/insertcategory")){
            String name = (String) request.getParameter("name");
            String descrip = (String) request.getParameter("description");
            cate.createCategory(name, descrip);
            request.setAttribute("thongbao", "Đã thêm danh mục thành công");
            session.setAttribute("title","Dashboard");
            List<Category> list = cate.findAll();
            session.setAttribute("categoryList", list);
            servletPath = "/dashboard";
        }
        
        // word detai
        if(servletPath.equals("/worddetail")){
             request.getParameter("id");
             
        }
        
        // update word
         if(servletPath.equals("/updateword")){
             String name = (String) request.getParameter("name");
             String mean = (String) request.getParameter("mean");
             int wordid;
             wordid = Integer.parseInt(request.getParameter("wordid"));
             wordF.updateWord(name, wordid);
             wordF.updateMean(mean, wordid);
             Category cate = (Category) session.getAttribute("cate");
             List<Word> catewords = (List<Word>) wordF.findByCate(cate);
             session.setAttribute("word", catewords);
             request.setAttribute("thongbao", "Đã sửa từ thành công");
             servletPath = (String) session.getAttribute("view");            
        }
        
        

         
        
        String url = servletPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
