import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClickjackFilter implements Filter {
//    private String mode = "DENY";
    private String mode = "SAMEORIGIN";

    /**
     * Add X-FRAME-OPTIONS response header to tell IE8 (and any other browsers who
     * decide to implement) not to display this content in a frame. For details, please
     * refer to http://blogs.msdn.com/sdl/archive/2009/02/05/clickjacking-defense-in-ie8.aspx.
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse)response;
        //If you have Tomcat 5 or 6, there is a known bug using this code.  You must have the doFilter first:
//        chain.doFilter(request, response);
//        res.addHeader("X-FRAME-OPTIONS", mode );
        //Otherwise use this:
        res.addHeader("X-FRAME-OPTIONS", mode );
        chain.doFilter(request, response); // TODO NTT if tomcat 5 or 6 comment here!!!

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {
        String configMode = filterConfig.getInitParameter("mode");
        if ( configMode != null ) {
            mode = configMode;
        }
    }
}
