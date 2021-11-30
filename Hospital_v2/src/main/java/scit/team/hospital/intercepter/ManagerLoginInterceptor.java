package scit.team.hospital.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ManagerLoginInterceptor extends HandlerInterceptorAdapter{
   
   private static final Logger logger = LoggerFactory.getLogger(ManagerLoginInterceptor.class);
   
   // Controller의 메서드가 실행되기 전에 처리
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      //세션에서 로그인 정보가 있는지 알아봄
      HttpSession session = request.getSession();
      String loginId = (String) session.getAttribute("loginId");
      
      //관리자 아이디(admin)가 아니면 홈으로
      if(loginId == null||!loginId.equals("admin")) {
         String path = request.getContextPath();
         response.sendRedirect(path + "/");
         
         return false;
      }
      
      //로그인을 한 경우 요청한 서비스로 진행(true)
      return super.preHandle(request, response, handler);
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      
      
      logger.info("LoginInterceptor prehandel() 실행");
      super.postHandle(request, response, handler, modelAndView);
   }
   
   
   
}