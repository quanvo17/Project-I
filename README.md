# Project I
## Hướng dẫn cài đặt

### 1. **Yêu cầu:**
   
   • Java Version 8: https://www.java.com/en/download/
   
   • NetBean 8.2: https://netbeans.org/downloads/8.2/
    
    Hoặc eclipse: https://www.eclipse.org/downloads/
        
    > Còn đối với một số phần mềm như IntelliJ: sẽ bị lỗi thư viện jstl trong khi compile
        
   • Server glassfish 5.0: https://javaee.github.io/glassfish/download (phiên bản tối thiểu nếu dùng java 8)
    
     Hướng dẫn cài đặt server: https://o7planning.org/vi/10223/huong-dan-cai-dat-va-cau-hinh-glassfish-web-server
        
   • Cơ sở dữ liệu: 
    
      MySql: https://dev.mysql.com/downloads/mysql/
             
      SQL server: https://www.microsoft.com/en-us/download/details.aspx?id=1695
             
   • Clone project về máy: https://github.com/quanaihust/projectI
    
   • Chạy file db.sql để tạo database (chỉ với mySQL còn SQL server cần thay đổi cú pháp)
    
   • Vào file glassfish-resources.xml thay đổi trường user và password cho phù hợp với database của mình
    
   =>Tiến hành chạy thử
### 2. **Biên dịch bằng dòng lệnh :** *hãy chắc chắn đã cài database và glassfish*
   * compile and build without IDE
   - tải và setup apache ant https://ant.apache.org/bindownload.cgi
   - cmd
   - ant -f "F:\\netbean project\\projectI" clean dist
   - ant -f "F:\\netbean project\\projectI" -Dnb.internal.action.name=build -DforceRedeploy=false "-Dbrowser.context=F:\\netbean project\\projectI" dist
   * khởi chạy 
   - cd c:\

   - cd glashfish5 *nếu cài bản glashfish 5* 

   - cd bin /n

   - asadmin start-domain domain1

   - asadmin deploy \projectI\dist\projectI.war  *phần trước thêm phần link đặt file project* 
