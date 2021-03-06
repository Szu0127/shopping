package eduvideoproducts.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eduvideoproducts.model.Cart;
import eduvideoproducts.model.VideoProducts;


public class VideoProductsDAO {
	
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public VideoProductsDAO(Connection conn){
			this.conn = conn;
		}

		public List<VideoProducts> getAllProducts(){
			List<VideoProducts> products = new ArrayList<VideoProducts>();			 
			
			String sql = "Select * From products;";
			try {
				pstmt = this.conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					VideoProducts vps = new VideoProducts();
					vps.setId(rs.getInt("id"));
					vps.setName(rs.getString("name"));
					vps.setCategory(rs.getString("type"));
					vps.setPrice(rs.getInt("Price"));
					vps.setImage(rs.getString("image"));
					
					products.add(vps);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return products;
		}
		
		public List<Cart> getCartProducts(ArrayList<Cart> cartList){
			List<Cart> products = new ArrayList<Cart>();
			
			try {
				if(cartList.size()>0) {
					for(Cart item: cartList) {
						String sql1 = "select * from products where id = ?";
						pstmt = this.conn.prepareStatement(sql1);
						pstmt.setInt(1,item.getId());
						rs = pstmt.executeQuery();
						while(rs.next()) {
							Cart row = new Cart();
							row.setId(rs.getInt("id"));
							row.setName(rs.getString("name"));
							row.setCategory(rs.getString("type"));
							row.setPrice(rs.getInt("price")*item.getQuantity());//價錢乘上個數
							row.setQuantity(item.getQuantity());
							products.add(row);
				       }
					}
				}				
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}			
			return products;
		}
		
		public Integer getTotalCartPrice(ArrayList<Cart> cartList) {
			int sum = 0;
			
			try {
				if(cartList.size()>0) {
					for(Cart item: cartList) {
				String sql2 = "select price from products where id =?";
				pstmt = this.conn.prepareStatement(sql2);
				pstmt.setInt(1, item.getId());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					sum+= rs.getInt("price")*item.getQuantity();//總和=總和+(金額*數量)
					
				}
				
					}
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			return sum;
			
		}
		
		
}
