package net.okjsp.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.annotation.WebServlet;

public class Proxy {
	public static void main(String[] args) throws Exception {
//		String sb = Proxy.getSource("http://192.168.45.48:8081");
//		String sb = Proxy.getSource("http://192.168.36.49:8088");
//		String sb = Proxy.getSource("http://192.168.36.49");
	}

	public static String getSource(String string) throws MalformedURLException,
			IOException {
		URL url = new URL(string);
		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(
				yc.getInputStream()));
		String inputLine;
		StringBuilder sb = new StringBuilder();
		while ((inputLine = in.readLine()) != null) {
			sb.append(inputLine).append("\n");
		}
		in.close();
		return sb.toString();
	}

}
