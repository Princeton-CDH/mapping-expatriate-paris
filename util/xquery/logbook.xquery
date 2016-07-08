declare namespace tei="http://www.tei-c.org/ns/1.0";



for $event in //tei:event[@type = 'subscription']
let $start := $event/ancestor::tei:div[@type = 'day']/tei:head/tei:date/@when-iso
let $duration := $event//tei:measure[@type='duration']
let $durstring :=
	concat('P', $duration/@quantity, 'M')
let $end-old := xs:date($start) + xs:yearMonthDuration("P1M")
let $end := xs:date($start) + xs:yearMonthDuration($durstring)
return
	<subscription subscriber = "{$event//tei:persName/@ref}"
	start="{$start}" end="{$end}">
	</subscription>