package util;

// �ڹٽ�ũ��Ʈ Ư������ ��ȯ ��ƿ
public class Util {
	public static String toJS(String str) {
		return str.replace("\\", "\\\\").replace("\'", "\\\'").replace("\"", "\\\"").replace("\r\n", "\\n").replace("\n", "\\n");
	}
}
