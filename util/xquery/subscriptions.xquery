xquery version "3.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare namespace local="http://cew.org";

declare function local:duration($event)
{
    let $event-duration := $event//tei:measure[@type='duration']
    let $unit := $event-duration/@unit
    let $quantity :=  $event-duration/@quantity
    return
    switch($unit)
        case "month" return xs:yearMonthDuration(concat('P', $quantity, 'M'))
        case "year" return xs:yearMonthDuration(concat('P', $quantity, 'Y'))
        case "day" return xs:dayTimeDuration(concat('P', $quantity, 'D'))
        default return error((), "invalid duration unit")
};


for $event in //tei:event[(@type = 'subscription' or @type='renewal') and exists(.//tei:measure[@type='duration'])]
let $start := $event/ancestor::tei:div[@type = 'day'][1]/tei:head/tei:date/@when-iso
let $duration := local:duration($event)
return
	<subscription subscriber = "{$event//tei:persName/@ref}"
	start="{$start}" end="{xs:date($start) + $duration}">
	</subscription>