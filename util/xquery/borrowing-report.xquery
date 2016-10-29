declare namespace tei="http://www.tei-c.org/ns/1.0";

let $cardpath       := '/db/mep-data/transcriptions/cards'
let $core-titles    := ('mep:001p1r', 'mep:004j77', 'mep:002m04', 'mep:000r12', 'mep:002z2h')
let $core-cards:= collection($cardpath)//tei:TEI[.//tei:bibl[@corresp = $core-titles]]

for $card in $core-cards
let $person := $card//tei:person[@role='cardholder']
let $borrowed-items := $card//tei:bibl[@ana='#borrowedItem']
let $borrowing-events := $card//tei:ab[@ana='#borrowingEvent']
order by count($borrowed-items)
return
    <record>
        <name>{ $person[1]/tei:persName/text() }</name>
        <id>{ xs:string($person[1]/@ana) }</id>
        <borrowed-items>{ count($borrowed-items) }</borrowed-items>
        <borrowing-events>{ count($borrowing-events) }</borrowing-events>
    </record>
