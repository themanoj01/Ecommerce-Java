package DBController;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Controller.Utils.Hashing;
import Model.CartItems;
import Model.Users;
import Model.product;

public class DatabaseController {
	public Connection databaseConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String db_url = "jdbc:mysql://localhost:3306/coursework";
		String db_user = "root";
		String db_pass = "";
		return DriverManager.getConnection(db_url, db_user, db_pass);
	}

	public int addUser(Users user) {
		try {
			Connection con = databaseConnection();
			String query = "insert into users(userName, firstName, lastName, birthday, gender, email, address, phone, password, profilePic, userType) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getLastName());
			statement.setDate(4, Date.valueOf(user.getBirthday()));
			statement.setString(5, user.getGender());
			statement.setString(6, user.getEmail());
			statement.setString(7, user.getAddress());
			statement.setString(8, user.getPhone());
			statement.setString(9, user.getPassword());
			statement.setString(10, user.getProfilePic());
			statement.setString(11, user.getUserType());

			int result = statement.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}

	}

	public ResultSet checkEmail(String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		ResultSet row = statement.executeQuery();
		return row;
	}

	public ResultSet checkPhone(String phone) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where phone = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, phone);
		ResultSet row = statement.executeQuery();
		return row;
	}

	public ResultSet checkUser(String user) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where userName = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, user);
		ResultSet row = statement.executeQuery();
		return row;
	}
	
	public boolean userExist(String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		boolean exist;
		String query = "select * from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		ResultSet row = statement.executeQuery();
		if(row.next()) {
			exist = true;
		}
		else {
			exist = false;
		}
		return exist;
	}
	
	public ResultSet getUser(String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		ResultSet row = statement.executeQuery();
		return row;	
	}
	public int updateData(Users user) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "update users set userName = ?, firstName = ?, lastName = ?, birthday = ?, phone = ?, address = ? where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, user.getUserName());
		statement.setString(2, user.getFirstName());
		statement.setString(3, user.getLastName());
		statement.setDate(4, Date.valueOf(user.getBirthday()));
		statement.setString(5, user.getPhone());
		statement.setString(6, user.getAddress());
		statement.setString(7, user.getEmail());
		int count = statement.executeUpdate();
		return count;

	}

	public int updatePassword(String password, String email) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "update users set password = ? where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, password);
		statement.setString(2, email);
		int count = statement.executeUpdate();
		return count;
	}

	public int checkPassword(String email, String password) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select password from users where email = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, email);
		String databasePassword = null;
		ResultSet row = statement.executeQuery();
		Hashing hashed = new Hashing();
		int count = 0;
		if(row.next()) {
			databasePassword = row.getString("password");
		}

		if(databasePassword != null && hashed.matchedPassword(password, databasePassword)) {
			count = 1;
		}
		else {
			count = 0;
		}
		return count;
	}

	public ResultSet searchItem(String search) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from products where productName like ? order by price desc";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, "%"+ search + "%");
		ResultSet row = statement.executeQuery();
		return row;
	}

	public ResultSet getProduct(String productName) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from products where productName like ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, "%" + productName + "%");
		ResultSet row = statement.executeQuery();
		return row;
	}

	public int addProduct(product product)
	{
		try (Connection con = databaseConnection()){
			String query = "INSERT INTO products (productName, price, stock_Quantity, product_image, productDescription) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, product.getProductName());
			st.setDouble(2, product.getPrice());
			st.setInt(3, product.getQuantity());
			st.setString(4, product.getProductImage());
			st.setString(5, product.getProductDescription());

			int result = st. executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch(SQLException | ClassNotFoundException ex)
		{
			ex.printStackTrace();
			return -1;
		}
	}

	public int updateProduct(product product)
	{
		try (Connection con = databaseConnection()){
			String query = "UPDATE products SET productName = ?, price = ?, stock_Quantity = ? WHERE product_Id = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, product.getProductName());
			st.setDouble(2, product.getPrice());
			st.setInt(3, product.getQuantity());
			st.setInt(4, product.getProductId());

			int result = st.executeUpdate();
			return result > 0 ? 1:0;
		}
		catch(SQLException | ClassNotFoundException ex)
		{
			ex.printStackTrace();
			return -1;

		}		

	}

	public int deleteProduct(int id)
	{
		try (Connection con = databaseConnection()){
			String query = "DELETE FROM products WHERE product_Id = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, id);
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch(SQLException | ClassNotFoundException ex)
		{
			return -1;

		}

	}

	public int updateStatus(int id, String orderStatus)
	{
		try (Connection con = databaseConnection()){
			String query = "UPDATE orders SET orderStatus = ? WHERE orderId = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, orderStatus);
			st.setInt(2, id);
			int result = st.executeUpdate();
			return result > 0 ? 1 : 0;
		}
		catch(SQLException | ClassNotFoundException ex)
		{
			ex.printStackTrace();
			return -1;

		}

	}


	public List<product> getAllProducts(){
		List<product> products = new ArrayList<product>();
		try (Connection con = databaseConnection()){
			String query = "SELECT * FROM products";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet result = st.executeQuery();
			while(result.next()) {
				product product = new product();
				product.setProductId(result.getInt("productId"));
				product.setProductName(result.getString("productName"));
				product.setPrice(result.getDouble("price"));
				product.setQuantity(result.getInt("quantity"));
				products.add(product);
			}
		}
		catch(SQLException | ClassNotFoundException ex)
		{
			ex.printStackTrace();			
		}
		return products;
	}

	public ArrayList<CartItems> getCartProducts(ArrayList<CartItems> cartItems)
	{
		ArrayList<CartItems> products = new ArrayList<CartItems>();

		try(Connection con = databaseConnection())
		{
			if(cartItems.size()>0)
			{
				for(CartItems item: cartItems)
				{
					String query = "select * from products where product_Id=?";
					PreparedStatement st = con.prepareStatement(query);
					st.setInt(1, item.getProductId());
					ResultSet rs = st.executeQuery();
					while(rs.next())
					{
						CartItems line = new CartItems();
						line.setProductId(rs.getInt("product_Id"));
						line.setProductName(rs.getString("productName"));
						line.setPrice(rs.getDouble("price")*item.getQuantity());
						line.setQuantity(item.getQuantity());
						products.add(line);
					}

				}
			}
		} catch (SQLException  | ClassNotFoundException ex) {
			ex.printStackTrace();

		}
		return products;
	}
	public double getTotalPrice(ArrayList<CartItems> cartItems)
	{
		double total = 0;
		try(Connection con = databaseConnection()) {
			if(cartItems.size()>0)
			{
				for(CartItems item:cartItems)
				{
					String query = "select price from products where product_Id=?";
					PreparedStatement st = con.prepareStatement(query);
					st.setInt(1, item.getProductId());
					ResultSet rs = st.executeQuery();
					while(rs.next())
					{
						total += rs.getDouble("price")*item.getQuantity();
					}
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public int orderProduct(String id, ArrayList<CartItems> productList, String cartTotal) throws ClassNotFoundException, SQLException {
		String productID = null;
		double lineTotal = 0;
		LocalDate today = LocalDate.now();
		String orderStatus = "Pending";
		int orderedQuantity = 0;
		int result = 0;
		for(CartItems orderItem: productList) {
			productID = String.valueOf(orderItem.getProductId());
			lineTotal = orderItem.getPrice();
			orderedQuantity = orderItem.getQuantity();
			
			Connection con = databaseConnection();
			String query = "insert into orders(orderDate, orderTotal, orderStatus, userId) values(?,?,?,?); insert into cart_items(productId, quantity, lineTotal) values(?,?,?);";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setDate(1, Date.valueOf(today));
			statement.setString(2, cartTotal);
			statement.setString(3, orderStatus);
			statement.setString(4, id);
			statement.setString(5, productID);
			statement.setInt(6, orderedQuantity);
			statement.setDouble(7, lineTotal);
			result = statement.executeUpdate();
			
		}
		return result;
		
	}
	
	public ResultSet buyProduct(String id) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "select * from products where product_Id = ?";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, id);
		ResultSet row = statement.executeQuery();
		return row;
	}
	
	public int storeBuyProduct(String id, String productId, int quantity, double lineTotal, double orderTotal, LocalDate today, String orderStatus) {
		Connection con;
		int mainResult = 0;
		try {
			con = databaseConnection();
			String query = "insert into orders(orderDate, orderTotal, orderStatus, userId) values(?,?,?,?);";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setDate(1, Date.valueOf(today));
			statement.setDouble(2, orderTotal);
			statement.setString(3, orderStatus);
			statement.setString(4, id);
			int result = statement.executeUpdate();
			
			String cartItemsQuery = "INSERT INTO cart_items (productId, quantity, lineTotal) VALUES (?, ?, ?)";
			PreparedStatement cartItemsStatement = con.prepareStatement(cartItemsQuery);
			cartItemsStatement.setString(1, productId);
			cartItemsStatement.setInt(2, quantity);
			cartItemsStatement.setDouble(3, lineTotal);
			int cartItemsResult = cartItemsStatement.executeUpdate();
			
			if(result >0 && cartItemsResult > 0 ) {
				mainResult = 1;
			}
			else {
				mainResult = 0;
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mainResult;
	
	}
	public int reviewStore(String userName, String email, String phone, String message) throws ClassNotFoundException, SQLException {
		Connection con = databaseConnection();
		String query = "insert into review(UserName, UserEmail, phone, Message) values(?,?,?,?)";
		PreparedStatement statement = con.prepareStatement(query);
		statement.setString(1, userName);
		statement.setString(2, email);
		statement.setString(3, phone);
		statement.setString(4, message);
		int result = statement.executeUpdate();
		return result;
	}
}


