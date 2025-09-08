# Library Management System

## Databse Project Overview
This project contains the **schema** for a Library Management System.  
The goal is to help a library maintain an **organized system** that makes it easy to:
- Track registered **members** and their activities.
- Manage **books** in stock and their status (Available, Borrowed, or Missing).
- Store details of **librarians** and their work shifts.
- Record **borrowing activities** (who borrowed what, when, and from which librarian).

---

## Structure of the Database
### 1. **Librarians Table**
Stores information about all librarians working in the library.  
**Columns include:**
- `lib_id` – Unique librarian ID.  
- `first_name`, `last_name` – Librarian’s name.  
- `work_email`, `phone` – Contact details.  
- `resumption_date` – Date the librarian started working.

### 2. **Members Table**
Stores details of all registered library members.  
**Columns include:**
- `membership_id` – Unique ID for each member.  
- `first_name`, `last_name` – Member’s name.  
- `date_of_birth`, `gender` – Personal info (gender limited to *Male* or *Female*).  
- `email`, `phone` – Contact info (email must be unique).  
- `city` – Member’s city (2-character code).  
- `date_of_reg` – Registration date.  
- `membership_status` – Status of the membership (e.g., Active, Expired).

### 3. **Books Table**
Keeps records of all books in the library.  
**Columns include:**
- `book_id` – Unique ID for each book.  
- `book_title`, `author`, `publisher` – Book details.  
- `isbn` – International Standard Book Number.  
- `year_of_publication` – Year the book was published.  
- `genre` – Type of book (e.g., Fiction, Non-Fiction).  
- `status` – Book availability (*Available*, *Borrowed*, *Missing*).

### 4. **Borrowing Table**
Tracks the borrowing activities in the library.  
**Columns include:**
- `borrow_STAMP` – Unique borrowing record ID.  
- `membership_id` – References the **Members** table.  
- `book_id` – References the **Books** table.  
- `lib_id` – References the **Librarians** table.  
- `checkout_date` – When the book was borrowed.  
- `due_date` – When the book is expected to be returned.

---

## 🚀 Features Supported
- Add and manage members.  
- Add and manage librarians.  
- Record and update books with their availability status.  
- Track which member borrowed which book and from which librarian.  

---

## 📌 Notes
- The schema uses **constraints** like `PRIMARY KEY`, `UNIQUE`, and `CHECK` to maintain data integrity.  
- Relationships between tables are established using **FOREIGN KEYS**.  
- You can extend the schema by adding more tables (e.g., Fines, Reservations).  

