xquery version "3.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $project_root as xs:string external;

let $personography := concat($project_root, '/transcriptions/personography.xml')

let $registered_people := doc($personography)//tei:person


for $p in //tei:persName
let $ref := substring-after(xs:string($p/@ref), '#')
let $hit := doc($personography)//tei:person[@xml:id = $ref]
where empty($hit)
return <unregistered>{$ref}</unregistered>
