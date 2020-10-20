declare namespace tei="http://www.tei-c.org/ns/1.0";

(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $borrow := $doc//tei:ab[@ana="#borrowingEvent"]
(: look for any 190* dates, to catch 1900 as well as 1901 and 1902 :)
let $borrow_dates := $borrow/tei:date[starts-with(@when, '190')]
where count($borrow_dates) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($borrow) }</total>
{$borrow}
</document>