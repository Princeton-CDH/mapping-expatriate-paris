<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:rule context="tei:note/tei:date">
            <sch:assert
                test="
                    not(
                    contains(@ana, '#checkedOut')
                    or
                    contains(@ana, '#returned')
                    )"
                >should not have checkedOut or returned anas.</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="tei:ab[@ana = '#borrowingEvent']">
            <sch:assert test="count(.//tei:bibl[@ana = '#borrowedItem']) = 1"> borrowing event
                should contain one and only one borrowed item </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>

        <sch:rule context="tei:ab[@ana = '#borrowingEvent']">
            <sch:assert test="count(.//tei:date[@ana = '#checkedOut']) &lt; 2"> borrowing event
                cannot include more than one checkout date </sch:assert>
        </sch:rule>

    </sch:pattern>

    <sch:pattern>
        <sch:rule context="tei:ab[@ana = '#borrowingEvent']">
            <sch:assert test="count(.//tei:date[@ana = '#returned']) &lt; 2"> borrowing event cannot
                include more than one returned date </sch:assert>
        </sch:rule>
    </sch:pattern>


</sch:schema>
