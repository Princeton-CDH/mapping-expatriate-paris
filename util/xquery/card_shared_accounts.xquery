declare namespace tei="http://www.tei-c.org/ns/1.0";

(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $cardholder := $doc//tei:person[@role="cardholder"]
where count($cardholder) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($cardholder) }</total>
{$cardholder}
</document>