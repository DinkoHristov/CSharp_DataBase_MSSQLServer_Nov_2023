SELECT Authors.Name, Contacts.Email, Contacts.PostAddress
FROM Authors
JOIN Contacts ON Authors.ContactId = Contacts.Id
WHERE Contacts.PostAddress LIKE '%UK%'
ORDER BY Authors.Name ASC