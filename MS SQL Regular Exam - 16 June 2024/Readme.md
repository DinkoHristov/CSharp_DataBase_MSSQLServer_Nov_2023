
# **Database Basics MS SQL Regular Exam – 16 Jun 2024**
Exam problems for the ["Database Basics" course @ SoftUni](https://softuni.bg/trainings/4534/ms-sql-may-2024).
Submit your solutions in the SoftUni Judge system at [Judge](https://judge.softuni.org/Contests/4801/MS-SQL-Regular-Exam-16-June-2024).
# **Library Database**
# **Section 1. DDL (30 pts)**
You have been given the E/R Diagram of the **LibraryDb** database.

![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.001.png)

Create a database called **LibraryDb**. You need to create **6 tables**:

- **Books** – contains information about each book;
- **Authors** – contains information about the authors of the books;
- **Libraries** – contains information about each library;
- **Genres** – contains information about the book’s category;
- **Contacts** – contains information about the contact methods with the libraries or the authors;
- **LibrariesBooks** - manages the many-to-many relationship between libraries and books, indicating which libraries store specific books and which books are stored in a specific library;

**NOTE: Keep in mind that Judge doesn't accept "ALTER" statements and square brackets naming (when the names are not keywords).**

**NOTE: Please keep in mind that in case you have to work with a date, you have to use the same data type, described in the models tables. If you don't use the correct type, the Judge system won't accept your submission as correct.**

You have been tasked to **create the tables in the database by the following models**:

### **Books**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**Id**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Identity|
|**Title**|**String** up to **100** symbols, **Unicode**|**Null** is **not** allowed|
|**YearPublished**|**Integer** from **0** to **2,147,483,647**|**Null** is **not** allowed|
|**ISBN**|**String** up to **13** symbols, **Unicode**|**Unique, Null** is **not** allowed|
|**AuthorId**|**Integer** from **0** to **2,147,483,647**|**Relationship** with table **Authors**, **Null** is **not** allowed|
|**GenreId**|**Integer** from **0** to **2,147,483,647**|**Relationship** with table **Genres**, **Null** is **not** allowed|
### **Authors**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**Id**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Identity|
|**Name**|**String** up to **100** symbols, **Unicode**|**Null** is **not** allowed|
|**ContactId**|**Integer** from **0** to **2,147,483,647**|**Relationship** with table **Contacts**, **Null** is not allowed|
### **Libraries**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**Id**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Identity|
|**Name**|**String** up to **50** symbols, **Unicode**|**Null** is **not** allowed|
|**ContactId**|**Integer** from **0** to **2,147,483,647**|**Relationship** with table **Contacts**, **Null** is **not** allowed|
### **Genres**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**Id**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Identity|
|**Name**|**String** up to **30** symbols, **Unicode**|**Null** is **not** allowed|
### **Contacts**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**Id**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Identity|
|**Email**|**String** up to **100** symbols, **Unicode**|**Null** is allowed|
|**PhoneNumber**|**String** up to **20** symbols, **Unicode**|**Null** is allowed|
|**PostAddress**|**String** up to **200** symbols, **Unicode**|**Null** is allowed|
|**Website**|**String** up to **50** symbols, **Unicode**|**Null** is allowed|
### **LibrariesBooks**

|**Column Name**|**Data Type**|**Constraints**|
| :-: | :-: | :-: |
|**LibraryId**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Relationship with table **Libraries**,  **Null** is not allowed|
|**BookId**|**Integer** from **0** to **2,147,483,647**|PK, Unique table identification, Relationship with table **Books**,  **Null** is not allowed	|
1. ## **Database design**
Submit all of your **CREATE** **statements** to Judge (only the creation of tables).
# **Section 2. DML (10 pts)**
**Before you start, you have to import "Dataset.sql ". If you have created the structure correctly, the data should be successfully inserted.**

In this section, you have to do some data manipulations:
1. ## **Insert**
Let's **insert** some sample data into the database. Write a query to add the following records to the corresponding tables. All IDs (Primary Keys) should be **auto-generated**.
### **Contacts**

|**Id**|**Email**|**PhoneNumber**|**PostAddress**|**Website**|
| :-: | :-: | :-: | :-: | :-: |
|21|NULL|NULL|NULL|NULL|
|22|NULL|NULL|NULL|NULL|
|23|'stephen.king@example.com'|'+4445556666'|'15 Fiction Ave, Bangor, ME'|'www.stephenking.com'|
|24|'suzanne.collins@example.com'|'+7778889999'|'10 Mockingbird Ln, NY, NY'|'www.suzannecollins.com'|


### **Authors**

|**Id**|**Name**|**ContactId**|
| :-: | :-: | :-: |
|16|'George Orwell'|21|
|17|'Aldous Huxley'|22|
|18|'Stephen King'|23|
|19|'Suzanne Collins'|24|
#





### **Books**

|**Id**|**Title**|**YearPublished**|**ISBN**|**AuthorId**|**GenreId**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|36|'1984'|1949|'9780451524935'|16|2|
|37|'Animal Farm'|1945|'9780451526342'	|16|2|
|38|'Brave New World'|1932|'9780060850524'|17|2|
|39|'The Doors of Perception'|1954|'9780060850531'|17|2|
|40|'The Shining'|1977|'9780307743657'|18|9|
|41|'It'|1986|'9781501142970'|18|9|
|42|'The Hunger Games'|2008|'9780439023481'|19|7|
|43|'Catching Fire'|2009|'9780439023498'|19|7|
|44|'Mockingjay'|2010|'9780439023511'|19|7|

### **LibrariesBooks**

|**LibraryId**|**BookId**|
| :-: | :-: |
|1|36|
|1|37|
|2|38|
|2|39|
|3|40|
|3|41|
|4|42|
|4|43|
|5|44|



1. ## **Update**
For **all authors who do not have a website listed in their contact information**, update their contact information to include a website. The website should be in the format: **"www."** + **"authorname"** + **".com"**

**'authorname' -> in lowercase without spaces**

**'George Orwell' -> www.georgeorwell.com**
1. ## **Delete**
You are required to **delete 'Alex Michaelides' from the Authors table**. This is challenging because the **Authors** table is **referenced by the Books table**, which in turn is **referenced by the LibrariesBooks table**. Therefore, you need to handle these references correctly to maintain the integrity of the database.
# **Section 3. Querying (40 pts)**
**You need to start with a fresh dataset, so recreate your DB and import the sample data again ("Dataset.sql**"**).**
1. ## <a name="_hlk83031548"></a>**Books by Year of Publication**
Select all **books,** ordered by **year** of publication – **descending**, and then by **title** - alphabetically.

Required columns:

- **Book Title**
- **ISBN**
- **YearReleased**
### **Example**

|**Book Title**|**ISBN**|**YearReleased**|
| :-: | :-: | :-: |
|'The Silent Patient'|'9781250301697'|2019|
|'Becoming'|'9781524763138'|2018|
|'Educated'|'9780399590504'|2018|
|'The Great Alone'|'9780312577230'|2018|
|'Where the Crawdads Sing'|'9780735219090'|2018|
|'A Storm of Swords'|'9780553106633'|2000|
|…|…||
1. ## **Books by Genre**
Select all **books** with **'Biography'** or **'Historical Fiction'** genres. Order results by **Genre**, and then by **book title** – **alphabetically**.

Required columns:

- **Id**
- **Title**
- **ISBN**
- **Genre**
### **Example**

|**Id**|**Title**|**ISBN**|**Genre**|
| :-: | :-: | :-: | :-: |
|3|Becoming|9781524763138|Biography|
|25|Anna Karenina|9780143035008|Historical Fiction|
|33|Crime and Punishment|9780140449136|Historical Fiction|
|…|…|…|…|

1. ## **Libraries Missing Specific Genre**
Select all **libraries that do not have any books of a specific genre** (**'Mystery'**). Order the results by the name of the library in ascending order.

Required columns:

- **Library**
- **Email**
### **Example**

|**Library**|**Email**|
| :-: | :-: |
|Politics and Prose|politics@example.com|
|Powell's City of Books|powells@example.com|
|Strand Bookstore|strand@example.com|
|Tattered Cover|tattered@example.com|
1. ## **First 3 Books**
Your task is to write a query to select the first 3 books from the library database (LibraryDb) that meet the following criteria:

- The book was **published after the year 2000** **and** **contains the letter 'a' in the book title**, 
- OR
- The book was **published before 1950** **and the genre name contains the word 'Fantasy'**.

The results should be **ordered by the book title in ascending order**, and **then by the year published in descending** order.

Required columns:

- **Title**
- **Year**
- **Genre**
### **Example**

|**Title**|**Year**|**Genre**|
| :-: | :-: | :-: |
|Educated|2018|Memoir|
|The Great Alone|2018|Historical Fiction|
|The Hobbit|1937|Fantasy|
1. ## **Authors from the UK**
Your task is to write a query to **select all authors from the UK** (their PostAddress contains 'UK'). The address information is stored in the Contacts table under the PostAddress column. The results should be **ordered by the author's name in ascending order**.

Required columns:

- **Author**
- **Email**
- **Address**
### **Example**

|**Author**|**Email**|**Address**|
| :-: | :-: | :-: |
|J.K. Rowling|jk@example.com|100 Kings Rd, London, UK|
|J.R.R. Tolkien|jrr@example.com|221B Baker St, London, UK|
1. ## **Fictions in Denver**
<a name="_hlk83282235"></a>Your task is to write a query to **select details for books of a specific genre -'Fiction', and are sold in libraries located in Denver - their PostAddress contains 'Denver'**. **Order** the result **by book title** – alphabetically.

Required columns:

- **Author**
- **Title**
- **Library**
- **Library Address**
### **Example**

|**Author**|**Title**|**Library**|**Library Address**|
| :-: | :-: | :-: | :-: |
|Charles Dickens|A Tale of Two Cities|Tattered Cover|2526 E Colfax Ave, Denver, CO|
|Charles Dickens|Great Expectations|Tattered Cover|2526 E Colfax Ave, Denver, CO|
# **Section 4. Programmability (20 pts)**
1. ## **Authors with Books**
Create a user-defined function, named **udf\_AuthorsWithBooks(@name)** that receives an author's name.

- The function will accept an **author's name as a parameter**
- It will join the relevant tables to **count the total number of books by that author available in all libraries**
### **Example**

|**Query**|
| :-: |
|**SELECT dbo.udf\_AuthorsWithBooks('J.K. Rowling')**|
|**Output**|
|**3**|
1. ## **Search for Books from a Specific Genre**
Create a **stored procedure**, named **usp\_SearchByGenre(@genreName)** that receives a genre name as a parameter. The procedure must print full information about **all books that belong to the specific genre**.** Order them by **book title – alphabetically**.

Required columns:

- **Title**
- **Year**
- **ISBN**
- **Author**
- **Genre**
### **Example**

|**Query**|||||
| :-: | :- | :- | :- | :- |
|**EXEC usp\_SearchByGenre 'Fantasy'**|||||
|**Output**|||||
|**Title**|**Year**|**ISBN**|**Author**|**Genre**|
|Harry Potter and the Chamber of Secrets|1998|9780747538493|J.K. Rowling|Fantasy|
|Harry Potter and the Prisoner of Azkaban|1999|9780747542155|J.K. Rowling|Fantasy|
|…|…|…|…|…|





![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.004.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.005.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.006.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.007.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.008.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.009.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.010.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.011.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.012.png)


![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.002.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.003.png)![Logo

Description automatically generated](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.013.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.014.png)![](Aspose.Words.9f6a539c-8479-48a7-9e01-93b7d114c5e1.015.png)

