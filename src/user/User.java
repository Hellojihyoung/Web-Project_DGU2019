package user;

//데이터를 여기서 관리 -> database 구축
public class User {
   //회원 정보 저장할것들 여기에 쓰기 -> 이거 기반으로 해서 mysql database 생성
   private String userID;
   private String userPassword;
   private String userName;
   private String userEmail;
   private String userNumber;
   private String userDoctor;
   
   //우클릭 -> source -> getters setters 함수 생성
   public String getUserID() {
      return userID;
   }
   public void setUserID(String userID) {
      this.userID = userID;
   }
   public String getUserPassword() {
      return userPassword;
   }
   public void setUserPassword(String userPassword) {
      this.userPassword = userPassword;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getUserEmail() {
      return userEmail;
   }
   public void setUserEmail(String userEmail) {
      this.userEmail = userEmail;
   }
   public String getUserDoctor() {
      return userDoctor;
   }
   public void setUserDoctor(String userDoctor) {
      this.userDoctor = userDoctor;
   }
   public String getUserNumber() {
      return userNumber;
   }
   public void setUserNumber(String userNumber) {
      this.userNumber = userNumber;
   }
}