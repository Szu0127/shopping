package eduvideoproducts.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eduvideoproducts.model.*;


@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
			//shopping-cart/add-to-cart?id=1
			
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);//設定數量			
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {//
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				//out.println("session created and added the list");
				//購物車創建並添加進列表
				//We are storing them in our session.
				response.sendRedirect("index.jsp");
			}else {
				//out.println("cart add exist");//以添加進購物車
				cartList = cart_list;
//				for(Cart c:cartList) {
//				out.print(c.getId());}加進購物車回傳ID=1

				boolean exist = false;//加設不存在
				
				//cartList.contains(cm);//包含
				
				for(Cart c:cart_list) {
					if(c.getId() == id) {
						exist = true;
						//out.println("product exist");//商品存在
						out.println("<h3 style='color:crimson; text-align:center'>"
								  + "Item already exist in Cart."//已添加入購物車(按一次加入購物車(存放在購物車的list)，不會跳轉到Cart頁面)
							      + "<a href='cart.jsp'>Go To Cart Page</a>"//按第二次顯示已存在在購物車，引道進入購物車Cart頁面
							      + "</h3>");
					}
				}
				
					if(!exist) {
						cartList.add(cm);
						//out.println("product added");//已被加入(已存在的購物車內再添加入商品)
						response.sendRedirect("index.jsp");
				}
			}
//			for(Cart c:cart_list) {
//				out.println(c.getId());
//			}
			
		}
	}
}
