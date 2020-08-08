

SELECT deliveryProcess.processId, Zips.zip, Zips.city
FROM deliveryProcess
INNER JOIN addresses on addresses.address = deliveryProcess.pickupAddress
INNER JOIN Zips on Zips.zip = addresses.zip
WHERE Zips.city = "Vienna";


SELECT customer.customerFirstName as senderFirstName, customer.customerLastName as senderLastName, deliveryProcess.processId, deliveryProcess.pickupTime FROM deliveryProcess 
INNER JOIN customer ON customer.customerId = deliveryProcess.senderId 
WHERE deliveryProcess.pickupTime < "2020-07-01";


SELECT customer.customerFirstName as senderFirstName, customer.customerLastName as senderLastName, deliveryProcess.processId, deliveryProcess.pickupTime FROM deliveryProcess 
INNER JOIN customer ON customer.customerId = deliveryProcess.senderId 
WHERE deliveryProcess.pickupTime < "2020-07-02" AND deliveryProcess.pickupTime > "2020-03-01";



SELECT deliveryProcess.processId, packageKind.packageKindName, customer.customerFirstName AS recipientFirstName, customer.customerLastName AS recipientLastName, counties.country AS recipientCountry, counties.WorldZone, prices.price
FROM deliveryProcess
INNER JOIN packageKind on packageKind.packageKindId = deliveryProcess.packageKindId
INNER JOIN customer on customer.customerId = deliveryProcess.recipientId
INNER JOIN addresses on addresses.address = customer.customerAddress
INNER JOIN Zips on Zips.zip = addresses.zip
INNER JOIN cities on cities.city = Zips.city
INNER JOIN counties on counties.county = cities.county
INNER JOIN worldZones on worldZones.deliveryKind = counties.WorldZone
INNER JOIN prices on prices.worldZoneId = worldZones.zoneId AND prices.packageKindId = packageKind.packageKindId;


SELECT deliveryProcess.senderId, customer.customerFirstName, customer.customerLastName, count(*)
AS amountDeliveries from deliveryProcess
JOIN customer ON customer.customerId = deliveryProcess.senderId
group by senderId;


SELECT 
deliveryProcess.processId,
deliveryProcess.pickupTime,
deliveryProcess.deliveryTime,
deliveryProcess.pickupAddress,
sender.customerId AS senderId,
sender.customerFirstName AS senderFirstName,
sender.customerLastName AS senderLastName,
sender.customerNumber AS senderPhone,
sender.customerEmail AS senderEmail,
sender.customerAddress AS senderAddress,
senderAddresses.zip AS senderZIP,
senderZips.city AS senderCity,
senderCities.county AS senderCounty,
senderCounties.country AS senderCountry,
senderCounties.WorldZone AS senderWorldZone,
senderWorldZones.zoneId AS senderWorldZoneId,
recipient.customerId AS recipientId,
recipient.customerFirstName AS recipientFirstName,
recipient.customerLastName AS recipientLastName,
recipient.customerNumber AS recipientPhone,
recipient.customerEmail AS recipientEmail,
recipient.customerAddress AS recipientAddress,
recipientAddresses.zip AS recipientZIP,
recipientZips.city AS recipientCity,
recipientCities.county AS recipientCounty,
recipientCounties.country AS recipientCountry,
recipientCounties.WorldZone AS recipientWorldZone,
recipientWorldZones.zoneId AS recipientWorldZoneId,
employee.employeeId,
employee.employeeFirstName,
employee.employeeLastName,
employee.employeePhone,
employee.employeeEmail,
employee.employeeAddress,
employeeAddresses.zip AS employeeZIP,
employeeZips.city AS employeeCity,
employeeCities.county AS employeeCounty,
employeeCounties.country AS employeeCountry,
employeeCounties.WorldZone AS employeeWorldZone,
employeeWorldZones.zoneId AS employeeWorldZoneId,
employee.PostofficeId,
Postoffice.PostofficeAddress,
PostofficeAddresses.zip AS PostofficeZIP,
PostofficeZips.city AS PostofficeCity,
PostofficeCities.county AS PostofficeCounty,
PostofficeCounties.country AS PostofficeCountry,
PostofficeCounties.WorldZone AS PostofficeWorldZone,
PostofficeWorldZones.zoneId AS PostofficeWorldZoneId,
deliveryProcess.packageKindId,
packageKind.packageKindName,
prices.price
FROM deliveryProcess
JOIN customer sender
ON sender.customerId = deliveryProcess.senderId
JOIN customer recipient
ON recipient.customerId = deliveryProcess.recipientId
JOIN addresses senderAddresses
ON senderAddresses.address = sender.customerAddress
JOIN Zips senderZips
ON senderZips.zip = senderAddresses.zip
JOIN cities senderCities
ON senderCities.city = senderZips.city
JOIN counties senderCounties
ON senderCounties.county = senderCities.county
JOIN worldZones senderWorldZones
ON senderWorldZones.deliveryKind = senderCounties.WorldZone
JOIN addresses recipientAddresses
ON recipientAddresses.address = recipient.customerAddress
JOIN Zips recipientZips
ON recipientZips.zip = recipientAddresses.zip
JOIN cities recipientCities
ON recipientCities.city = recipientZips.city
JOIN counties recipientCounties
ON recipientCounties.county = recipientCities.county
JOIN worldZones recipientWorldZones
ON recipientWorldZones.deliveryKind = recipientCounties.WorldZone
JOIN employee
on employee.employeeId = deliveryProcess.employeeId
JOIN addresses employeeAddresses
ON employeeAddresses.address = employee.employeeAddress
JOIN Zips employeeZips
ON employeeZips.zip = employeeAddresses.zip
JOIN cities employeeCities
ON employeeCities.city = employeeZips.city
JOIN counties employeeCounties
ON employeeCounties.county = employeeCities.county
JOIN worldZones employeeWorldZones
ON employeeWorldZones.deliveryKind = employeeCounties.WorldZone
JOIN Postoffice
ON Postoffice.PostofficeId = employee.PostofficeId
JOIN addresses PostofficeAddresses
ON PostofficeAddresses.address = Postoffice.PostofficeAddress
JOIN Zips PostofficeZips
ON PostofficeZips.zip = PostofficeAddresses.zip
JOIN cities PostofficeCities
ON PostofficeCities.city = PostofficeZips.city
JOIN counties PostofficeCounties
ON PostofficeCounties.county = PostofficeCities.county
JOIN worldZones PostofficeWorldZones
ON PostofficeWorldZones.deliveryKind = PostofficeCounties.WorldZone
JOIN packageKind
ON packageKind.packageKindId = deliveryProcess.packageKindId
JOIN prices on prices.worldZoneId = recipientWorldZones.zoneId AND prices.packageKindId = packageKind.packageKindId;