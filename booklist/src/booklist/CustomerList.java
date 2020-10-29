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

	void printCustomer() {

		String query = "SELECT custid, name, address, phone FROM customer"; // SQL��

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("CUSTID \tNAME \t\tADDRESS \t\tPHONE");

			while (rs.next()) {
				System.out.print("\t" + rs.getInt(1));
				System.out.print("\t" + rs.getString(2));
				System.out.print("\t\t\t" + rs.getString(3));
				System.out.println("\t\t\t\t" + rs.getString(4));

			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
