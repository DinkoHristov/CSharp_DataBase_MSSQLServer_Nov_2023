UPDATE Contacts
SET Contacts.Website = CONCAT('www.', REPLACE(LOWER(Authors.Name), ' ', ''), '.com')
FROM Contacts
JOIN Authors ON Authors.ContactId = Contacts.Id
WHERE Contacts.Website IS NULL