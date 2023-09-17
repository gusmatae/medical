package kr.mdt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication //핸들러 매핑 등 api 들을 한방에 가져오는 어노테이션이라 볼 수 있다. 3가지 어노테이션을 구성원으로 갖고 있다.
public class MedicalProjectTApplication {

	public static void main(String[] args) {
		SpringApplication.run(MedicalProjectTApplication.class, args);
		
	}
	

}
