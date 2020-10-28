declare namespace tei="http://www.tei-c.org/ns/1.0";
(: 
identify lending card transcription documents that have multiple different cardholders 
based on names in the head of each card 
:)


(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $cardholder := $doc//tei:div[@type="card"]//tei:head/tei:persName[not(@ref='#beac.sy')]
where count(distinct-values($cardholder/@ref)) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($cardholder) }</total>
{distinct-values($cardholder/@ref)}
</document>