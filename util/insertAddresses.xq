xquery version "3.0";


declare namespace tei="http://www.tei-c.org/ns/1.0";

let $cards := collection('/db/mep-data/transcriptions')//tei:TEI[tei:teiHeader//tei:classCode='300026802']
for $card in $cards
    let $subscriber := $card/tei:teiHeader//tei:particDesc/tei:person[@role = 'cardholder']
    let $key := $subscriber[1]/@ana
    let $key := fn:replace($key, "^#?(.*)$", "$1")
    let $pentry := doc('/db/mep-data/transcriptions/personography.xml')//tei:person[@xml:id = $key]
    let $addresses := $card/tei:text/tei:body//tei:head//tei:address
    for $address in $addresses 
    let $residence := 
        <residence type="new">{ $address }</residence>
    return 
    update insert $residence following $pentry/tei:persName
    
    