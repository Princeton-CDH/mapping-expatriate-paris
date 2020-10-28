declare namespace tei="http://www.tei-c.org/ns/1.0";
(: 
find lending card transcription documents that have person names in the card header
*without* a reference id 
:)


(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $cardholder := $doc//tei:div[@type="card"]//tei:head/tei:persName[not(@ref)]
where count($cardholder) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($cardholder) }</total>
{distinct-values($cardholder)}
</document>