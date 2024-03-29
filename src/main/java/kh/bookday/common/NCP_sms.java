package kh.bookday.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class NCP_sms{

	@SuppressWarnings("unchecked")
	public void send_msg(String phone , String rand) {

		//헤더 생성
		String hostNameUrl = "https://sens.apigw.ntruss.com";    // 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "W2Esy6fNIKCnEjIYtPCA";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		String secretKey = "qkAL3QUkfy9MhxawEc67wC0Pbmpx8cDeFJRxCrq1";  // 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String serviceId = "ncp:sms:kr:297260365853:book_day";       // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;

		//https://sens.apigw.ntruss.com/sms/v2/services/ncp:sms:kr:297260365853:book_day/messages


		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray  toArr = new JSONArray();

		toJson.put("content","[책하루] \n 책하루 인증 번호는"+ "["+rand+"]"+"입니다.");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		toJson.put("to",phone);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
		toArr.add(toJson);

		bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
		//bodyJson.put("countryCode","82");					// Optional, 국가 전화번호, (default: 82)
		bodyJson.put("from","01053793197");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
		bodyJson.put("content","책하루 인증 번호는 "+"["+rand+"]"+"입니다.");		// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개

		//String body = bodyJson.toJSONString();
		String body = bodyJson.toString();

		System.out.println(body);

		try {
			URL url = new URL(apiUrl);
			//URLEncoder.encode(apiUrl, "UTF-8");

			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());

			//wr.write(body.getBytes());
			wr.write(body.getBytes("utf-8")); //인코딩
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" +" " + responseCode);
			if(responseCode == 202) { // 정상 호출

				//br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));

			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
				//response.append(new String(URLDecoder.decode(inputLine, "UTF-8")));
			}
			br.close();

			System.out.println(response.toString());

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	//네이버 클라우드 플랫폼 제공 sms 인증 api를 사용하기 위한 시그니처 생성
	public String makeSignature(String url,String timestamp,String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
		String space=" ";
		String newLine = "\n";

		String message = new StringBuilder()
				.append(method)
				.append(space)
				.append(url)
				.append(newLine)
				.append(timestamp)
				.append(newLine)
				.append(accessKey)
				.toString();

		SecretKeySpec signingKey;
		String encodeBase64String;

		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac= Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		}catch(UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
		return encodeBase64String;
	}

}


