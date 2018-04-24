declare namespace tei="http://www.tei-c.org/ns/1.0";

(: find card sides with more than one tagged name in the head of the card :)

(: path is relative to file location in utils/xquery :) 
for $doc in collection('../../transcriptions/cards?select=*.xml;recurse=yes')
let $cards := $doc//tei:div[@type="card"]/tei:div[count(distinct-values(.//tei:head/tei:persName/@ref)) > 1]
(: find cards with more than one persname reference in the head :) 
where count($cards) > 0
return <document>
<filename>{ document-uri($doc) }</filename>{
for $card in $cards
return 
    <div type="{ $card/@type }">
    { $card//tei:pb }
    { $card//tei:head }
    </div>
 }
</document>