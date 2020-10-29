package booklist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CustomerList {
	Connection con; // ��ü ����, �ν��Ͻ� ����
	Statement stmt;
	ResultSet rs;

	Customer c1;
	Customer[] c_array;

	// 1. ����
//	int custid;
//	String name;
//	String address;
//	String phone;
//
	// 2. �迭
//	int custid_arr[] = new int[10];
//	String name_arr[] = new String[10];
//	String address_arr[] = new String[10];
//	String phone_arr[] = new String[10];

	public CustomerList() {
		c_array = new Customer[5];

		for (int i = 0; i < c_array.length; ++i)
			c_array[i] = new Customer();
	}

	void getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		// 11g express edition �� orcl ��� XE �� �Է��Ѵ�.
		String userid = "c##madang"; // c## �߰�
		String pwd = "c##madang"; // c## �߰�

		// ����̹��� ã�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹� �ε� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// �����ͺ��̽��� �����ϴ� ����
		try {
			System.out.println("�����ͺ��̽� ���� �غ�-");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("�����ͺ��̽� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	void getCustomerDB() {

		String query = "SELECT custid, name, address, phone FROM customer"; // SQL��

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("CUSTID \tNAME \tADDRESS \t\tPHONE");

			int index = 0;
			while (rs.next()) {
				c_array[index].custid = rs.getInt(1);
				c_array[index].name = rs.getString(2);
				c_array[index].address = rs.getString(3);
				c_array[index].phone = rs.getString(4);

				index++;
			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	void printCustomer_Obj_array() {
		for (int i = 0; i < c_array.length; ++i) {
			System.out.print(c_array[i].custid + "\t");
			System.out.print(c_array[i].name + "\t");
			System.out.print(c_array[i].address + "\t");
			System.out.println(c_array[i].phone);
		}
	}

	void printCustomer_Object() {
		System.out.print(c1.custid + "\t");
		System.out.print(c1.name + "\t");
		System.out.print(c1.address + "\t");
		System.out.println(c1.phone);
	}
}
