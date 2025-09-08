USE [Library System];

-- 1. List all members’ full names.

SELECT 
    first_name,
    last_name 
FROM dbo.Members;

---2. Count how many members are male and female.

SELECT gender, COUNT(*) AS count
FROM Members
GROUP BY gender;

-- 3. Show all borrowings for a specific member (`membership_id = 'M12'`).
SELECT *
FROM Borrowing
WHERE membership_id = 'M12';

-- 4. Find all members who have never borrowed a book.
SELECT *
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Borrowing b
    WHERE b.membership_id = m.membership_id
);

-- 5. List all borrowings where the return date is after the borrow date.
SELECT *
FROM Borrowing
WHERE due_date > checkout_date;

-- 6. Count how many books each member has borrowed.
SELECT 
    membership_id, 
    COUNT(*) AS books_borrowed
FROM Borrowing
GROUP BY membership_id;

-- 7. Find the most recent borrowing for each member.
SELECT 
    membership_id, 
    MAX(checkout_date) AS last_borrowed
FROM Borrowing
GROUP BY membership_id;

-- 8. Find members who borrowed a specific book (`book_id = 'B001'`).**
SELECT 
    m.membership_id, 
    m.first_name, 
    m.last_name
FROM Members m
JOIN Borrowing b 
    ON m.membership_id = b.membership_id
WHERE b.book_id = 'B017';

-- 9. Show the number of borrowings per day.**
SELECT 
    checkout_date, 
    COUNT(*) AS borrow_count
FROM Borrowing
GROUP BY checkout_date
ORDER BY checkout_date;

