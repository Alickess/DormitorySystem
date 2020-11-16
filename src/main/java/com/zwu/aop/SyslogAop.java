package com.zwu.aop;

import com.zwu.pojo.Syslog;
import com.zwu.service.SyslogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class SyslogAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    SyslogService syslogService;
    private Date visitTime;//开始时间
    private Class clazz;//访问的类
    private Method method;//访问的方法

    //前置通知  主要获取开始时间，执行的类是哪一个，执行的是哪一个方法
    @Before(value = "execution(* com.zwu.controller.*.*(..)) && !execution(* com.zwu.controller.*.find*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime=new Date();
        //当前时间，开始访问的时间
        clazz=jp.getTarget().getClass();
        //获取当前具体访问类对象
        String methodName=jp.getSignature().getName();
        //拿到当前访问方法的名字
        Object[] args=  jp.getArgs();
        //获取方法方法的参数
        if(args==null||args.length==0) {
            method = clazz.getMethod(methodName);
            //只能获取无参数的方法
        }else {
            Class[] classArgs=new Class[args.length];
            for(int i=0;i<args.length;i++){
                classArgs[i]=args[i].getClass();
            }
           method= clazz.getMethod(methodName,classArgs);
        }
    }
    //后置
    @After(value = "execution(* com.zwu.controller.*.*(..)) && !execution(* com.zwu.controller.*.find*(..)) ")
    public void doAfter(JoinPoint jp) throws Exception {
        //获取一个当前时间，减去访问时间
        long time=System.currentTimeMillis()-visitTime.getTime();
        String url = "";
        //获取url
        if(clazz!=null&&method!=null&&clazz!= SyslogAop.class){
            //1.获取类上的注解的值@RequestMapping("/orders")
            RequestMapping clazzAnnotation=(RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(clazzAnnotation!=null){

                String[] classValue = clazzAnnotation.value();
                //2.获取方法上的value值RequestMapping.class
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String[] methodValue=methodAnnotation.value();
                    url=methodValue[0]+classValue[0];
                }
            }
        }

        //获取访问的ip
        String ip =request.getRemoteAddr();

        //获取当前操作的用户
        //从上下文中获取了当前登录的用户
        SecurityContext context = SecurityContextHolder.getContext();
        User user= (User) context.getAuthentication().getPrincipal();
        String username=user.getUsername();

        //将日志相关信息封装到SysLog对象
        Syslog syslog=new Syslog();
        syslog.setExecutionTime(time);//执行时长
        syslog.setIp(ip);
        //System.out.println("[类名]"+clazz.getName()+"[方法名] "+method.getName());
        syslog.setMethod("[类名]"+clazz.getName()+"[方法名] "+method.getName());
        syslog.setUrl(url);
        syslog.setUsername(username);
        syslog.setVisitTime(visitTime);
        //调用Service完成操作
        syslogService.save(syslog);
    }
}
