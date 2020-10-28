declare namespace tei="http://www.tei-c.org/ns/1.0";

(: note: configure saxon to not add default attributes to output using config file as documented :)
(: here https://www.oxygenxml.com/forum/topic5293.html :)

(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')

let $borrow := $doc//tei:ab[@ana="#borrowingEvent"][.//tei:del/tei:bibl]
where count($borrow) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($borrow) }</total>
{$borrow}
</document>