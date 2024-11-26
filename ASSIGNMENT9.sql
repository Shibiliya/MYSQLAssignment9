USE entri_d42;
CREATE TABLE Worker(
	   Worker_id INT PRIMARY KEY,
       First_name CHAR(25),
       Last_name CHAR(25),
       Salary INT(15),
       Joining_date DATETIME,
       Department CHAR(25)
       );
DELIMITER //
CREATE PROCEDURE Addworker(
       IN p_Worker_id INT,
       IN p_First_name CHAR(25),
       IN p_Last_name CHAR(25),
       IN p_Salary INT,
       IN p_Joining_date DATETIME,
       IN p_Department CHAR(25)
       )
BEGIN
           INSERT INTO Worker (Worker_id,First_name,Last_name,Salary,Joining_date,Department) VALUES
             (p_Worker_id,p_First_name,p_Last_name,p_Salary,p_Joining_date,p_Department);
END //
DELIMITER ;

CALL Addworker(1,'John','Doe',50000,'2024-11-26 10:00:00','HR');
        
        
-- STORED PROCEDURE TO RETRIEVE SALARY
DELIMITER //
CREATE PROCEDURE Get_salary(
          IN p_Worker_id INT,
          OUT p_Salary  INT
          )
BEGIN 
            SELECT Salary INTO p_Salary FROM Worker WHERE Worker_id=p_Worker_id;
END //
DELIMITER ;

CALL Get_salary(1, @p_salary);
SELECT @p_Salary AS Salary;
   
-- STORED PROCEDURE TO UPDATE DEPARTMENT
DELIMITER //
CREATE PROCEDURE Update_Department(
           IN p_Worker_id INT ,
           IN p_Department CHAR(25)
           )
BEGIN 
    UPDATE Worker SET Department=p_Department WHERE Worker_id=p_Worker_id;
END //
DELIMITER ; 

CALL Update_Department(1,'Finance');


-- STORED PROCEDURE TO GET WORKER COUNT BY DEPARTMENT
DELIMITER //
CREATE PROCEDURE Get_Workercount(
           IN p_Department CHAR(25),
           OUT p_Workercount INT 
           )
BEGIN
      SELECT COUNT(*) INTO p_Workercount FROM Worker WHERE Department=p_Department;
END //
DELIMITER ;

CALL Get_Workercount('HR',@p_Workercount);
SELECT @p_Workercount AS Workercount;
 
-- STORED PROCEDURE TO GET AVERAGE SALARY BY DEPARTMENT
DELIMITER //
CREATE PROCEDURE Get_Averagesalary(
               IN p_Department CHAR(25),
               OUT p_Avgsalary FLOAT 
               )
BEGIN 
     SELECT AVG(Salary) INTO p_Avgsalary FROM Worker WHERE Department=p_Department ;
END //
DELIMITER ;
  
CALL Get_Averagesalary('HR',@p_Avgsalary);
SELECT @p_Avgsalary AS Avgsalary ;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
         