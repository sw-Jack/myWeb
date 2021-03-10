package util;

// 자바스크립트 특수문자 변환 유틸
public class Util {
	public static String toJS(String str) {
		return str.replace("\\", "\\\\").replace("\'", "\\\'").replace("\"", "\\\"").replace("\r\n", "\\n").replace("\n", "\\n");
	}
}
