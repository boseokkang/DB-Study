package booklist;

public class BookStore {
	// ������� Ŭ������ ����ϴ� �κ�
//	BookStore()
	void run() {
		Booklist bl = new Booklist();//
		bl.getConnection(); // ���� open
		bl.getBookDB(); // ���� close
		bl.printBook_Obj_array();

		// so.printBookArr();

		CustomerList cl = new CustomerList();
		// ...
	}

}
