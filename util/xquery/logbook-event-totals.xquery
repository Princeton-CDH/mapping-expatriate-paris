xquery version "1.0";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
(: todo: figure out how to generate relative path :)
let $docs := collection("file:///Users/rsk/workarea/github/mep/transcriptions/logbooks/?select=*.xml") 
return <total>
    <all>{ count($docs//tei:event) }</all>
    <subscriptions>{ count($docs//tei:event[@type="subscription"]) }</subscriptions>
    <renewals>{ count($docs//tei:event[@type="renewal"]) }</renewals>
    <reimbursement>{ count($docs//tei:event[@type="reimbursement"]) }</reimbursement>
    <supplement>{ count($docs//tei:event[@type="supplement"]) }</supplement>
    <overdue>{ count($docs//tei:event[@type="overdue"]) }</overdue>
    <person_no_id>{ count($docs//tei:event[.//tei:persName[not(@ref)]]) }</person_no_id>
    <no_person>{ count($docs//tei:event[not(.//tei:persName)]) }</no_person>
    </total>