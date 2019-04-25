use Library
go

CREATE PROCEDURE dbo.uspGetCopies_Of_Book
AS

select  Books.Title, Library_Branch.Branch_name, Book_Copies.Number_of_copies
from Book_Copies
inner join  Books on Books.Book_Id = Book_Copies.Book_Id
inner join Library_Branch on Library_Branch.Branch_Id = Book_Copies.Branch_Id
where Books.Title = 'The Lost Tribe' and  Library_Branch.Branch_name = 'Sharpstown' ;

Go

use Library
go

CREATE PROCEDURE dbo.uspGetCopies_Of_Book_for_eachbranch @BookTitle varchar(50)
AS
/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

select Books.Title, Library_Branch.Branch_name, Book_Copies.Number_of_copies
from Book_Copies
inner join  Books on Books.Book_Id = Book_Copies.Book_Id
inner join Library_Branch on Library_Branch.Branch_Id = Book_Copies.Branch_Id
where Books.Title = @BookTitle;
Go





Create Procedure dbo.uspGetBorrowername 
as

/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/
select Borrower.name  from borrower
full outer join Book_Loans on Book_Loans.cardNo = Borrower.cardNo
where Not exists(select Book_Loans.cardNo where  Book_Loans.cardNo = Borrower.cardNo);
Go


Create Procedure dbo.uspGetbookToday @Branchname varchar(50), @duedate date
As
/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/

select Borrower.name, Borrower.Address, Books.Title, Library_Branch.Branch_name, Book_Loans.DateDue
from Book_Loans
Inner join Books on Books.Book_Id = Book_Loans.Book_Id
Inner join Borrower on Borrower.cardNo = Book_Loans.cardNo
inner join Library_Branch on  Library_Branch.Branch_Id = Book_Loans.Branch_Id
where Library_Branch.Branch_name = @Branchname and Book_Loans.DateDue = @duedate;
go




Use Library
go
Create Procedure dbo.uspGetBookloaned 
As
/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

 select Library_Branch.Branch_name , count(Book_Id) from Book_Loans as No_Of_Book_loaned_Out
 inner join Library_Branch on Library_Branch.Branch_Id = No_Of_Book_loaned_Out.Branch_Id
 Group by (Branch_name);
 go


Use Library
go
Create Procedure dbo.uspGetNameAddressBook
As
 /*6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/


select Borrower.name, Borrower.Address, Count(Book_Id)
from Book_Loans
inner join Borrower on Borrower.cardNo = Book_Loans.cardNo
group By name, Address
having count(Book_Id)> 5;
Go


Use Library
go
Create Procedure dbo.uspGettitlebystephenking @authorname varchar(50), @branchname varchar(50)
as
/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

select Book_Authors.Author_name, Books.Title, Book_Copies.Number_of_copies, Library_Branch.Branch_name
from Book_Copies
inner join Books on Books.Book_Id = Book_Copies.Book_Id
inner join Book_Authors on Book_Authors.Book_Id = Book_Copies.Book_Id
inner join Library_Branch on Library_Branch.Branch_Id = Book_Copies.Branch_Id
where Book_Authors.Author_name = 'Stephen King' and  Library_Branch.Branch_name ='Central';
Go