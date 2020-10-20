declare namespace tei="http://www.tei-c.org/ns/1.0";

(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $borrow := $doc//tei:ab[@ana="#borrowingEvent"][not(tei:date/@ana="#returned")]
where count($borrow) > 1
return <document>
<filename>{ document-uri($doc) }</filename>
<total>{ count($borrow) }</total>
{$borrow}
</document>