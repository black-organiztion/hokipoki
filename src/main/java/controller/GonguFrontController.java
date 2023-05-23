
package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import gongu.action.GonguListAction;
import gongu.action.GonguModifyAction;
import gongu.action.GonguCategoryAction;
import gongu.action.GonguHomeListAction;
import gongu.action.GonguRegistAction;
import gongu.action.GonguViewAction;
import gongu.action.MemberGonguListAction;
import gongu.action.MenuListAction;
import gongu.action.SearchGonguAction;
import vo.ActionForward;

/**
 * Servlet implementation class ProductFrontController
 */
@WebServlet("*.go")
public class GonguFrontController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GonguFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
 
   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
    private void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
       String command = request.getServletPath();
       System.out.println("command:"+command);
       
       Action action = null;
       ActionForward forward = null;
       
       if(command.equals("/gonguRegist.go")) {
          action = new GonguRegistAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
       }else if(command.equals("/gonguRegistForm.go")) {          
          request.setAttribute("pagefile", "/gongu/gonguRegistForm.jsp");
          forward = new ActionForward("/admin/adminTemplate.jsp", false);
         
       }else if(command.equals("/gonguView.go")) {          
          action = new GonguViewAction();
         try {
            forward = action.execute(request, response);
            request.setAttribute("pagefile", "/gongu/gonguView.jsp");
            forward.setRedirect(false);
            forward.setPath("/index.jsp");
         } catch (Exception e) {
            e.printStackTrace();
         }
           
       }else if(command.equals("/searchGongu.go")) {
    	   action = new SearchGonguAction();
    	   try {
    		   forward=action.execute(request, response);
    	   }catch(Exception e) {
    		   e.printStackTrace();
    	   }
    	   
    	   
       }
       
       else if(command.equals("/categoryList.go")) {
          action=new GonguCategoryAction();
          try {
             forward=action.execute(request, response);             
          }catch(Exception e) {
             e.printStackTrace();
          }
          
       }
       
       else if(command.equals("/gonguList.go")) {          
          action = new GonguListAction();
         try {
            forward = action.execute(request, response);
            request.setAttribute("pagefile", "/gongu/gonguList.jsp");
            forward.setRedirect(false);
            forward.setPath("/index.jsp");
         } catch (Exception e) {
            e.printStackTrace();
         }
       }
       else if(command.equals("/menuList.go")) {
          action = new MenuListAction();          
          try {
             forward=action.execute(request, response);
          }catch(Exception e) {
             e.printStackTrace();
          }
       }else if(command.equals("/gonguListHome.go")) {          
          action = new GonguHomeListAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }      

       }       
       else if(command.equals("/gonguModify.go")) {
          action = new GonguModifyAction();
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }
       }
       else if(command.equals("/memberGonguListAction.go")) {
    	  String member_id = request.getParameter("member_id");
    	  String result = new MemberGonguListAction().getGonguList(member_id);
    	  response.setContentType("application/json");
    	  response.setCharacterEncoding("UTF-8");
    	  response.getWriter().write(result);
        }
       
       
       if (forward != null) {
         if (forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
         } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
         }

      }
       
    }
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request,response);
   }


   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doProcess(request,response);
   }

}