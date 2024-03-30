# Creating New database
create database Loan_Approval;
# Using the database created
use Loan_Approval;
select * from loanpred; -- Viewing the data -- 
# Loan_ID do not provide any value, we can remove the entire column from the table.
Alter table loanpred
drop column Loan_ID;

-- Basic EDA -- 

-- 1. Summary Statistics --
SELECT 
    COUNT(*) AS total_records,
    AVG(`ApplicantIncome`) AS avg_applicant_income,
    AVG(`CoapplicantIncome`) AS avg_co_applicant_income,
    AVG(`LoanAmount`) AS avg_loan_amount,
    MIN(`LoanAmount`) AS min_loan_amount,
    MAX(`LoanAmount`) AS max_loan_amount,
    AVG(`Loan_Amount_Term`) AS avg_loan_term,
    MIN(`Loan_Amount_Term`) AS min_loan_term,
    MAX(`Loan_Amount_Term`) AS max_loan_term
FROM loanpred;

-- 2. Loan Status Distribution --
SELECT Loan_Status, COUNT(*) AS count
FROM loanpred
GROUP BY Loan_Status;

-- 3. Gender Distribution --
Select Gender, count(*) AS count
from loanpred
group by Gender;

-- 4. Loan Distribution based on gender --
Select Gender, Loan_Status, count(*) as count
from loanpred
where Loan_Status = 'Y'
group by Gender, Loan_Status;

-- 5. Marital Status Distribution --
Select Married, count(*) as count
from loanpred
group by Married;

-- 6. Loan Approval based on Maritial Status --
Select Married, Loan_Status, count(*) as Count
from loanpred
where Loan_Status = 'Y'
group by Married, Loan_Status;

-- 7. Education Level distribution --
Select Education, count(*) as count
from loanpred
group by Education;

-- 8. Loan Approval with respect to Education --
select Education, Loan_Status, count(*) as count
from loanpred
where Loan_Status = "Y"
group by Education, Loan_Status;

-- Who Takes more loan or approval rate --
Select Gender, married, Loan_Status, count(*) as Count
from loanpred
where Loan_Status ='Y' and Gender = "Female"
group by Gender, Loan_status, married;

Select Gender, married, Loan_Status, count(*) as Count
from loanpred
where Loan_Status ='Y' and Gender = "Male"
group by Gender, Loan_status, married;

Select (sum(Married = 'Yes' and Gender = "Male")/count(*))*100 as Percentage
from loanpred;

# from the above it could be concluded Married Male takes more Loan or loan gets approved than married Female

Select * from loanpred;

Select Self_Employed, Loan_Status, count(*) as count
from loanpred
where Loan_Status = 'Y'
group by Self_Employed, Loan_Status;






